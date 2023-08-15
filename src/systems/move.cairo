#[system]
mod move_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn};

    fn execute(ctx: Context, new_position: Position, caller: ContractAddress) {
        let game_id = new_position.game_id;
        let piece_name = new_position.piece_id;
        let (piece, mut current_position) = get!(
            ctx.world, (game_id, piece_name), (Piece, Position)
        );
        let (mut current_game_turn, current_game) = get!(ctx.world, game_id, (GameTurn, Game));

        assert(
            (current_game.white == caller && piece.color == PieceColor::White(()))
                || (current_game.black == caller && piece.color == PieceColor::Black(())),
            'Not your piece'
        );
        assert(current_game_turn.turn == piece.color, 'Not your turn');
        let new_x = new_position.x;
        let new_y = new_position.y;
        current_position.x = new_x;
        current_position.y = new_y;

        set!(ctx.world, (current_position));
        let next_turn = match current_game_turn.turn {
            PieceColor::White(()) => PieceColor::Black(()),
            PieceColor::Black(()) => PieceColor::White(()),
        };
        current_game_turn.turn = next_turn;
        set!(ctx.world, (current_game_turn));
        return ();
    }
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece, Game, game, Position, position};
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::move_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;


    #[test]
    #[available_gas(3000000000000000)]
    fn test_move() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        // components
        let mut components = array::ArrayTrait::new();
        components.append(piece::TEST_CLASS_HASH);
        components.append(game::TEST_CLASS_HASH);
        components.append(position::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);
        systems.append(move_system::TEST_CLASS_HASH);

        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata);

        let game_id = pedersen(white.into(), black.into());

        let mut keys_game = array::ArrayTrait::new();
        keys_game.append(game_id);

        let mut keys_piece = array::ArrayTrait::new();
        keys_piece.append(game_id);
        keys_piece.append('white_pawn_1'.into());

        let mut keys_piece2 = array::ArrayTrait::new();
        keys_piece2.append(game_id);
        keys_piece2.append('black_pawn_1'.into());
        let game = world
            .entity('Game'.into(), keys_game.span(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), keys_piece.span(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let black_pawn_1 = world
            .entity('Piece'.into(), keys_piece2.span(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let white_pawn_1_position = world
            .entity('Position', keys_piece.span(), 0, dojo::SerdeLen::<Position>::len());
        //White pawn is now in (0,1)
        assert(*white_pawn_1_position.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position.at(1_usize) == 1, 'pawn1 position y is wrong');
        //Move White Pawn to (0,2)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append(game_id);
        move_calldata.append('white_pawn_1');
        move_calldata.append(0);
        move_calldata.append(2);
        move_calldata.append(white.into());
        world.execute('move_system'.into(), move_calldata);

        let mut keys_piece = array::ArrayTrait::new();
        keys_piece.append(game_id);
        keys_piece.append('white_pawn_1'.into());
        let white_pawn_1_position_again = world
            .entity('Position', keys_piece.span(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position_again.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position_again.at(1_usize) == 2, 'pawn1 position y is wrong');
    }
}
