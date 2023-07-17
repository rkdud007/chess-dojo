import { useEffect } from "react";
import { DndProvider } from "react-dnd";
import { HTML5Backend } from "react-dnd-html5-backend";

// Components
import { ChessPiece } from "./ChessPiece";

// Component
export const ChessBoard = () => {
  const spawnTiles = () => {
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h"];
    const tiles = [];

    for (let i = 0; i < letters.length; i++) {
      const rows = [];
      for (let y = 0; y < letters.length; y++) {
        const isRowEven = i % 2 === 0;
        const isColEven = y % 2 === 0;

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

        rows.push(
          <div
            key={`${i}-${y}`}
            className={`w-80 h-80 relative ${
              color === "white" ? "bg-cream" : "bg-darkPurple"
            }`}
          >
            <ChessPiece />
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
  }, []);

  return (
    <DndProvider backend={HTML5Backend}>
      <div className="flex flex-col w-full h-full">{spawnTiles()}</div>
    </DndProvider>
  );
};
