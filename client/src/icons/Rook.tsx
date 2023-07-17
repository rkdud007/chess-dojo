import { IconProps } from ".";

// Credits to Noah Jacobs for the chess icons - https://noahjacob.us/
export const Rook = (props: IconProps) => {
  return (
    <svg
      width={props.width ? props.width : "40"}
      height={props.height ? props.height : "40"}
      viewBox="0 0 16 16"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M2 0H4V2H7V0H9V2H12V0H14V5L11 8L12 12L14 14V16H2V14L4 12L5 8L2 5V0Z"
        fill={props.color ? props.color : "#FFFFFF"}
      />
    </svg>
  );
};
