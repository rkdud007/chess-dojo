#[system]
mod kill_piece_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn};

    fn execute(ctx: Context, entity_name: felt252) {//change status of piece to dead
    }
}
