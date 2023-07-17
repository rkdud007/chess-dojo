#[system]
mod kill_piece_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn};

    fn execute(ctx: Context, entity_name: felt252) { //change status of piece to dead
        let piece = get !(ctx.world, entity_name.into(), (Piece));
        set !(
            ctx.world,
            entity_name.into(),
            (Piece { kind: piece.kind, color: piece.color, is_alive: false })
        );
    }
}


#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{
        Piece, piece, Game, game, GameTurn, game_turn, PlayersId, players_id
    };
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::give_up_system;
    use dojo_chess::systems::kill_piece_system;
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
        components.append(game_turn::TEST_CLASS_HASH);
        components.append(players_id::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);
        systems.append(give_up_system::TEST_CLASS_HASH);
        systems.append(kill_piece_system::TEST_CLASS_HASH);

        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append('gameid'.into());
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata.span());

        let game = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let mut kill_piece_calldata = array::ArrayTrait::<core::felt252>::new();
        kill_piece_calldata.append('white_pawn_1'.into());
        world.execute('kill_piece_system'.into(), kill_piece_calldata.span());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        assert(*white_pawn_1.at(2_usize) == 0_felt252, 'die');

        let mut giveup_calldata = array::ArrayTrait::<core::felt252>::new();
        giveup_calldata.append('gameid'.into());
        giveup_calldata.append(white.into());
        world.execute('give_up_system'.into(), giveup_calldata.span());

        let game_update = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        assert(*game_update.at(0_usize) == 0_felt252, 'game end');
    }
}
