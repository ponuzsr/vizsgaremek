import React, { useState, useEffect } from "react";
import "./App.css";

const App = () => {
  const [activePage, setActivePage] = useState("Főoldal");
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  useEffect(() => {
    const savedPage = localStorage.getItem("activePage") || "Főoldal";
    setActivePage(savedPage);
  }, []);

  useEffect(() => {
    localStorage.setItem("activePage", activePage);
  }, [activePage]);

  return (
    <div className="app">
      <div className="header">{activePage}</div>
      <div className="main-container">
        <nav className="navbar">
          <button onClick={() => setActivePage("Főoldal")}>Főoldal</button>
          <button onClick={() => setActivePage("Értesítések")}>
            Értesítések
          </button>
          <button onClick={() => setActivePage("Bejelentkezés")}>
            Bejelentkezés
          </button>
          <div className="dropdown-container">
            <button
              className="dropdown-btn"
              onClick={() => setIsDropdownOpen(!isDropdownOpen)}
            >
              Autók {isDropdownOpen ? "▲" : "▼"}
            </button>
            {isDropdownOpen && (
              <div className="dropdown">
                <button onClick={() => setActivePage("50-es évek autói")}>
                  50-es évek
                </button>
                <button onClick={() => setActivePage("60-as évek autói")}>
                  60-as évek
                </button>
                <button onClick={() => setActivePage("70-es évek autói")}>
                  70-es évek
                </button>
                <button onClick={() => setActivePage("80-as évek autói")}>
                  80-as évek
                </button>
              </div>
            )}
          </div>
        </nav>
        <div className="content">
          {activePage === "Főoldal" && (
            <div className="home-container">
              <h1>Üdvözöllek a ClassicGarage oldalon!</h1>
              <p>
                A ClassicGarage egy olyan weboldal, amely a klasszikus autók
                szerelmeseinek készült.
              </p>
              <img
                src="https://www.automotor.hu/wp-content/uploads/2016/07/232802_effeffeindex.jpg?x88250"
                alt="Egy autó"
              />
            </div>
          )}
          {activePage === "Értesítések" && (
            <div className="notifications-container">
              <h2>Értesítések</h2>
              <p>Nincsenek új értesítéseid.</p>
            </div>
          )}

          {activePage === "Bejelentkezés" && (
            <div className="login-container">
              <h2>Bejelentkezés</h2>
              <input type="text" placeholder="Felhasználónév" />
              <input type="email" placeholder="Email" />
              <input type="password" placeholder="Jelszó" />
              <button>Bejelentkezés</button>
            </div>
          )}
          {activePage === "50-es évek autói" && (
            <div className="cars-container">
              <h2>50-es évek autói</h2>
              <p>
                Az 50-es évek klasszikus amerikai és európai autói lenyűgözőek
                voltak.
              </p>
            </div>
          )}

          {activePage === "60-as évek autói" && (
            <div className="cars-container">
              <h2>60-as évek autói</h2>
              <p>
                A 60-as évek ikonikus izomautói és sportautói még ma is
                legendásak.
              </p>
            </div>
          )}

          {activePage === "70-es évek autói" && (
            <div className="cars-container">
              <h2>70-es évek autói</h2>
              <p>
                Az olajválság előtti utolsó igazi benzinfaló gépek korszaka.
              </p>
            </div>
          )}

          {activePage === "80-as évek autói" && (
            <div className="cars-container">
              <h2>80-as évek autói</h2>
              <p>
                A turbókorszak kezdete, digitális műszerfalak és futurisztikus
                design.
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default App;
