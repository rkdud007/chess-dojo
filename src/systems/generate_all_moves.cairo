#[system]
mod generate_moves {
    use array::ArrayTrait;
    use dojo_chess::components::{Piece, Position, PieceKind, PieceColor};


    fn is_out_of_bounds(new_pos: Position) -> bool {
        if new_pos.x > 7 || new_pos.x < 0 {
            return true;
        }
        if new_pos.y > 7 || new_pos.y < 0 {
            return true;
        }
        false
    }


    fn possible_moves(piece: Piece, position: Position) -> Array<Position> {
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
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position {
                    x: position.x, y: position.y + 2 * is_white - 2 * (1 - is_white)
                };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position {
                    x: position.x + 1, y: position.y + 1 * is_white - 1 * (1 - is_white)
                };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }
                return moves;
            },
            PieceKind::Knight(_) => {
                let mut moves = array::ArrayTrait::new();

                let new_pos = Position { x: position.x - 1, y: position.y + 2 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 1, y: position.y + 2 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x - 1, y: position.y - 2 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 1, y: position.y - 2 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x - 2, y: position.y + 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 2, y: position.y + 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x - 2, y: position.y - 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 2, y: position.y - 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }
                return moves;
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
                    x_right_iter += 1;
                    y_bottom_iter -= 1;
                };

                return moves;
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
                    moves.append(new_pos);
                    x_left_iter -= 1;
                };
                // Right path of the rook
                let mut x_right_iter = position.x + 1;
                loop {
                    if x_right_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: position.y };
                    moves.append(new_pos);
                    x_right_iter += 1;
                };
                // Top path of the rook
                let mut y_top_iter = position.y + 1;
                loop {
                    if y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_top_iter };
                    moves.append(new_pos);
                    y_top_iter += 1;
                };
                // Bottom path of the rook
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_bottom_iter };
                    moves.append(new_pos);
                    y_bottom_iter -= 1;
                };
                return moves;
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
                    moves.append(new_pos);
                    x_left_iter -= 1;
                };
                // Right path of the Queen
                let mut x_right_iter = position.x + 1;
                loop {
                    if x_right_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: x_right_iter, y: position.y };
                    moves.append(new_pos);
                    x_right_iter += 1;
                };
                // Top path of the Queen
                let mut y_top_iter = position.y + 1;
                loop {
                    if y_top_iter > 7 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_top_iter };
                    moves.append(new_pos);
                    y_top_iter += 1;
                };
                // Bottom path of the Queen
                let mut y_bottom_iter = position.y - 1;
                loop {
                    if y_bottom_iter < 0 {
                        break;
                    }
                    let new_pos = Position { x: position.x, y: y_bottom_iter };
                    moves.append(new_pos);
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
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
                    moves.append(new_pos);
                    x_right_iter += 1;
                    y_bottom_iter -= 1;
                };

                return moves;
            },
            PieceKind::King(_) => {
                let mut moves = array::ArrayTrait::new();

                let new_pos = Position { x: position.x - 1, y: position.y };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 1, y: position.y };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x, y: position.y - 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x, y: position.y + 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x - 1, y: position.y - 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 1, y: position.y - 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x - 1, y: position.y + 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }

                let new_pos = Position { x: position.x + 1, y: position.y + 1 };
                if !is_out_of_bounds(new_pos) {
                    moves.append(new_pos);
                }
                return moves;
            },
        }
    }
}


#[cfg(test)]
mod tests {
    use dojo_chess::components::{Piece, Position, PieceKind, PieceColor};
    use super::generate_moves;
    use array::ArrayTrait;

    #[test]
    #[available_gas(3000000000000000)]
    fn test_possible_pawn_moves() {
        let piece = Piece {
            kind: PieceKind::Pawn(()), color: PieceColor::White(()), is_alive: true
        };
        let position = Position { x: 0, y: 5 };
        let moves = generate_moves::possible_moves(piece, position);
        assert(*moves.at(0) == Position { x: 0, y: 6 }, 'Pawn step 1 forward');
    }

    #[test]
    #[available_gas(3000000000000000)]
    fn test_possible_knight_moves() {
        let piece = Piece {
            kind: PieceKind::Knight(()), color: PieceColor::White(()), is_alive: true
        };
        let position = Position { x: 7, y: 5 };
        let moves = generate_moves::possible_moves(piece, position);
        assert(*moves.at(0) == Position { x: 6, y: 7 }, 'Knight step 1 forward');
        assert(*moves.at(1) == Position { x: 6, y: 3 }, 'Knight step 1 forward');
    }
}
