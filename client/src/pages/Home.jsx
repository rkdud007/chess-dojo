// Components
import { Layout, CreateGame, GameCard } from "../components";

// Page
function Home() {
  return (
    <Layout>
      <CreateGame />

      {/* Game List */}
      <div className="flex flex-col w-full">
        {/* Title */}
        <div className="mb-24 pb-8 font-serif font-bold text-[40px] text-dark border border-b-4 border-0 border-solid border-black">
          Games
        </div>
        <div className="flex flex-col">
          {/* Joinable Game */}
          <GameCard
            whites_address={"0xC95E024F1b26a937000a9652637ADa9cF0b7bbbC"}
          />
          {/* Spectate Game */}
          <GameCard
            whites_address={"0xBD4209D1fD207f6e2E62757c5E5C13aeea619d55"}
            blacks_address={"0xFBAE024F1b26a937000a9652637ADa9cF0b7fffA"}
          />
        </div>
      </div>
    </Layout>
  );
}

export default Home;
