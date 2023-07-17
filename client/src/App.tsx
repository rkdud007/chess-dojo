import { BrowserRouter as Router, Route, Routes } from "react-router-dom";

// Dojo
import { useDojo } from "./DojoContext";
import { useComponentValue } from "@dojoengine/react";
import { Utils } from "@dojoengine/core";

// Pages
import { Home, Game } from "./pages";

// App
function App() {
  const {
    systemCalls: { initiate_system, give_up_system, execute_move_system },
    components: { Piece, Position },
  } = useDojo();

  const entityId = BigInt(import.meta.env.VITE_ENTITY_ID);
  const position = useComponentValue(
    Position,
    Utils.getEntityIdFromKeys([entityId])
  );
  const pieces = useComponentValue(
    Piece,
    Utils.getEntityIdFromKeys([entityId])
  );

  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/game" element={<Game />} />
        </Routes>
      </Router>

      {/* Test only */}
      <div className="card">
        <button
          onClick={() =>
            initiate_system(
              1,
              "0x03ee9e18edc71a6df30ac3aca2e0b02a198fbce19b7480a63a0d71cbd76652e0"
            )
          }
        >
          Spawn
        </button>
      </div>
      {/* <div className="card">
        <button onClick={() => execute_move_system()}>Move Left</button>
      </div>
      <div className="card">
        <button onClick={() => execute_move_system()}>Move Right</button>
      </div>
      <div className="card">
        <button onClick={() => execute_move_system()}>Move Up</button>
      </div>
      <div className="card">
        <button onClick={() => execute_move_system()}>Move Down</button>
      </div>
      <div className="card">
        <button onClick={() => give_up_system(Direction.Down)}>Give Up</button>
      </div>
      <div className="card">
        <div>
          Moves Remaining: {moves ? `${moves["remaining"]}` : "Need to Spawn"}
        </div>
      </div>
      <div className="card">
        <div>
          Position:{" "}
          {position ? `${position["x"]}, ${position["y"]}` : "Need to Spawn"}
        </div>
      </div> */}
    </>
  );
}

export default App;
