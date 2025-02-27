import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link } from 'react-router-dom';
export default function Profil() {
  
  let myToken =jwtDecode(localStorage.getItem("token"));
  return (
    <div>
       <h2>{myToken.name}</h2>
            <p>{myToken.email}</p>
            <Link to={'/bejelentkezes'}>
              <button onClick={localStorage.removeItem("token")} class="upload-btn">Kijelentekzes</button>
            </Link>
            
    </div>
  )
}
