import React, { useState } from "react";
import { Link } from "react-router-dom";
import Dropdown from "./Dropdown";
import { jwtDecode } from "jwt-decode";
function Navbar() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  let myToken =localStorage.getItem("token");
  return (
    
    <nav className="sidebar">
       {/* Nav linkek*/}
      <Link className="navBtn" to="/"><i class="bi bi-house"></i>Főoldal</Link>
      <Link className="navBtn" to="/ertesitesek">??????</Link>
      {!myToken ?<Link className="navBtn" to="/bejelentkezes"> <i class="bi bi-person-circle"></i>Bejelentkezés</Link>:<Link className="navBtn" to="/profil"> <i class="bi bi-person-circle"></i>Profil</Link>}
      <Dropdown isOpen={isDropdownOpen} setIsOpen={setIsDropdownOpen} />
    </nav>
  );
};

export default Navbar;