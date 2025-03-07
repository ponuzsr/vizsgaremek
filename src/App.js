import React, { useEffect } from "react";
import "./index.css";
import "./App.css";
import { Routes, Route, useLocation } from "react-router-dom";
import Navbar from "./Navbar";
import Fooldal from "./Fooldal";
import Game from "./Game";
import Bejelentkezes from "./Bejelentkezes";
import Autok from "./Autok";
import Onecar from "./Onecar";
import Regisztracio from "./Regisztracio";
import Profil from "./Profil";
import GameStarter from "./GameStarter";
import Admin from "./Admin";
import Moderator from "./Moderator";
import Onecar2 from "./Onecar2";
const App = () => {
  const location = useLocation();

  function getPageTitle(pathname) {
    switch (pathname) {
      case "/Game":
        return "Ricsi kicsi kocsija";
      case "/GameStart":
          return "Ricsi kicsi kocsija";
      case "/bejelentkezes":
        return "Bejelentkezés";
      case "/autok/50":
        return "50-es évek autói";
      case "/autok/60":
        return "60-as évek autói";
      case "/autok/70":
        return "70-es évek autói";
      case "/autok/80":
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
      <div className="header_our">{activePage}</div>
      <div className="main-container">
        <Navbar />
        <div className="content">
        
        {/*Routok */}
          <Routes>
            <Route path="/" element={<Fooldal />} />
            <Route path="/Game"element={<Game/>}/>
            <Route path="/bejelentkezes" element={<Bejelentkezes />} />
            <Route path="/autok/:ev" element={<Autok />} />
            <Route path="/Onecar/:id" element={<Onecar/>}/>
            <Route path="/regisztracio" element={<Regisztracio/>}/>
            <Route path="/profil" element={<Profil/>}/>
            <Route path="/GameStart" element={<GameStarter/>}/>
            <Route path="/admin" element={<Admin/>}/>
            <Route path="/mod" element={<Moderator/>}/>
            <Route path="/Onecar2/:id" element={<Onecar2/>}/>
          </Routes>
        </div>
      </div>
    </div>
  );
};

export default App;
