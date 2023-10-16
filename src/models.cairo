use array::ArrayTrait;
use core::debug::PrintTrait;
use starknet::ContractAddress;
use dojo::database::schema::{
    Enum, Member, Ty, Struct, SchemaIntrospection, serialize_member, serialize_member_type
};

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
        1
    }
    #[inline(always)]
    fn layout(ref layout: Array<u8>) {
        layout.append(8);
    }
    #[inline(always)]
    fn ty() -> dojo::database::schema::Ty {
        dojo::database::schema::Ty::Enum(
            dojo::database::schema::Enum {
                name: 'PieceType',
                attrs: array![].span(),
                children: array![
                    (
                        'WhitePawn',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'WhiteKnight',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'WhiteBishop',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'WhiteRook',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'WhiteQueen',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'WhiteKing',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackPawn',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackKnight',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackBishop',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackRook',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackQueen',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'BlackKing',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    )
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
    fn ty() -> dojo::database::schema::Ty {
        dojo::database::schema::Ty::Enum(
            dojo::database::schema::Enum {
                name: 'Color',
                attrs: array![].span(),
                children: array![
                    (
                        'White',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    ),
                    (
                        'Black',
                        dojo::database::schema::serialize_member_type(
                            @dojo::database::schema::Ty::Tuple(array![].span())
                        )
                    )
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

