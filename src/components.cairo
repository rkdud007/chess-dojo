use debug::PrintTrait;

#[derive(Component, Drop, SerdeLen)]
struct Piece {
    #[key]
    piece_id: felt252,
    kind: PieceKind,
    color: PieceColor,
    is_alive: bool,
}

#[derive(Component, Drop, SerdeLen)]
struct Position {
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
