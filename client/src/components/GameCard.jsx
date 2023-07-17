import { Link } from "react-router-dom";
import Identicon from "react-identicons";

// Utils
import { truncate } from "../utils";

// Icons
import { Eye } from "../icons";

// Component
export const GameCard = ({ whites_address, blacks_address }) => {
  // Variables
  const avatarColors = ["#8870EA", "#EA66CD", "#FF72A0", "#FF9976", "#FFCA5F"];

  // Render
  return (
    <div className="flex flex-row w-full h-[78px] mb-8 last:mb-0">
      {/* Image */}
      <div className="min-w-[78px] h-full mr-8 bg-cream rounded-2">
        <Identicon string={whites_address} size={78} palette={avatarColors} />
      </div>

      {/* Whites Player */}
      <div className="flex justify-center items-center w-[50%] h-full mr-8 px-16 bg-cream rounded-2">
        <span className="font-grotesk text-20 text-dark truncate">
          {truncate(whites_address)}
        </span>
      </div>

      {/* Blacks Player */}
      {!blacks_address ? (
        <Link
          to={`/game?join=${encodeURIComponent(whites_address)}`}
          className="flex justify-center items-center w-[50%] h-full mr-8 px-16 bg-purple cursor-pointer rounded-2"
        >
          <span className="font-grotesk font-bold text-20 text-cream truncate">
            Join
          </span>
        </Link>
      ) : (
        <div className="flex justify-center items-center w-[50%] h-full mr-8 px-16 bg-darkPurple rounded-2">
          <span className="font-grotesk blacks_address text-20 text-cream truncate">
            {truncate(blacks_address)}
          </span>
        </div>
      )}

      {/* Spectate */}
      <Link to={`/game?spectate=${encodeURIComponent(whites_address)}`}>
        <div className="flex justify-center items-center min-w-[78px] h-full bg-dark rounded-2 cursor-pointer">
          <Eye />
        </div>
      </Link>
    </div>
  );
};
