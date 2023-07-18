use core::clone::Clone;
#[system]
mod give_up_system {
    use array::ArrayTrait;
    use traits::Into;
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn, PlayersId};

    fn execute(ctx: Context, game_id: felt252) {
        let current_game = get !(ctx.world, game_id.into(), (Game));
        assert(current_game.status, 'game is not active');
        let player_id = get !(ctx.world, game_id.into(), (PlayersId));
        let caller = ctx.origin;
        caller.print();
        100.print();
        assert(caller == player_id.white || caller == player_id.black, 'caller is not a player');
        if caller == player_id.white {
            set !(
                ctx.world,
                game_id.into(),
                (Game { status: false, winner: Option::Some(PieceColor::Black(())) })
            );
        } else if (caller == player_id.black) {
            set !(
                ctx.world,
                game_id.into(),
                (Game { status: false, winner: Option::Some(PieceColor::White(())) })
            );
        };
    }
}

#[cfg(test)]
mod tests {
    use starknet::{ContractAddress, get_caller_address};
    use starknet::testing::set_caller_address;
    use starknet::testing::set_account_contract_address;
    use dojo::test_utils::spawn_test_world;
    use debug::PrintTrait;
    use dojo_chess::components::{
        Piece, piece, Game, game, GameTurn, game_turn, PlayersId, players_id
    };
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::give_up_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;

    #[test]
    #[available_gas(3000000000000000)]
    fn giveup_test() {
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

        set_caller_address(white);
        let mut giveup_calldata = array::ArrayTrait::<core::felt252>::new();
        giveup_calldata.append('gameid'.into());
        world.execute('give_up_system'.into(), giveup_calldata.span());
        // let caller = get_caller_address();
        // assert(caller == white, 'caller is white');

        let game_update = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        assert(*game_update.at(0_usize) == 0_felt252, 'game end');
    }
}
