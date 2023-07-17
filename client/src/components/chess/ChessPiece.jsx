import { PiecesTypes } from "../../utils/drag";
import { useDrag } from "react-dnd";

// Icons
import { Pawn, Rook, Knight, Bishop, Queen, King } from "../../icons";

// Component
export const ChessPiece = ({ type = "pawn", color = "#FFFFFF" }) => {
  // Hooks
  const [{ isDragging }, drag] = useDrag(() => ({
    type: PiecesTypes.KNIGHT,
    collect: (monitor) => ({
      isDragging: !!monitor.isDragging(),
    }),
  }));

  // Functions
  const renderPiece = () => {
    switch (type) {
      case "pawn":
        return <Pawn color={color} />;
      case "rook":
        return <Rook color={color} />;
      case "knight":
        return <Knight color={color} />;
      case "bishop":
        return <Bishop color={color} />;
      case "queen":
        return <Queen color={color} />;
      case "king":
        return <King color={color} />;
      default:
        break;
    }
  };

  // Render
  return (
    <div
      ref={drag}
      style={{
        opacity: isDragging ? 0.32 : 1,
      }}
      className="flex justify-center items-center w-full h-full absolute cursor-move bg-transparent"
    >
      {renderPiece()}
    </div>
  );
};
