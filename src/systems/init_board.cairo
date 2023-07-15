#[system]
mod init_board_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use dojo_chess::components::{Piece, Position, PieceKind, PieceSide};

    fn execute(ctx: Context) {
        // Set initial player turn to white
        set !(ctx.world, 'game_turn'.into(), (PlayerTurn { current: PieceSide::White(()) }));
        // TODO : Can we make this more concise? using loop?
        // White Pawns
        set !(
            ctx.world,
            'white_pawn_1'.into(),
            (
                Piece {
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::White(())
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
                    kind: PieceKind::Rook(()), side: PieceSide::White(())
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
                    kind: PieceKind::Rook(()), side: PieceSide::White(())
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
                    kind: PieceKind::Knight(()), side: PieceSide::White(())
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
                    kind: PieceKind::Knight(()), side: PieceSide::White(())
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
                    kind: PieceKind::Bishop(()), side: PieceSide::White(())
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
                    kind: PieceKind::Bishop(()), side: PieceSide::White(())
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
                    kind: PieceKind::Queen(()), side: PieceSide::White(())
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
                    kind: PieceKind::King(()), side: PieceSide::White(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Pawn(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Rook(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Rook(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Knight(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Knight(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Bishop(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Bishop(()), side: PieceSide::Black(())
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
                    kind: PieceKind::Queen(()), side: PieceSide::Black(())
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
                    kind: PieceKind::King(()), side: PieceSide::Black(())
                    }, Position {
                    x: 4, y: 7
                }
            )
        )

        return ();
    }
}

