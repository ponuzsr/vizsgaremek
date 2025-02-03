import React, { useEffect } from "react";
import "./index.css";
import "./App.css";
import { Routes, Route, useLocation } from "react-router-dom";
import Navbar from "./Navbar";
import Fooldal from "./Fooldal";
import Ertesitesek from "./Ertesitesek";
import Bejelentkezes from "./Bejelentkezes";
import Autok from "./Autok";

const App = () => {
  const location = useLocation();

  function getPageTitle(pathname) {
    switch (pathname) {
      case "/ertesitesek":
        return "Értesítések";
      case "/bejelentkezes":
        return "Bejelentkezés";
      case "/autok/50s":
        return "50-es évek autói";
      case "/autok/60s":
        return "60-as évek autói";
      case "/autok/70s":
        return "70-es évek autói";
      case "/autok/80s":
        return "80-as évek autói";
      default:
        return "Főoldal";
    }
  }

  const activePage = getPageTitle(location.pathname);

  useEffect(() => {
    document.title = `${activePage} | ClassicGarage`;
  }, [activePage]);

  return (
    <div className="app">
      <div className="header">{activePage}</div>
      <div className="main-container">
        <Navbar />
        <div className="content">
          <Routes>
            <Route path="/" element={<Fooldal />} />
            <Route path="/ertesitesek" element={<Ertesitesek />} />
            <Route path="/bejelentkezes" element={<Bejelentkezes />} />
            <Route path="/autok/:ev" element={<Autok />} />
          </Routes>
        </div>
      </div>
    </div>
  );
};

export default App;
