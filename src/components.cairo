use debug::PrintTrait;
use starknet::ContractAddress;

#[derive(Component, Drop, SerdeLen)]
struct Piece {
    #[key]
    game_id: felt252,
    #[key]
    piece_id: felt252,
    kind: PieceKind,
    color: PieceColor,
    is_alive: bool,
}

#[derive(Component, Drop, SerdeLen)]
struct Position {
    #[key]
    game_id: felt252,
    #[key]
    piece_id: felt252,
    x: u32,
    y: u32
}

#[derive(Serde, Drop)]
enum PieceColor {
    White,
    Black,
}

#[derive(Serde, Drop)]
enum PieceKind {
    Pawn,
    Knight,
    Bishop,
    Rook,
    Queen,
    King
}

impl PieceKindSerdeLen of dojo::SerdeLen<PieceKind> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
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

impl OptionPieceColorPrintTrait of PrintTrait<Option<PieceColor>> {
    #[inline(always)]
    fn print(self: Option<PieceColor>) {
        match self {
            Option::Some(PieceColor) => {
                PieceColor.print();
            },
            Option::None(_) => {
                'None'.print();
            },
        }
    }
}

impl PieceKindPrintTrait of PrintTrait<PieceKind> {
    #[inline(always)]
    fn print(self: PieceKind) {
        match self {
            PieceKind::Pawn(_) => {
                'Pawn'.print();
            },
            PieceKind::Knight(_) => {
                'Knight'.print();
            },
            PieceKind::Bishop(_) => {
                'Bishop'.print();
            },
            PieceKind::Rook(_) => {
                'Rook'.print();
            },
            PieceKind::Queen(_) => {
                'Queen'.print();
            },
            PieceKind::King(_) => {
                'King'.print();
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

#[derive(Component, Drop, SerdeLen)]
struct Game {
    /// game id, computed as follows pedersen_hash(player1_address, player2_address)
    #[key]
    game_id: felt252,
    status: bool,
    winner: Option<PieceColor>,
    white: ContractAddress,
    black: ContractAddress
}


#[derive(Component, Drop, SerdeLen)]
struct GameTurn {
    #[key]
    game_id: felt252,
    turn: PieceColor,
}

impl OptionPieceColorSerdeLen of dojo::SerdeLen<Option<PieceColor>> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}
