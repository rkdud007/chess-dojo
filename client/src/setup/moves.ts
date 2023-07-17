// Test object for returned moves.
// ideal structure, but can be changed if we need

// id: move id, from 0 to ~
// player: 0 is "whites" and 1 is "blacks"
// piece:
//   id: 0 is "pawn", 1 is "rook", 2 is "knight", 3 is "bishop", 4 is "queen", 5 is "king"
//   col: 0 is "a" up to 7 being "h"
// destination:
//   row: 0 is "1" up to 7 being "8"
//   col: 0 is "a" up to 7 being "h"

export type MoveType = {
  id: number;
  player: number;
  piece: {
    id: number;
    col: number;
  };
  destination: {
    row: number;
    col: number;
  };
};

export const testMoves: MoveType[] = [
  {
    id: 0,
    player: 0,
    piece: {
      id: 0,
      col: 4,
    },
    destination: {
      row: 3,
      col: 4,
    },
  },
  {
    id: 1,
    player: 1,
    piece: {
      id: 0,
      col: 4,
    },
    destination: {
      row: 4,
      col: 4,
    },
  },
  {
    id: 2,
    player: 0,
    piece: {
      id: 2,
      col: 4,
    },
    destination: {
      row: 3,
      col: 4,
    },
  },
  {
    id: 3,
    player: 1,
    piece: {
      id: 0,
      col: 4,
    },
    destination: {
      row: 4,
      col: 4,
    },
  },
  {
    id: 4,
    player: 1,
    piece: {
      id: 0,
      col: 4,
    },
    destination: {
      row: 4,
      col: 4,
    },
  },
];
