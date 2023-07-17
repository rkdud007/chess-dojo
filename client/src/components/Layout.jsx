// Components
import { Header } from "../components";

// Component
export const Layout = ({ children }) => {
  return (
    <main className="max-w-[1024px] w-full m-auto">
      <Header />
      {children}
    </main>
  );
};
