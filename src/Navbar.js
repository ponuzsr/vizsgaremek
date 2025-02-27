import React, { useState } from "react";
import { Link } from "react-router-dom";
import Dropdown from "./Dropdown";

function Navbar() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const token = localStorage.getItem("token")
  return (
    
    <nav className="sidebar">
       {/* Nav linkek*/}
      <Link className="navBtn" to="/"><i class="bi bi-house"></i>Főoldal</Link>
      <Link className="navBtn" to="/ertesitesek">??????</Link>
      <Link className="navBtn" to="/bejelentkezes"> <i class="bi bi-person-circle"></i>Bejelentkezés</Link>
      <Dropdown isOpen={isDropdownOpen} setIsOpen={setIsDropdownOpen} />
    </nav>
  );
};

export default Navbar;