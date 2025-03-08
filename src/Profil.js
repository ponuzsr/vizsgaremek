import React from 'react'
import { jwtDecode } from 'jwt-decode'
import Admin from './Admin';
import Felhasznalo from './Felhasznalo';
export default function Profil() {
      let userToken =jwtDecode(localStorage.getItem("token"));
  return (
    <div>
        {userToken.role=="user"?<Felhasznalo/>:<Admin/>}
    </div>
  )
}
