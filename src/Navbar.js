import React, { useState } from "react";
import { Link } from "react-router-dom";
import Dropdown from "./Dropdown";

function Navbar() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  return (
    <nav className="navbar_our">
      <Link className="navBtn" to="/">🏠︎ Főoldal</Link>
      <Link className="navBtn" to="/ertesitesek">??????</Link>
      <Link className="navBtn" to="/bejelentkezes">𖨆 Bejelentkezés</Link>
      <Dropdown isOpen={isDropdownOpen} setIsOpen={setIsDropdownOpen} />
    </nav>
  );
};

export default Navbar;