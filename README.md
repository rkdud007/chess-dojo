# Dojo Chess

## Thanks for all Dojo versions contributors

- [v1](https://github.com/rkdud007/chess-dojo/tree/tutoral) : @rkdud007 @Eikix
- [v2](https://github.com/rkdud007/chess-dojo/tree/tutorialv2) : @manikey123
- [v3](https://github.com/rkdud007/chess-dojo/tree/tutorialv3) : @gianalarcon @Akinbola247

---

_This repo is turning archieve. For further dojo version (0.4.0 ~) check out [Dojo Examples](https://github.com/dojoengine/dojo-examples) repo._

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
