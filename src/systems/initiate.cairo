#[system]
mod initiate_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{
        Piece, Position, PieceKind, PieceColor, PlayersId, Game, GameTurn, Square
    };

    fn execute(ctx: Context, white_address: ContractAddress, black_address: ContractAddress) {
        set !(
            ctx.world,
            (
                Game {
                    game_id: white_address, status: true, winner: Option::None(()), 
                    }, GameTurn {
                    game_id: white_address, turn: PieceColor::White(()), 
                    }, PlayersId {
                    game_id: white_address, white: white_address, black: black_address, 
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 0, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 1, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_3';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 2, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_4';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 3, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_5';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 4, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_6';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 5, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_7';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 6, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_8';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 7, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_rook_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 0, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_rook_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 7, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_knight_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 1, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_knight_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 6, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_bishop_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 2, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_bishop_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 5, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_queen';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Queen(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 3, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_king';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::King(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 4, y: 0
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 0, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 1, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_3';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 2, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_4';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 3, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_5';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 4, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_6';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 5, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_7';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 6, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_8';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 7, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_rook_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 0, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_rook_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 7, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_knight_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 1, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_knight_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 6, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_bishop_1';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 2, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_bishop_2';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 5, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_queen';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::Queen(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 3, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_king';
        set !(
            ctx.world,
            (
                Piece {
                    piece_id: piece_id,
                    kind: PieceKind::King(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    piece_id: piece_id, x: 4, y: 7
                }
            )
        );

        let square_id: felt252 = 'a1';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_rook_1') }));

        let square_id: felt252 = 'b1';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_knight_1') })
        );

        let square_id: felt252 = 'c1';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_bishop_1') })
        );

        let square_id: felt252 = 'd1';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_queen') }));

        let square_id: felt252 = 'e1';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_king') }));

        let square_id: felt252 = 'f1';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_bishop_2') })
        );

        let square_id: felt252 = 'g1';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_knight_2') })
        );

        let square_id: felt252 = 'h1';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_rook_2') }));

        let square_id: felt252 = 'a2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_1') }));

        let square_id: felt252 = 'b2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_2') }));

        let square_id: felt252 = 'c2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_3') }));

        let square_id: felt252 = 'd2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_4') }));

        let square_id: felt252 = 'e2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_5') }));

        let square_id: felt252 = 'f2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_6') }));

        let square_id: felt252 = 'g2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_7') }));

        let square_id: felt252 = 'h2';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('white_pawn_8') }));

        let square_id: felt252 = 'a8';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_rook_1') }));

        let square_id: felt252 = 'b8';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_knight_1') })
        );

        let square_id: felt252 = 'c8';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_bishop_1') })
        );

        let square_id: felt252 = 'd8';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_queen') }));

        let square_id: felt252 = 'e8';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_king') }));

        let square_id: felt252 = 'f8';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_bishop_2') })
        );

        let square_id: felt252 = 'g8';
        set !(
            ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_knight_2') })
        );

        let square_id: felt252 = 'h8';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_rook_2') }));

        let square_id: felt252 = 'a7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_1') }));

        let square_id: felt252 = 'b7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_2') }));

        let square_id: felt252 = 'c7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_3') }));

        let square_id: felt252 = 'd7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_4') }));

        let square_id: felt252 = 'e7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_5') }));

        let square_id: felt252 = 'f7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_6') }));

        let square_id: felt252 = 'g7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_7') }));

        let square_id: felt252 = 'h7';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::Some('black_pawn_8') }));

        let square_id: felt252 = 'a3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'b3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'c3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'd3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'e3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'f3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'g3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'h3';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'a4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'b4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'c4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'd4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'e4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'f4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'g4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'h4';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'a5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'b5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'c5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'd5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'e5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'f5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'g5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'h5';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'a6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'b6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'c6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'd6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'e6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'f6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'g6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        let square_id: felt252 = 'h6';
        set !(ctx.world, (Square { square_id: square_id, piece_id: Option::None(()) }));

        return ();
    }
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece, Game, game, GameTurn, game_turn};
    use dojo_chess::systems::initiate_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;

    #[test]
    #[available_gas(3000000000000000)]
    fn init() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        // components
        let mut components = array::ArrayTrait::new();
        components.append(piece::TEST_CLASS_HASH);
        components.append(game::TEST_CLASS_HASH);
        components.append(game_turn::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);

        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata.span());

        let mut keys_game = array::ArrayTrait::new();
        keys_game.append(white.into());

        let mut keys_piece = array::ArrayTrait::new();
        keys_piece.append('white_pawn_1'.into());

        let game = world
            .entity('Game'.into(), keys_game.span(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), keys_piece.span(), 0_u8, dojo::SerdeLen::<Piece>::len());

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');
    }
}
