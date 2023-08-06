use array::ArrayTrait;
use starknet::ContractAddress;
use debug::PrintTrait;

#[derive(Component, Copy, Drop, Serde)]
struct Square {
    #[key]
    game_id: ContractAddress,
    #[key]
    square_id: felt252,
    piece_id: Option<felt252>,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Piece {
    #[key]
    game_id: ContractAddress,
    #[key]
    piece_id: felt252,
    kind: PieceKind,
    color: PieceColor,
    is_alive: bool,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen, PartialEq)]
struct Position {
    #[key]
    game_id: ContractAddress,
    #[key]
    piece_id: felt252,
    x: u32,
    y: u32
}

#[derive(Copy, Drop, Serde)]
enum PieceKind {
    Pawn: (),
    Knight: (),
    Bishop: (),
    Rook: (),
    Queen: (),
    King: ()
}

impl SquareSerdeLen of dojo::SerdeLen<Square> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
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

impl PieceColorPrintTrait of PrintTrait<PieceColor> {
    #[inline(always)]
    fn print(self: PieceColor) {
        match self {
            PieceColor::White(_) => {
                'White'.print();
            },
            PieceColor::Black(_) => {
                'Black'.print();
            },
        }
    }
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
struct PlayersId {
    #[key]
    game_id: ContractAddress,
    white: ContractAddress,
    black: ContractAddress,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Game {
    #[key]
    game_id: ContractAddress,
    status: bool,
    winner: Option<PieceColor>,
}


#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct GameTurn {
    #[key]
    game_id: ContractAddress,
    turn: PieceColor,
}
