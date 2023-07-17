import { Link } from "react-router-dom";

// Icons
import { Login } from "../icons";

// Component
export const Header = () => (
  <div className="flex justify-between items-center w-full my-16">
    {/* Logo */}
    <div className="w-[50%]">
      <Link to="/">
        <div className="font-serif font-bold text-24 text-dark">DChess</div>
      </Link>
    </div>
    {/* Login */}
    <div className="flex justify-end w-[50%] cursor-pointer">
      <div className="flex justify-center items-center w-[78px] h-[48px] bg-dark rounded-2">
        <Login />
      </div>
    </div>
  </div>
);
