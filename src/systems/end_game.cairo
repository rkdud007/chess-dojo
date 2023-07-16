#[system]
mod end_game_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn};

    fn execute(ctx: Context, game_id: felt252, caller: ContractAddress, winner: PieceColor) {
        let current_game = get !(ctx.world, game_id.into(), (Game));
    //

    }
}
