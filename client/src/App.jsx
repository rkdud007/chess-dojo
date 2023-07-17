import { BrowserRouter as Router, Route, Routes } from "react-router-dom";

// Pages
import { Home, Game } from "./pages";

// App
function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/game" element={<Game />} />
      </Routes>
    </Router>
  );
}

export default App;
