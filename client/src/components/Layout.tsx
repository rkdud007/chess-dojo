import { ReactNode } from "react";

// Components
import { Header } from ".";

// Types
type LayoutType = {
  children: ReactNode;
};

// Component
export const Layout = ({ children }: LayoutType) => {
  return (
    <main className="max-w-[1024px] w-full m-auto">
      <Header />
      {children}
    </main>
  );
};
