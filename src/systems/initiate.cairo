#[system]
mod initiate_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Piece, Position, PieceKind, PieceColor, Game, GameTurn};

    fn execute(ctx: Context, white_address: ContractAddress, black_address: ContractAddress) {
        let game_id = pedersen(white_address.into(), black_address.into());
        set!(
            ctx.world,
            (
                Game {
                    game_id: game_id,
                    status: true,
                    winner: Option::None(()),
                    white: white_address,
                    black: black_address,
                    }, GameTurn {
                    game_id: game_id, turn: PieceColor::White(()), 
                },
            )
        );

        let piece_id: felt252 = 'white_pawn_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 0, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 1, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_3';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 2, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_4';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 3, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_5';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 4, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_6';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 5, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_7';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 6, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_pawn_8';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 7, y: 1
                }
            )
        );

        let piece_id: felt252 = 'white_rook_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 0, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_rook_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 7, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_knight_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 1, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_knight_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 6, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_bishop_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 2, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_bishop_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 5, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_queen';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Queen(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 3, y: 0
                }
            )
        );

        let piece_id: felt252 = 'white_king';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::King(()),
                    color: PieceColor::White(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 4, y: 0
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 0, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 1, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_3';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 2, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_4';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 3, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_5';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 4, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_6';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 5, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_7';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 6, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_pawn_8';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Pawn(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 7, y: 6
                }
            )
        );

        let piece_id: felt252 = 'black_rook_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 0, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_rook_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Rook(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 7, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_knight_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 1, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_knight_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Knight(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 6, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_bishop_1';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 2, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_bishop_2';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Bishop(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 5, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_queen';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::Queen(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 3, y: 7
                }
            )
        );

        let piece_id: felt252 = 'black_king';
        set!(
            ctx.world,
            (
                Piece {
                    game_id: game_id,
                    piece_id: piece_id,
                    kind: PieceKind::King(()),
                    color: PieceColor::Black(()),
                    is_alive: true,
                    }, Position {
                    game_id: game_id, piece_id: piece_id, x: 4, y: 7
                }
            )
        );
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
    fn test_initiate() {
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
        world.execute('initiate_system'.into(), calldata);

        let game_id = pedersen(white.into(), black.into());

        let mut keys_game = array::ArrayTrait::new();
        keys_game.append(game_id);

        let mut keys_piece = array::ArrayTrait::new();
        keys_piece.append(game_id);
        keys_piece.append('white_pawn_1'.into());

        let game = world
            .entity('Game'.into(), keys_game.span(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), keys_piece.span(), 0_u8, dojo::SerdeLen::<Piece>::len());

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');
    }
}
