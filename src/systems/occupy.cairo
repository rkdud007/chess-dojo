#[system]
mod occupy_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece};

    fn execute(ctx: Context, piece_id: felt252, game_id: felt252) {
        //change status of piece to dead
        let mut piece = get!(ctx.world, (game_id, piece_id), (Piece));
        piece.is_alive = false;
        set!(ctx.world, (piece));
    }
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece};
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::occupy_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;

    #[test]
    #[available_gas(3000000000000000)]
    fn test_occupy() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        // components
        let mut components = array::ArrayTrait::new();
        components.append(piece::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);
        systems.append(occupy_system::TEST_CLASS_HASH);
        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata);

        let game_id = pedersen(white.into(), black.into());

        let occupied_piece_id: felt252 = 'white_pawn_1'.into();

        let white_pawn_1 = get!(world, (game_id, occupied_piece_id), (Piece));
        assert(white_pawn_1.is_alive == true, 'Should be alive');

        let mut kill_piece_calldata = array::ArrayTrait::<core::felt252>::new();
        kill_piece_calldata.append(occupied_piece_id);
        kill_piece_calldata.append(game_id);
        world.execute('occupy_system'.into(), kill_piece_calldata);

        let white_pawn_1 = get!(world, (game_id, occupied_piece_id), (Piece));
        assert(white_pawn_1.is_alive == false, 'Should be occupied');
    }
}
