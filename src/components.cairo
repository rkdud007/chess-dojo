use debug::PrintTrait;
use starknet::ContractAddress;

#[derive(Component, Drop, SerdeLen, Serde)]
struct Square {
    #[key]
    game_id: felt252,
    #[key]
    x: u32,
    #[key]
    y: u32,
    piece: Option<PieceType>,
}

#[derive(Serde, Drop, Copy, PartialEq)]
enum PieceType {
    WhitePawn,
    WhiteKnight,
    WhiteBishop,
    WhiteRook,
    WhiteQueen,
    WhiteKing,
    BlackPawn,
    BlackKnight,
    BlackBishop,
    BlackRook,
    BlackQueen,
    BlackKing,
}

#[derive(Serde, Drop, Copy, PartialEq)]
enum Color {
    White,
    Black,
}


impl PieceOptionSerdeLen of dojo::SerdeLen<Option<PieceType>> {
    #[inline(always)]
    fn len() -> usize {
        4
    }
}

impl ColorPrintTrait of PrintTrait<Color> {
    #[inline(always)]
    fn print(self: Color) {
        match self {
            Color::White(_) => {
                'White'.print();
            },
            Color::Black(_) => {
                'Black'.print();
            },
        }
    }
}

impl ColorOptionPrintTrait of PrintTrait<Option<Color>> {
    #[inline(always)]
    fn print(self: Option<Color>) {
        match self {
            Option::Some(color) => {
                color.print();
            },
            Option::None(_) => {
                'None'.print();
            }
        }
    }
}


impl PieceTypeOptionPrintTrait of PrintTrait<Option<PieceType>> {
    #[inline(always)]
    fn print(self: Option<PieceType>) {
        match self {
            Option::Some(piece_type) => {
                piece_type.print();
            },
            Option::None(_) => {
                'None'.print();
            }
        }
    }
}


impl PieceTypePrintTrait of PrintTrait<PieceType> {
    #[inline(always)]
    fn print(self: PieceType) {
        match self {
            PieceType::WhitePawn(_) => {
                'WhitePawn'.print();
            },
            PieceType::WhiteKnight(_) => {
                'WhiteKnight'.print();
            },
            PieceType::WhiteBishop(_) => {
                'WhiteBishop'.print();
            },
            PieceType::WhiteRook(_) => {
                'WhiteRook'.print();
            },
            PieceType::WhiteQueen(_) => {
                'WhiteQueen'.print();
            },
            PieceType::WhiteKing(_) => {
                'WhiteKing'.print();
            },
            PieceType::BlackPawn(_) => {
                'BlackPawn'.print();
            },
            PieceType::BlackKnight(_) => {
                'BlackKnight'.print();
            },
            PieceType::BlackBishop(_) => {
                'BlackBishop'.print();
            },
            PieceType::BlackRook(_) => {
                'BlackRook'.print();
            },
            PieceType::BlackQueen(_) => {
                'BlackQueen'.print();
            },
            PieceType::BlackKing(_) => {
                'BlackKing'.print();
            },
        }
    }
}

impl ColorSerdeLen of dojo::SerdeLen<Color> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

#[derive(Component, Drop, SerdeLen, Serde)]
struct Game {
    /// game id, computed as follows pedersen_hash(player1_address, player2_address)
    #[key]
    game_id: felt252,
    winner: Option<Color>,
    white: ContractAddress,
    black: ContractAddress
}


#[derive(Component, Drop, SerdeLen, Serde)]
struct GameTurn {
    #[key]
    game_id: felt252,
    turn: Color,
}

impl OptionPieceColorSerdeLen of dojo::SerdeLen<Option<Color>> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}
