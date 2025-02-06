import React from "react";
import { Link } from "react-router-dom";

function Dropdown ({ isOpen, setIsOpen }) {
  const carYears = ["50", "60", "70", "80"];

  return (
    <div className="dropdown-container">
      <button className="dropdown-btn navBtn" onClick={() => setIsOpen(!isOpen)}>
      ✇ Autók {isOpen ? "▲" : "▼"}
      </button>
      {isOpen && (
        <div className="dropdown">
          {carYears.map((year) => (
            <Link className="dropdownBtn navBtn" key={year} to={`/autok/${year}`} onClick={() => setIsOpen(false)}>
              {year}-es évek
            </Link>
          ))}
        </div>
      )}
    </div>
  );
};

export default Dropdown;
