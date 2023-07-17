// Components
import { DotLoading } from "../animations/DotLoading";

// Types
import { MoveType } from "../../setup/moves";

export type ChessMovesType = {
  moves: MoveType[];
};

// Component
export const ChessMoves = ({ moves }: ChessMovesType) => {
  const renderMoves = () => {
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h"];
    const rounds = [];

    for (let i = 0; i < moves.length; i++) {
      const isNewRound = i % 2 === 0;
      const roundIndex = isNewRound ? i / 2 : (i - 1) / 2;

      if (isNewRound) {
        rounds.push(
          <div key={`${i}`} className="flex flex-row w-full">
            <div
              className={`flex justify-center items-center min-w-[60px] mr-8 p-16 font-grotesk text-20 text-cream ${
                roundIndex % 2 === 0 ? "bg-dark" : "bg-darkPurple"
              } ${i === 0 ? "rounded-t-2" : null} ${
                i === moves.length - 1 ? "rounded-b-2" : null
              }`}
            >
              {roundIndex}
            </div>
            <div
              className={`flex justify-center items-center w-[100%] mr-8 p-16 font-grotesk text-20 text-dark ${
                roundIndex % 2 === 0 ? "bg-cream" : "bg-darkCream"
              } ${i === 0 ? "rounded-t-2" : null} ${
                i === moves.length - 1 ? "rounded-b-2" : null
              }`}
            >
              {`${letters[moves[i].destination.col].toUpperCase()} ${
                moves[i].destination.row
              }`}
            </div>
            <div
              className={`flex justify-center items-center w-[100%] p-16 font-grotesk text-20 text-cream ${
                roundIndex % 2 === 0 ? "bg-dark" : "bg-darkPurple"
              } ${i === 0 ? "rounded-t-2" : null} ${
                i === moves.length - 1 ? "rounded-b-2" : null
              }`}
            >
              <DotLoading />
            </div>
          </div>
        );
      } else {
        // TODO append black move
        // const round = rounds[roundIndex];
        // const appendChild = round.mhildren[2].appendChild(<>Hello</>);
      }
    }

    return rounds;
  };

  return (
    <>
      {/* Heading */}
      <div className="flex flex-row w-full mb-8">
        <div className="flex justify-center items-center min-w-[60px] mr-8 p-16 font-grotesk text-20 text-cream bg-dark rounded-2">
          #
        </div>
        <div className="flex justify-center items-center w-[100%] mr-8 p-16 font-grotesk text-20 text-dark bg-cream rounded-2">
          Whites
        </div>
        <div className="flex justify-center items-center w-[100%] p-16 font-grotesk text-20 text-cream bg-dark rounded-2">
          Blacks
        </div>
      </div>

      {/* Moves */}
      <div className="flex flex-col w-full">{renderMoves()}</div>
    </>
  );
};
