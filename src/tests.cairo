#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece, Game, game, GameTurn, game_turn, Position, position};
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::execute_move_system;
    use dojo_chess::systems::give_up_system;
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
        components.append(position::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);
        systems.append(execute_move_system::TEST_CLASS_HASH);
        systems.append(give_up_system::TEST_CLASS_HASH);
        let world = spawn_test_world(components, systems);

        // initiate the game and pieces
        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append('gameid'.into());
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata.span());

        let game = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());
        let white_pawn_1_position = world
            .entity('Position', 'white_pawn_1'.into(), 0, dojo::SerdeLen::<Position>::len());

        let black_pawn_2 = world
            .entity('Piece'.into(), 'black_pawn_2'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());
        let black_pawn_2_position = world
            .entity('Position', 'black_pawn_2'.into(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position.at(1_usize) == 1, 'pawn1 position y is wrong');

        //Black pawn is now in (1,6)
        assert(*black_pawn_2_position.at(0_usize) == 1, 'pawn2 position x is wrong');
        assert(*black_pawn_2_position.at(1_usize) == 6, 'pawn2 position y is wrong');

        // white_pawn_1 move to up 2
        //Move White Pawn to (0,2)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('white_pawn_1');
        move_calldata.append(0);
        move_calldata.append(2);
        move_calldata.append(white.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        // white_pawn_1 move to up 2
        //Move black Pawn to (1,5)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('black_pawn_2');
        move_calldata.append(1);
        move_calldata.append(5);
        move_calldata.append(black.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        // white_pawn_1 move to up 2
        //Move White Pawn to (0,3)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('white_pawn_1');
        move_calldata.append(0);
        move_calldata.append(3);
        move_calldata.append(white.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        // white_pawn_1 move to up 2
        //Move black Pawn to (1,4)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('black_pawn_2');
        move_calldata.append(1);
        move_calldata.append(4);
        move_calldata.append(black.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        // white_pawn_1 move to up 2
        //Move White Pawn to (1,4)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('white_pawn_1');
        move_calldata.append(1);
        move_calldata.append(4);
        move_calldata.append(white.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');

        let black_pawn_2 = world
            .entity('Piece'.into(), 'black_pawn_2'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        assert(*black_pawn_2.at(2_usize) == 0_felt252, 'black pawn should die');

        //white give up
        let mut giveup_calldata = array::ArrayTrait::<core::felt252>::new();
        giveup_calldata.append('gameid'.into());
        giveup_calldata.append(white.into());
        world.execute('give_up_system'.into(), giveup_calldata.span());

        let game_update = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        assert(*game_update.at(0_usize) == 0_felt252, 'game end');
    }
}
