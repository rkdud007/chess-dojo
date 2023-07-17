import { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";

// Temp
import { testMoves } from "../temp/moves";

// Components
import { Layout, PlayerInfos, ChessBoard, ChessMoves } from "../components";

// Page
function Game() {
  // State
  const [whitesAddress, setWhitesAddress] = useState("");
  const [blacksAddress, setBlacksAddress] = useState("");
  const [moves, setMoves] = useState([]);

  // Hooks
  const location = useLocation();
  const searchParams = new URLSearchParams(location.search);
  const spectateParam = searchParams.get("spectate");
  const joinParam = searchParams.get("join");
  const createParam = searchParams.get("create");

  // Functions
  useEffect(() => {
    // DEBUG
    setMoves(testMoves);
    console.log("url params:", spectateParam, joinParam, createParam);

    if (spectateParam) {
      setWhitesAddress(spectateParam);
      // TODO Spectate game
    } else if (joinParam) {
      setWhitesAddress(joinParam);
      // TODO Join game
    } else if (createParam) {
      setWhitesAddress(createParam);
      // TODO Create game
    } else {
      // TODO Error
    }
  }, [location]);

  // Render
  return (
    <Layout>
      <div className="flex flex-row w-full">
        {/* Board */}
        <div className="flex flex-col w-[640px] mr-8">
          {/* Blacks Infos */}
          {/* TODO Update state for blacksAddress */}
          <div className="mb-8">
            <PlayerInfos color="black" address={whitesAddress} />
          </div>

          <ChessBoard moves={moves} />
          <div className="mt-8">
            <PlayerInfos color="white" address={whitesAddress} />
          </div>
        </div>

        {/* Moves History */}
        <div className="flex flex-col w-full">
          <div className="w-full h-full">
            <ChessMoves moves={moves} />
          </div>

          {/* Actions */}
          <div className="w-full">
            {/* Draw */}
            <div className="flex justify-center items-center w-full p-16 bg-darkPurple rounded-2 mb-8 cursor-pointer">
              <span className="font-grotesk font-bold text-20 text-cream">
                Draw
              </span>
            </div>

            {/* Surrend */}
            <div className="flex justify-center items-center w-full p-16 bg-dark rounded-2 cursor-pointer">
              <span className="font-grotesk font-bold text-20 text-cream">
                Surrend
              </span>
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Game;
