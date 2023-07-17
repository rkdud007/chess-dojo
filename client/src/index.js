import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

// CSS
import "./styles/globals.css";
import "./styles/fonts.css";
import "./styles/animations.css";

// App
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
