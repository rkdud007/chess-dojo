#[system]
mod execute_move_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn, PlayersId};
    use debug::PrintTrait;

    fn execute(
        ctx: Context, entity_name: felt252, new_position: Position, caller: ContractAddress
    ) {}
}
