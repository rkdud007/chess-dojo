    use starknet::ContractAddress;
    use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};
   #[starknet::interface]
    trait IInitiatesystem<ContractState> {
    fn spawn_game(
        self: @ContractState,
        white_address: ContractAddress,
        black_address: ContractAddress,
    );
    }

#[starknet::contract]
mod initiate_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};
    use starknet::ContractAddress;
    use dojo_chess::models::{Color, Square, PieceType, Game, GameTurn};
    use super::IInitiatesystem;

    // no storage
    #[storage]
    struct Storage {
        world_dispatcher: IWorldDispatcher,
    }

     #[external(v0)]
    impl PlayerActionsImpl of IInitiatesystem<ContractState>{
        fn spawn_game(self: @ContractState, white_address: ContractAddress, black_address: ContractAddress) {
        let world = self.world_dispatcher.read();
        let game_id = pedersen::pedersen(white_address.into(), black_address.into());
        set!(
            world,
            (
                Game {
                    game_id: game_id,
                    winner: Option::None(()),
                    white: white_address,
                    black: black_address,
                    }, 
                GameTurn {
                    game_id: game_id, turn: Color::White(()), 
                },
            )
        );

        set!(
            world,
            (Square { game_id: game_id, x: 0, y: 0, piece: Option::Some(PieceType::WhiteRook) })
        );

        set!(
            world,
            (Square { game_id: game_id, x: 0, y: 1, piece: Option::Some(PieceType::WhitePawn) })
        );

        set!(
            world,
            (Square { game_id: game_id, x: 1, y: 6, piece: Option::Some(PieceType::BlackPawn) })
        );

        set!(
            world,
            (Square { game_id: game_id, x: 1, y: 0, piece: Option::Some(PieceType::WhiteKnight) })
        );
    }
    }

}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::world::{IWorldDispatcherTrait, IWorldDispatcher};
    use dojo::test_utils::{spawn_test_world, deploy_contract};
    use dojo_chess::models::{Game, GameTurn, Square,PieceType};
    use dojo_chess::models::{game, game_turn, square};
    use dojo_chess::systems::initiate_system;

    use super::{
        IInitiatesystemDispatcher, IInitiatesystemDispatcherTrait,
        initiate_system as initiate_systems
    };

    // helper setup function
    // reusable function for tests
    fn setup_world() -> (IWorldDispatcher, IInitiatesystemDispatcher) {
        // models
        let mut models = array![game::TEST_CLASS_HASH, game_turn::TEST_CLASS_HASH, square::TEST_CLASS_HASH];
         // deploy world with models
        let world = spawn_test_world(models);
        
        // deploy systems contract
        let contract_address = world
            .deploy_contract('salt', initiate_systems::TEST_CLASS_HASH.try_into().unwrap());
        let initate_system = IInitiatesystemDispatcher { contract_address };

        (world, initate_system)
    }


    #[test]
    #[available_gas(3000000000000000)]
    fn test_initiate() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        let (world, initate_system) = setup_world();

        //system calls
        initate_system.spawn_game(white,black);
        // let game_id = pedersen::pedersen(white.into(), black.into());

        // //get game
        // let game = get!(world, (game_id), (Game));
        // assert(game.white == white, 'white address is incorrect');
        // assert(game.black == black, 'black address is incorrect');

        // //get a1 square
        // let a1 = get!(world, (game_id, 0, 0), (Square));
        // match a1.piece {
        //     Option::Some(piece) => {
        //         assert(piece == PieceType::WhiteRook, 'should be White Rook');
        //     },
        //     Option::None(_) => assert(false, 'should have piece'),
        // };
    }
}
