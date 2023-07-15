use array::ArrayTrait;

#[derive(Copy, Drop, Serde)]
enum PieceKind {
    Pawn: (),
    Knight: (),
    Bishop: (),
    Rook: (),
    Queen: (),
    King: ()
}

#[derive(Copy, Drop, Serde, PartialEq)]
enum PieceColor {
    White: (),
    Black: (),
}

#[derive(Component, Copy, Drop, Serde)]
struct Piece {
    kind: PieceKind,
    side: PieceColor,
    position: Position
}

#[derive(Copy, Drop, Serde)]
struct Position {
    x: u32,
    y: u32
}

#[derive(Copy, Drop, Serde)]
struct PlayersId {
    white: u32,
    black: u32
}

#[derive(Component, Copy, Drop, Serde)]
struct Game {
    id: u32,
    // true is ongoing, false is finished
    status: bool,
    turn: PieceColor,
    players: PlayersId
}

