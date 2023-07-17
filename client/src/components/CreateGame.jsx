import { Link } from "react-router-dom";

// Icons
import { Plus } from "../icons";

// Component
export const CreateGame = () => {
  return (
    <>
      {/* Create Game Button */}
      {/* TODO Create a global context for logged in users */}
      <Link
        to={`/game?create=${encodeURIComponent(
          "0xC95E024F1b26a937000a9652637ADa9cF0b7bbbC"
        )}`}
        className="flex justify-center items-center w-full h-[78px] mb-24 bg-purple rounded-2 font-grotesk font-bold text-cream text-20 cursor-pointer"
      >
        <div className="mr-4 mt-4">
          <Plus />
        </div>
        Create Game
      </Link>
    </>
  );
};
