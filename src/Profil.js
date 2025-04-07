import React from 'react'
import { jwtDecode } from 'jwt-decode'
import Admin from './Admin';
import Felhasznalo from './Felhasznalo';
import "./Profil.css";
export default function Profil() {
      let userToken =jwtDecode(localStorage.getItem("token"));
  return (
    <div>
      {/*A token role eldöntése ,hogy a felhasználó vagy admin komponenst töltse be. */}
        {userToken.role=="user"?<Felhasznalo/>:<Admin/>}
    </div>
  )
}
