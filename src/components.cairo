use array::ArrayTrait;
use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
enum PieceKind {
    Pawn: (),
    Knight: (),
    Bishop: (),
    Rook: (),
    Queen: (),
    King: ()
}

impl PieceKindSerdeLen of dojo::SerdeLen<PieceKind> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

#[derive(Copy, Drop, Serde, PartialEq)]
enum PieceColor {
    White: (),
    Black: (),
}

impl PieceColorSerdeLen of dojo::SerdeLen<PieceColor> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

impl OptionPieceColorSerdeLen of dojo::SerdeLen<Option<PieceColor>> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Piece {
    kind: PieceKind,
    color: PieceColor,
}


#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Position {
    x: u32,
    y: u32
}

#[derive(Copy, Drop, Serde)]
struct PlayersId {
    white: ContractAddress,
    black: ContractAddress,
}

impl PlayersIdSerdeLen of dojo::SerdeLen<PlayersId> {
    #[inline(always)]
    fn len() -> usize {
        2
    }
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Game {
    status: bool,
    players: PlayersId,
    turn: PieceColor,
    winner: Option<PieceColor>,
}

