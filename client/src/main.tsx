import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";

// Dojo
import { setup } from "./dojo/setup";
import { DojoProvider } from "./DojoContext";

// CSS
import "./styles/globals.css";
import "./styles/fonts.css";
import "./styles/animations.css";

// App
async function init() {
  const rootElement = document.getElementById("root");
  if (!rootElement) throw new Error("React root not found");
  const root = ReactDOM.createRoot(rootElement as HTMLElement);

  const setupResult = await setup();
  root.render(
    <React.StrictMode>
      <DojoProvider value={setupResult}>
        <App />
      </DojoProvider>
    </React.StrictMode>
  );
}

init();
