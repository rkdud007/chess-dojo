use starknet::ContractAddress;
use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};
// #[starknet::interface]
// trait IInitiatesystem<ContractState> {
//     fn spawn_game(
//         self: @ContractState,
//         world: IWorldDispatcher,
//         white_address: ContractAddress,
//         black_address: ContractAddress,
//     );
// }

#[starknet::contract]
mod initiate_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};
    use starknet::ContractAddress;
    use dojo_chess::models::{Color, Square, PieceType, Game, GameTurn};
    use dojo_chess::systems::move::IPlayerActions;

    // no storage
    #[storage]
    struct Storage {}
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::world::{IWorldDispatcherTrait, IWorldDispatcher};
    use dojo::test_utils::{spawn_test_world, deploy_contract};
    use dojo_chess::models::{Game, GameTurn, Square, PieceType};
    use dojo_chess::models::{game, game_turn, square};
    use dojo_chess::systems::initiate_system;
    //use option::OptionTrait;

    use super::{
        IPlayerActionsDispatcher, IPlayerActionsDispatcherTrait, initiate_system as initiate_systems
    };

    // helper setup function
    // reusable function for tests
    fn setup_world() -> (IWorldDispatcher, IPlayerActionsDispatcher) {
        // models
        let mut models = array![
            game::TEST_CLASS_HASH, game_turn::TEST_CLASS_HASH, square::TEST_CLASS_HASH
        ];
        // deploy world with models
        let world = spawn_test_world(models);

        // deploy systems contract
        let contract_address = world
            .deploy_contract('salt', initiate_systems::TEST_CLASS_HASH.try_into().unwrap());
        let initate_system = IPlayerActionsDispatcher { contract_address };

        (world, initate_system)
    }


    #[test]
    #[available_gas(3000000000000000)]
    fn test_initiate() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        let (world, initate_system) = setup_world();

        //system calls
        initate_system.spawn_game(world, white, black);
        let game_id = pedersen::pedersen(white.into(), black.into());

        //get game
        let game = get!(world, (game_id), (Game));
        assert(game.white == white, 'white address is incorrect');
        assert(game.black == black, 'black address is incorrect');

        //get a1 square
        let a1 = get!(world, (game_id, 0, 0), (Square));
        assert(a1.piece == PieceType::WhiteRook, 'should be White Rook');
        assert(a1.piece != PieceType::None, 'should have piece');
    }
}
