use array::ArrayTrait;
use core::debug::PrintTrait;
use starknet::ContractAddress;
use dojo::database::schema::{Enum, Ty, SchemaIntrospection, serialize_member_type};

#[derive(Model, Drop, Serde)]
struct Square {
    #[key]
    game_id: felt252,
    #[key]
    x: u32,
    #[key]
    y: u32,
    piece: Option<PieceType>,
}

#[derive(Serde, Drop, Copy, PartialEq, Introspect)]
enum PieceType {
    WhitePawn: (),
    WhiteKnight: (),
    WhiteBishop: (),
    WhiteRook: (),
    WhiteQueen: (),
    WhiteKing: (),
    BlackPawn: (),
    BlackKnight: (),
    BlackBishop: (),
    BlackRook: (),
    BlackQueen: (),
    BlackKing: (),
}

impl SchemaIntrospectionPieceType of SchemaIntrospection<Option<PieceType>> {
    #[inline(always)]
    fn size() -> usize {
        1 // Represents the byte size of the enum.
    }
    #[inline(always)]
    fn layout(ref layout: Array<u8>) {
        layout.append(8); // Specifies the layout byte size;
    }
    #[inline(always)]
    fn ty() -> Ty {
        Ty::Enum(
            Enum {
                name: 'PieceType',
                attrs: array![].span(),
                children: array![
                    ('WhitePawn', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('WhiteKnight', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('WhiteBishop', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('WhiteRook', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('WhiteQueen', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('WhiteKing', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackPawn', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackKnight', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackBishop', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackRook', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackQueen', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('BlackKing', serialize_member_type(@Ty::Tuple(array![].span())))
                ]
                    .span()
            }
        )
    }
}

#[derive(Serde, Drop, Copy, PartialEq, Introspect)]
enum Color {
    White: (),
    Black: (),
}

impl SchemaIntrospectionColor of SchemaIntrospection<Option<Color>> {
    #[inline(always)]
    fn size() -> usize {
        1
    }
    #[inline(always)]
    fn layout(ref layout: Array<u8>) {
        layout.append(8);
    }
    #[inline(always)]
    fn ty() -> Ty {
        Ty::Enum(
            Enum {
                name: 'Color',
                attrs: array![].span(),
                children: array![
                    ('White', serialize_member_type(@Ty::Tuple(array![].span()))),
                    ('Black', serialize_member_type(@Ty::Tuple(array![].span())))
                ]
                    .span()
            }
        )
    }
}

#[derive(Model, Drop, Serde)]
struct Game {
    /// game id, computed as follows pedersen_hash(player1_address, player2_address)
    #[key]
    game_id: felt252,
    winner: Option<Color>,
    white: ContractAddress,
    black: ContractAddress
}

#[derive(Model, Drop, Serde)]
struct GameTurn {
    #[key]
    game_id: felt252,
    turn: Color
}


//printing trait for debug

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
            Option::Some(color_type) => {
                color_type.print();
            },
            Option::None(_) => {
                'None'.print();
            }
        }
    }
}

impl BoardPrintTrait of PrintTrait<(u32, u32)> {
    #[inline(always)]
    fn print(self: (u32, u32)) {
        let (x, y): (u32, u32) = self;
        x.print();
        y.print();
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

