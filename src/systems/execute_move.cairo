#[system]
mod execute_move_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn, PlayersId};

    fn execute(
        ctx: Context,
        game_id: felt252,
        entity_name: felt252,
        new_position: Position,
        caller: ContractAddress
    ) {
        let (piece, current_position) = get !(ctx.world, entity_name.into(), (Piece, Position));
        let current_game_turn = get !(ctx.world, game_id.into(), (GameTurn));
        let player_id = get !(ctx.world, game_id.into(), (PlayersId));
        assert(
            (player_id.white == caller && piece.color == PieceColor::White(()))
                || (player_id.black == caller && piece.color == PieceColor::Black(())),
            'Not your piece'
        );
        assert(current_game_turn.turn == piece.color, 'Not your turn');
        assert(!is_out_of_bounds(new_position), 'Out of bounds');
        assert(check_position_is_valid(piece, current_position, new_position), 'Out of bounds');
        set !(ctx.world, entity_name.into(), (Position { x: new_position.x, y: new_position.y }, ));
        let next_turn = match current_game_turn.turn {
            PieceColor::White(()) => PieceColor::Black(()),
            PieceColor::Black(()) => PieceColor::White(()),
        };
        set !(ctx.world, game_id.into(), (GameTurn { turn: next_turn }, ));
        return ();
    }


    fn is_out_of_bounds(new_pos: Position) -> bool {
        if new_pos.x > 7 || new_pos.x < 0 {
            return true;
        }
        if new_pos.y > 7 || new_pos.y < 0 {
            return true;
        }
        false
    }

    fn check_position_is_valid(piece: Piece, current_pos: Position, new_pos: Position) -> bool {
        match piece.kind {
            PieceKind::Pawn(()) => {
                match piece.color {
                    PieceColor::White(()) => {
                        if (current_pos.x == new_pos.x && current_pos.y + 1 == new_pos.y) {
                            true
                        } else {
                            false
                        }
                    },
                    PieceColor::Black(()) => {
                        if (current_pos.x == new_pos.x && current_pos.y - 1 == new_pos.y) {
                            true
                        } else {
                            false
                        }
                    },
                }
            },
            PieceKind::Knight(()) => {
                if (current_pos.x + 2 == new_pos.x && current_pos.y + 1 == new_pos.y) {
                    true
                } else if (current_pos.x + 2 == new_pos.x && current_pos.y - 1 == new_pos.y) {
                    true
                } else if (current_pos.x - 2 == new_pos.x && current_pos.y + 1 == new_pos.y) {
                    true
                } else if (current_pos.x - 2 == new_pos.x && current_pos.y - 1 == new_pos.y) {
                    true
                } else if (current_pos.x + 1 == new_pos.x && current_pos.y + 2 == new_pos.y) {
                    true
                } else if (current_pos.x + 1 == new_pos.x && current_pos.y - 2 == new_pos.y) {
                    true
                } else if (current_pos.x - 1 == new_pos.x && current_pos.y + 2 == new_pos.y) {
                    true
                } else if (current_pos.x - 1 == new_pos.x && current_pos.y - 2 == new_pos.y) {
                    true
                } else {
                    false
                }
            },
            PieceKind::Bishop(()) => {
                if (current_pos.x - new_pos.x) == (current_pos.y - new_pos.y) {
                    true
                } else {
                    false
                }
            },
            PieceKind::Rook(()) => {
                if (current_pos.x == new_pos.x) || (current_pos.y == new_pos.y) {
                    true
                } else {
                    false
                }
            },
            PieceKind::Queen(()) => {
                if (current_pos.x == new_pos.x)
                    || (current_pos.y == new_pos.y)
                    || ((current_pos.x - new_pos.x) == (current_pos.y - new_pos.y)) {
                    true
                } else {
                    false
                }
            },
            PieceKind::King(()) => {
                if (current_pos.x == new_pos.x && current_pos.y + 1 == new_pos.y) {
                    true
                } else if (current_pos.x == new_pos.x && current_pos.y - 1 == new_pos.y) {
                    true
                } else if (current_pos.x + 1 == new_pos.x && current_pos.y == new_pos.y) {
                    true
                } else if (current_pos.x - 1 == new_pos.x && current_pos.y == new_pos.y) {
                    true
                } else if (current_pos.x + 1 == new_pos.x && current_pos.y + 1 == new_pos.y) {
                    true
                } else if (current_pos.x + 1 == new_pos.x && current_pos.y - 1 == new_pos.y) {
                    true
                } else if (current_pos.x - 1 == new_pos.x && current_pos.y + 1 == new_pos.y) {
                    true
                } else if (current_pos.x - 1 == new_pos.x && current_pos.y - 1 == new_pos.y) {
                    true
                } else {
                    false
                }
            },
        }
    }
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece, Game, game, Position, position};
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::execute_move_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;

    #[test]
    #[available_gas(3000000000000000)]
    fn init() {
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
        systems.append(execute_move_system::TEST_CLASS_HASH);

        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata.span());

        let game = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let black_pawn_1 = world
            .entity('Piece'.into(), 'black_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let white_pawn_1_position = world
            .entity('Position', 'white_pawn_1'.into(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position.at(1_usize) == 1, 'pawn1 position y is wrong');

        //Move White Pawn to (0,2)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('white_pawn_1');
        move_calldata.append(0);
        move_calldata.append(2);
        move_calldata.append(white.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        //not your turn
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('black_pawn_1');
        // move black pawn to (0,5)
        move_calldata.append(0);
        move_calldata.append(5);
        move_calldata.append(black.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        let white_pawn_1_position_again = world
            .entity('Position', 'white_pawn_1'.into(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position_again.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position_again.at(1_usize) == 2, 'pawn1 position y is wrong');

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');
    }
}
