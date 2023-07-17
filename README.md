# Dojo Chess

## Design v0

### Components, Entity

We have each piece as a seperate entity

- White pawn 1 ( Entity )
  - Piece ( Component )
  - Position ( Component )

We have Game entity with auth

- Game 1 ( Entity )
  - Game ( Component )
  - GameTurn ( Component )
  - PlayersId ( Component )

### System

- Initiate ( System )

  - Initiate Game
    - Generate Game Enitity
  - Initiate Pieces

- Execute Move ( System )

  - Generate Board Cache
  - Generate Possible moves
    - If there is piece need to occupy, kill piece
  - Check if next position is eligible to moves
  - Check Piece is owned by caller
  - Check is caller's turn
  - Update the position of the piece

- Give up ( System )
  - Check caller's color and set winner of opponent

---
