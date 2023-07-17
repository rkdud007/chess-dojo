#[system]
mod execute_move_system {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use dojo_chess::components::{Position, Piece, PieceKind, PieceColor, Game, GameTurn, PlayersId};

    fn execute(
        ctx: Context,
        game_id: felt252,
        entity_name: felt252,
        new_position: Position,
        caller: ContractAddress
    ) {
        let (piece, current_position) = get !(ctx.world, entity_name.into(), (Piece, Position));
        let current_game_turn = get !(ctx.world, game_id.into(), (GameTurn));
        let player_id = get !(ctx.world, game_id.into(), (PlayersId));

        // check if the next_position is valid
        let board: Array<Span<Option<Piece>>> = array::ArrayTrait::new();
        let legal_moves = possible_moves(piece, current_position, board.span());
        let (is_valid, occpy_piece) = check_position_is_in_legal_moves(new_position, legal_moves);
        assert(is_valid, 'Not a valid move');
        // if the next_position is occupied by an enemy, kill it
        if occpy_piece.is_some() {
            let piece = get !(ctx.world, occpy_piece.unwrap().into(), (Piece));
            set !(
                ctx.world,
                occpy_piece.unwrap().into(),
                (Piece {
                    kind: piece.kind, color: piece.color, is_alive: false, piece_id: piece.piece_id
                })
            );
        }
        // check if the piece is owned by the caller
        assert(
            (player_id.white == caller && piece.color == PieceColor::White(()))
                || (player_id.black == caller && piece.color == PieceColor::Black(())),
            'Not your piece'
        );
        // check if it is the caller's turn
        assert(current_game_turn.turn == piece.color, 'Not your turn');

        // update the position of the piece
        set !(ctx.world, entity_name.into(), (Position { x: new_position.x, y: new_position.y }, ));
        let next_turn = match current_game_turn.turn {
            PieceColor::White(()) => PieceColor::Black(()),
            PieceColor::Black(()) => PieceColor::White(()),
        };
        set !(ctx.world, game_id.into(), (GameTurn { turn: next_turn }, ));
        return ();
    }


    fn is_out_of_bounds(new_pos: Position) -> bool {
        if new_pos.x > 7 || new_pos.x < 0 {
            return true;
        }
        if new_pos.y > 7 || new_pos.y < 0 {
            return true;
        }
        false
    }

    fn is_occupied_by_ally(
        new_pos: Position, board: Span<Span<Option<Piece>>>, player_color: PieceColor
    ) -> bool {
        let maybe_piece = *(*board.at(new_pos.x)).at(new_pos.y);
        let piece_color = match maybe_piece {
            Option::Some(piece) => piece.color,
            Option::None(_) => {
                return false;
            },
        };
        let is_occupied = match piece_color {
            PieceColor::White(_) => {
                match player_color {
                    PieceColor::White(_) => true,
                    PieceColor::Black(_) => false,
                }
            },
            PieceColor::Black(_) => {
                match player_color {
                    PieceColor::White(_) => false,
                    PieceColor::Black(_) => true,
                }
            },
        };
        is_occupied
    }

    fn is_occupied_by_enemy(
        new_pos: Position, board: Span<Span<Option<Piece>>>, player_color: PieceColor
    ) -> bool {
        return !is_occupied_by_ally(new_pos, board, player_color);
    }

    fn is_occupied(new_pos: Position, board: Span<Span<Option<Piece>>>) -> bool {
        let piece = *(*board.at(new_pos.x)).at(new_pos.y);
        return piece.is_some();
    }


    fn possible_moves(
        piece: Piece, position: Position, board: Span<Span<Option<Piece>>>
    ) -> Span<(Position, Option<felt252>)> {
        match piece.kind {
            PieceKind::Pawn(_) => {
                let is_white = match piece.color {
                    PieceColor::White(_) => 1_u32,
                    PieceColor::Black(_) => 0_u32,
                };
                let mut moves = array::ArrayTrait::new();
                let new_pos = Position {
                    x: position.x, y: position.y + 1 * is_white - 1 * (1 - is_white)
                };
                if !is_out_of_bounds(new_pos) && !is_occupied(new_pos, board) {
                    moves.append((new_pos, Option::None(())));
                }

                let new_pos = Position {
                    x: position.x, y: position.y + 2 * is_white - 2 * (1 - is_white)
                };
                if !is_out_of_bounds(new_pos) && !is_occupied(new_pos, board) {
                    moves.append((new_pos, Option::None(())));
                }

                let new_pos = Position {
                    x: position.x + 1, y: position.y + 1 * is_white - 1 * (1 - is_white)
                };
                if !is_out_of_bounds(new_pos) && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }
                return moves.span();
            },
            PieceKind::Knight(_) => {
                let mut moves = array::ArrayTrait::new();

                let new_pos = Position { x: position.x - 1, y: position.y + 2 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 1, y: position.y + 2 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x - 1, y: position.y - 2 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 1, y: position.y - 2 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x - 2, y: position.y + 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 2, y: position.y + 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x - 2, y: position.y - 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 2, y: position.y - 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }
                return moves.span();
            },
            PieceKind::Bishop(_) => {
                let mut moves = array::ArrayTrait::new();

                // Top left path of the Bishop
                let mut x_left_iter = position.x - 1;
                let mut y_top_iter = position.y + 1;
                loop {
                    if x_left_iter < 0 || y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                    y_top_iter += 1;
                };

                // Top right path of the Bishop
                let mut x_right_iter = position.x + 1;
                let mut y_top_iter = position.y + 1;
                loop {
                    if x_right_iter > 7 || y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                    y_top_iter += 1;
                };

                // Bottom left path of the Bishop
                let mut x_left_iter = position.x - 1;
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if x_left_iter < 0 || y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                    y_bottom_iter -= 1;
                };

                // Bottom right path of the Bishop
                let mut x_right_iter = position.x + 1;
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if x_right_iter > 7 || y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                    y_bottom_iter -= 1;
                };

                return moves.span();
            },
            PieceKind::Rook(_) => {
                let mut moves = array::ArrayTrait::new();

                // Left path of the rook
                let mut x_left_iter = position.x - 1;
                loop {
                    if x_left_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: position.y };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                };
                // Right path of the rook
                let mut x_right_iter = position.x + 1;
                loop {
                    if x_right_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: position.y };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                };
                // Top path of the rook
                let mut y_top_iter = position.y + 1;
                loop {
                    if y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    y_top_iter += 1;
                };
                // Bottom path of the rook
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    y_bottom_iter -= 1;
                };
                return moves.span();
            },
            PieceKind::Queen(_) => {
                let mut moves = array::ArrayTrait::new();

                // Left path of the Queen
                let mut x_left_iter = position.x - 1;
                loop {
                    if x_left_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: position.y };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                };
                // Right path of the Queen
                let mut x_right_iter = position.x + 1;
                loop {
                    if x_right_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: position.y };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                };
                // Top path of the Queen
                let mut y_top_iter = position.y + 1;
                loop {
                    if y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    y_top_iter += 1;
                };
                // Bottom path of the Queen
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    y_bottom_iter -= 1;
                };
                // Top left path of the Queen
                let mut x_left_iter = position.x - 1;
                let mut y_top_iter = position.y + 1;
                loop {
                    if x_left_iter < 0 || y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                    y_top_iter += 1;
                };

                // Top right path of the Queen
                let mut x_right_iter = position.x + 1;
                let mut y_top_iter = position.y + 1;
                loop {
                    if x_right_iter > 7 || y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: y_top_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                    y_top_iter += 1;
                };

                // Bottom left path of the Queen
                let mut x_left_iter = position.x - 1;
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if x_left_iter < 0 || y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_left_iter, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_left_iter -= 1;
                    y_bottom_iter -= 1;
                };

                // Bottom right path of the Queen
                let mut x_right_iter = position.x + 1;
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if x_right_iter > 7 || y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: y_bottom_iter };
                    if is_occupied_by_ally(new_pos, board, piece.color) {
                        break;
                    }
                    if !is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::None(())));
                    }
                    if is_occupied_by_enemy(new_pos, board, piece.color) {
                        moves.append((new_pos, Option::Some(piece.piece_id)));
                        break;
                    }
                    x_right_iter += 1;
                    y_bottom_iter -= 1;
                };

                return moves.span();
            },
            PieceKind::King(_) => {
                let mut moves = array::ArrayTrait::new();

                let new_pos = Position { x: position.x - 1, y: position.y };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 1, y: position.y };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x, y: position.y + 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x - 1, y: position.y - 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x + 1, y: position.y - 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                let new_pos = Position { x: position.x - 1, y: position.y + 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }
                let new_pos = Position { x: position.x + 1, y: position.y + 1 };
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && !is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::None(())));
                }
                if !is_out_of_bounds(new_pos)
                    && !is_occupied_by_ally(new_pos, board, piece.color)
                    && is_occupied_by_enemy(new_pos, board, piece.color) {
                    moves.append((new_pos, Option::Some(piece.piece_id)));
                }

                return moves.span();
            },
        }
    }

    fn check_position_is_in_legal_moves(
        next_position: Position, legal_moves: Span<(Position, Option<felt252>)>
    ) -> (bool, Option<felt252>) {
        let arr_len = legal_moves.len();
        let mut i = 0;
        let mut result = (false, Option::None(()));
        loop {
            if i == arr_len {
                break ();
            }
            let (ele_position, ele_occupy) = *legal_moves.at(i);
            if ele_position == next_position {
                result = (true, ele_occupy);
                break ();
            }
            i += 1;
        };
        return result;
    }
}

#[cfg(test)]
mod tests {
    use starknet::ContractAddress;
    use dojo::test_utils::spawn_test_world;
    use dojo_chess::components::{Piece, piece, Game, game, Position, position};
    use dojo_chess::systems::initiate_system;
    use dojo_chess::systems::execute_move_system;
    use array::ArrayTrait;
    use core::traits::Into;
    use dojo::world::IWorldDispatcherTrait;
    use core::array::SpanTrait;

    fn fixture_board() -> Span<Span<Option<Piece>>> {
        let mut board: Array<Span<Option<Piece>>> = array::ArrayTrait::new();
        // loop 64 times to create a 8x8 board
        let mut i = 0_usize;
        let mut arr: Array<Option<Piece>> = array::ArrayTrait::new();
        loop {
            if i == 64 {
                break;
            }
            if i % 8 == 0 && i > 0 {
                board.append(arr.span());
                arr = array::ArrayTrait::new();
            }
            arr.append(Option::None(()));
            i += 1;
        };
        board.span()
    }

    #[test]
    #[available_gas(3000000000000000)]
    fn init() {
        let white = starknet::contract_address_const::<0x01>();
        let black = starknet::contract_address_const::<0x02>();

        // components
        let mut components = array::ArrayTrait::new();
        components.append(piece::TEST_CLASS_HASH);
        components.append(game::TEST_CLASS_HASH);
        components.append(position::TEST_CLASS_HASH);

        //systems
        let mut systems = array::ArrayTrait::new();
        systems.append(initiate_system::TEST_CLASS_HASH);
        systems.append(execute_move_system::TEST_CLASS_HASH);

        let world = spawn_test_world(components, systems);

        let mut calldata = array::ArrayTrait::<core::felt252>::new();
        calldata.append('gameid'.into());
        calldata.append(white.into());
        calldata.append(black.into());
        world.execute('initiate_system'.into(), calldata.span());

        let game = world
            .entity('Game'.into(), 'gameid'.into(), 0_u8, dojo::SerdeLen::<Game>::len());
        let white_pawn_1 = world
            .entity('Piece'.into(), 'white_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let black_pawn_1 = world
            .entity('Piece'.into(), 'black_pawn_1'.into(), 0_u8, dojo::SerdeLen::<Piece>::len());

        let white_pawn_1_position = world
            .entity('Position', 'white_pawn_1'.into(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position.at(1_usize) == 1, 'pawn1 position y is wrong');

        //Move White Pawn to (0,2)
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('white_pawn_1');
        move_calldata.append(0);
        move_calldata.append(2);
        move_calldata.append(white.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        //not your turn
        let mut move_calldata = array::ArrayTrait::new();
        move_calldata.append('gameid');
        move_calldata.append('black_pawn_1');

        // move black pawn to (0,5)
        move_calldata.append(0);
        move_calldata.append(5);
        move_calldata.append(black.into());
        world.execute('execute_move_system'.into(), move_calldata.span());

        let white_pawn_1_position_again = world
            .entity('Position', 'white_pawn_1'.into(), 0, dojo::SerdeLen::<Position>::len());

        //White pawn is now in (0,1)
        assert(*white_pawn_1_position_again.at(0_usize) == 0, 'pawn1 position x is wrong');
        assert(*white_pawn_1_position_again.at(1_usize) == 2, 'pawn1 position y is wrong');

        assert(*game.at(0_usize) == 1_felt252, 'status is not true');
        assert(*white_pawn_1.at(0_usize) == 0_felt252, 'piece kind is not pawn');
    }
}
