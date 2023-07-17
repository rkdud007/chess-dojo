// Utils
import { truncate } from "../utils";

// Component
export const PlayerInfos = ({ color, address }) => {
  return (
    <div
      className={`w-full rounded-2 ${
        color === "black" ? "bg-dark" : "bg-cream"
      }`}
    >
      {/* Address */}
      <div
        className={`w-[50%] p-16 font-grotesk text-20 ${
          color === "black" ? "text-cream" : "text-dark"
        }`}
      >
        {truncate(address)}
      </div>
      {/* TODO Captured Pieces */}
      <div className={`w-[50%]`}></div>
    </div>
  );
};
