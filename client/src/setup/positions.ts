export type PiecePositionType = {
  player: number,
  piece: {
    id: number,
    col: number,
  },
  position: {
    row: number,
    col: number,
  },
}

export const piecesPositions: PiecePositionType[] = [
  // White Pawns
  {
    player: 1,
    piece: {
      id: 0,
      col: 0,
    },
    position: {
      row: 1,
      col: 0,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 1,
    },
    position: {
      row: 1,
      col: 1,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 2,
    },
    position: {
      row: 1,
      col: 2,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 3,
    },
    position: {
      row: 1,
      col: 3,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 4,
    },
    position: {
      row: 1,
      col: 4,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 5,
    },
    position: {
      row: 1,
      col: 5,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 6,
    },
    position: {
      row: 1,
      col: 6,
    },
  },
  {
    player: 1,
    piece: {
      id: 0,
      col: 7,
    },
    position: {
      row: 1,
      col: 7,
    },
  },
  // White Rooks
  {
    player: 1,
    piece: {
      id: 1,
      col: 0,
    },
    position: {
      row: 0,
      col: 0,
    },
  },
  {
    player: 1,
    piece: {
      id: 1,
      col: 7,
    },
    position: {
      row: 0,
      col: 7,
    },
  },
  // White Knights
  {
    player: 1,
    piece: {
      id: 2,
      col: 1,
    },
    position: {
      row: 0,
      col: 1,
    },
  },
  {
    player: 1,
    piece: {
      id: 2,
      col: 6,
    },
    position: {
      row: 0,
      col: 6,
    },
  },
  // White Bishops
  {
    player: 1,
    piece: {
      id: 3,
      col: 2,
    },
    position: {
      row: 0,
      col: 2,
    },
  },
  {
    player: 1,
    piece: {
      id: 3,
      col: 5,
    },
    position: {
      row: 0,
      col: 5,
    },
  },
  // White Queen
  {
    player: 1,
    piece: {
      id: 4,
      col: 3,
    },
    position: {
      row: 0,
      col: 3,
    },
  },
  // White King
  {
    player: 1,
    piece: {
      id: 5,
      col: 4,
    },
    position: {
      row: 0,
      col: 4,
    },
  },
  // Black Pawns
  {
    player: 0,
    piece: {
      id: 0,
      col: 0,
    },
    position: {
      row: 6,
      col: 0,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 1,
    },
    position: {
      row: 6,
      col: 1,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 2,
    },
    position: {
      row: 6,
      col: 2,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 3,
    },
    position: {
      row: 6,
      col: 3,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 4,
    },
    position: {
      row: 6,
      col: 4,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 5,
    },
    position: {
      row: 6,
      col: 5,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 6,
    },
    position: {
      row: 6,
      col: 6,
    },
  },
  {
    player: 0,
    piece: {
      id: 0,
      col: 7,
    },
    position: {
      row: 6,
      col: 7,
    },
  },
  // Black Rooks
  {
    player: 0,
    piece: {
      id: 1,
      col: 0,
    },
    position: {
      row: 7,
      col: 0,
    },
  },
  {
    player: 0,
    piece: {
      id: 1,
      col: 7,
    },
    position: {
      row: 7,
      col: 7,
    },
  },
  // Black Knights
  {
    player: 0,
    piece: {
      id: 2,
      col: 1,
    },
    position: {
      row: 7,
      col: 1,
    },
  },
  {
    player: 0,
    piece: {
      id: 2,
      col: 6,
    },
    position: {
      row: 7,
      col: 6,
    },
  },
  // Black Bishops
  {
    player: 0,
    piece: {
      id: 3,
      col: 2,
    },
    position: {
      row: 7,
      col: 2,
    },
  },
  {
    player: 0,
    piece: {
      id: 3,
      col: 5,
    },
    position: {
      row: 7,
      col: 5,
    },
  },
  // Black Queen
  {
    player: 0,
    piece: {
      id: 4,
      col: 3,
    },
    position: {
      row: 7,
      col: 3,
    },
  },
  // Black King
  {
    player: 0,
    piece: {
      id: 5,
      col: 4,
    },
    position: {
      row: 7,
      col: 4,
    },
  },
]