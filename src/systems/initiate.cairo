#[system]
mod initiate_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Piece, Position, PieceKind, PieceColor, PlayersId, Game, GameTurn};

    fn execute(ctx: Context, white_address: ContractAddress, black_address: ContractAddress) {
        //initialize_game
        set !(
            ctx.world,
            'gameid'.into(),
            (
                Game {
                    status: true, winner: Option::None(()), 
                    }, GameTurn {
                    turn: PieceColor::White(()), 
                    }, PlayersId {
                    white: white_address, black: black_address, 
                }
            )
        )

        //initialize_peices
        set !(
            ctx.world,
            'white_pawn_1'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 0, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_2'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 1, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_3'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 2, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_4'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 3, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_5'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 4, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_6'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 5, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_7'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 6, y: 1
                }
            )
        )
        set !(
            ctx.world,
            'white_pawn_8'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::White(())
                    }, Position {
                    x: 7, y: 1
                }
            )
        )
        //White Rooks
        set !(
            ctx.world,
            'white_rook_1'.into(),
            (
                Piece {
                    kind: PieceKind::Rook(()), color: PieceColor::White(())
                    }, Position {
                    x: 0, y: 0
                }
            )
        )
        set !(
            ctx.world,
            'white_rook_2'.into(),
            (
                Piece {
                    kind: PieceKind::Rook(()), color: PieceColor::White(())
                    }, Position {
                    x: 7, y: 0
                }
            )
        )
        //White Knights
        set !(
            ctx.world,
            'white_knight_1'.into(),
            (
                Piece {
                    kind: PieceKind::Knight(()), color: PieceColor::White(())
                    }, Position {
                    x: 1, y: 0
                }
            )
        )
        set !(
            ctx.world,
            'white_knight_2'.into(),
            (
                Piece {
                    kind: PieceKind::Knight(()), color: PieceColor::White(())
                    }, Position {
                    x: 6, y: 0
                }
            )
        )
        //White Bishops
        set !(
            ctx.world,
            'white_bishop_1'.into(),
            (
                Piece {
                    kind: PieceKind::Bishop(()), color: PieceColor::White(())
                    }, Position {
                    x: 2, y: 0
                }
            )
        )
        set !(
            ctx.world,
            'white_bishop_2'.into(),
            (
                Piece {
                    kind: PieceKind::Bishop(()), color: PieceColor::White(())
                    }, Position {
                    x: 5, y: 0
                }
            )
        )
        //White Queen
        set !(
            ctx.world,
            'white_queen'.into(),
            (
                Piece {
                    kind: PieceKind::Queen(()), color: PieceColor::White(())
                    }, Position {
                    x: 3, y: 0
                }
            )
        )
        //White King
        set !(
            ctx.world,
            'white_king'.into(),
            (
                Piece {
                    kind: PieceKind::King(()), color: PieceColor::White(())
                    }, Position {
                    x: 4, y: 0
                }
            )
        )
        //Black Pawns
        set !(
            ctx.world,
            'black_pawn_1'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 0, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_2'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 1, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_3'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 2, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_4'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 3, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_5'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 4, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_6'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 5, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_7'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 6, y: 6
                }
            )
        )
        set !(
            ctx.world,
            'black_pawn_8'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), color: PieceColor::Black(())
                    }, Position {
                    x: 7, y: 6
                }
            )
        )
        //Black Rooks
        set !(
            ctx.world,
            'black_rook_1'.into(),
            (
                Piece {
                    kind: PieceKind::Rook(()), color: PieceColor::Black(())
                    }, Position {
                    x: 0, y: 7
                }
            )
        )
        set !(
            ctx.world,
            'black_rook_2'.into(),
            (
                Piece {
                    kind: PieceKind::Rook(()), color: PieceColor::Black(())
                    }, Position {
                    x: 7, y: 7
                }
            )
        )
        //Black Knights
        set !(
            ctx.world,
            'black_knight_1'.into(),
            (
                Piece {
                    kind: PieceKind::Knight(()), color: PieceColor::Black(())
                    }, Position {
                    x: 1, y: 7
                }
            )
        )
        set !(
            ctx.world,
            'black_knight_2'.into(),
            (
                Piece {
                    kind: PieceKind::Knight(()), color: PieceColor::Black(())
                    }, Position {
                    x: 6, y: 7
                }
            )
        )
        //Black Bishops
        set !(
            ctx.world,
            'black_bishop_1'.into(),
            (
                Piece {
                    kind: PieceKind::Bishop(()), color: PieceColor::Black(())
                    }, Position {
                    x: 2, y: 7
                }
            )
        )
        set !(
            ctx.world,
            'black_bishop_2'.into(),
            (
                Piece {
                    kind: PieceKind::Bishop(()), color: PieceColor::Black(())
                    }, Position {
                    x: 5, y: 7
                }
            )
        )
        //Black Queen
        set !(
            ctx.world,
            'black_queen'.into(),
            (
                Piece {
                    kind: PieceKind::Queen(()), color: PieceColor::Black(())
                    }, Position {
                    x: 3, y: 7
                }
            )
        )
        //Black King
        set !(
            ctx.world,
            'black_king'.into(),
            (
                Piece {
                    kind: PieceKind::King(()), color: PieceColor::Black(())
                    }, Position {
                    x: 4, y: 7
                }
            )
        )

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

        let game = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');
    }
}
