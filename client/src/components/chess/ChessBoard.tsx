import { useEffect, useState } from "react";
import { DndProvider } from "react-dnd";
import { HTML5Backend } from "react-dnd-html5-backend";

// Setup
import { piecesPositions } from "../../setup/positions";

// Components
import { ChessPiece } from "./ChessPiece";

// Types
import { PiecePositionType } from "../../setup/positions";

// Component
export const ChessBoard = () => {
  // State
  const [piecesPos, setPiecesPos] = useState<PiecePositionType[]>([]);

  // Functions
  const findPiece = (pos: { row: number; col: number }) => {
    return piecesPos.find((item) => {
      return (
        item.position &&
        item.position.row === pos.row &&
        item.position.col === pos.col
      );
    });
  };

  const renderPiece = (piece: PiecePositionType) => {
    console.log("piece.piece.id", piece.piece.id);
    let type = "";
    switch (piece.piece.id) {
      case 0:
        type = "pawn";
        break;
      case 1:
        type = "rook";
        break;
      case 2:
        type = "knight";
        break;
      case 3:
        type = "bishop";
        break;
      case 4:
        type = "queen";
        break;
      case 5:
        type = "king";
        break;
      default:
        break;
    }

    let color = "";
    if (piece.player === 0) {
      color = "white";
    } else {
      color = "black";
    }

    return <ChessPiece type={type} color={color} />;
  };

  const spawnTiles = () => {
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h"];
    const tiles = [];

    for (let i = 0; i < letters.length; i++) {
      const rows = [];
      for (let y = 0; y < letters.length; y++) {
        const isRowEven = i % 2 === 0;
        const isColEven = y % 2 === 0;

        // Get tile color
        let color = "";
        if (isRowEven && isColEven) {
          color = "white";
        } else if (!isRowEven && isColEven) {
          color = "black";
        } else if (isRowEven && !isColEven) {
          color = "black";
        } else {
          color = "white";
        }

        // Check if piece is there
        const tilePos = {
          row: i,
          col: y,
        };
        const piece = findPiece(tilePos);

        rows.push(
          <div
            key={`${i}-${y}`}
            className={`w-80 h-80 relative ${
              color === "white" ? "bg-cream" : "bg-darkPurple"
            }`}
          >
            {piece ? renderPiece(piece) : null}
            {y === 0 ? (
              <span
                className={`mx-6 absolute font-grotesk font-bold text-20 ${
                  color === "white" ? "text-dark" : "text-cream"
                }`}
              >
                {/* TODO rotate board if you are black player */}
                {`${letters.length - i}`}
              </span>
            ) : null}
            {i === letters.length - 1 ? (
              <div className="flex justify-end items-end w-full h-full absolute">
                <span
                  className={`mx-6 font-grotesk font-bold text-20 ${
                    color === "white" ? "text-dark" : "text-cream"
                  }`}
                >
                  {/* TODO rotate board if you are black player */}
                  {`${letters[y]}`}
                </span>
              </div>
            ) : null}
          </div>
        );
      }
      tiles.push(
        <div key={`${i}`} className="flex flex-row">
          {rows}
        </div>
      );
    }

    return tiles;
  };

  useEffect(() => {
    // TODO For active games we need to positions pieces here
    setPiecesPos(piecesPositions);
  }, []);

  return (
    <DndProvider backend={HTML5Backend}>
      <div className="flex flex-col w-full h-full">{spawnTiles()}</div>
    </DndProvider>
  );
};
