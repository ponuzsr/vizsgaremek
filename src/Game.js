import React, { useState, useEffect } from "react";
import "./Game.css";

import { Link,useNavigate } from "react-router-dom";
export default function Game() {
  const [kocsik, setKocsik] = useState([]);
  const [robbanasok, setRobbanasok] = useState([]);
  const [pontok, setPontok] = useState(0);
  const [sebesseg, setSebesseg] = useState(35);
  const [eletek, setEletek] = useState(3);
  const navigate = useNavigate()

  

  const bummkep = "pics/bumm.png";
  const auto = "pics/suzuki.png";

  useEffect(() => {
    if (eletek == 0) {
      alert("Game Over")
      navigate("/GameStart")
    }

  }, [eletek])
  
  useEffect(() => {


    const mozgatInterval = setInterval(() => {
      setKocsik((prevKocsik) =>
        prevKocsik
          .map((kocsi) => {
            let ujkocsi = { ...kocsi, left: kocsi.left + sebesseg };
            if(ujkocsi.left >= window.innerWidth) {
              setEletek((prev) => prev - 1)
            }
            return ujkocsi;
          })
          .filter((kocsi) => kocsi.left < window.innerWidth)
      );

    }, 70);

    const kocsirajInterval = setInterval(() => {
      setKocsik((prevKocsik) => [
        ...prevKocsik,
        {
          id: Date.now(),
          left: -200,
          top: Math.round(Math.random() * (window.innerHeight - 100) + 1),
        },
      ]);
    }, 1000);
    return () => {
      clearInterval(mozgatInterval);
      clearInterval(kocsirajInterval);
    };
  }, [sebesseg]);

  const bumm = (id, event) => {
    // Eltávolítja az autót
    setKocsik((prevKocsik) => prevKocsik.filter((kocsi) => kocsi.id !== id));

    // Hozzáadja a robbanást az adott pozícióhoz
    const ujRobbanas = {
      id: Date.now(),
      left: event.clientX - 50,
      top: event.clientY - 50,
    };
    setRobbanasok((prev) => [...prev, ujRobbanas]);

    // 700 ms után eltűnik a robbanás
    setTimeout(() => {
      setRobbanasok((prev) => prev.filter((r) => r.id !== ujRobbanas.id));
    }, 700);

    // Növeli a pontszámot és sebességet
    setPontok((prev) => prev + 1);
    if ((pontok + 1) % 10 === 0) {
      setSebesseg((prev) => prev + 5);
    }
  };



  return (
    <div className="game-content">
      <div>
        <div className="game-pontozas">
          <h2>Életek: {eletek}</h2>
          <br />
          <h2>Pontok: {pontok}</h2>
        </div>
        <Link className='nav-item nav-link' to={"/GameStart"}>
          <a style={{ backgroundColor: "black", color: "white" }} className="btn btn w-100">Kilépés</a>
        </Link>
      </div>
      <div
        className="kocsicontent"

      >
        {/* Autók megjelenítése */}
        {kocsik.map((kocsi) => (
          <img
            key={kocsi.id}
            src={auto}
            alt="kocsi"
            style={{
              position: "absolute",
              width: "250px",
              height: "200px",
              left: kocsi.left,
              top: kocsi.top,
            }}
            onClick={(e) => bumm(kocsi.id, e)}
          />
        ))}

        {/* Robbanások megjelenítése */}
        {robbanasok.map((robbanas) => (
          <img
            key={robbanas.id}
            src={bummkep}
            alt="robbanás"
            style={{
              position: "absolute",
              width: "100px",
              height: "100px",
              left: robbanas.left - 340,
              top: robbanas.top,
            }}
          />
        ))}
      </div>
    </div>
  );
}
