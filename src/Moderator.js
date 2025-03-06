import React from 'react'
import { Link } from 'react-router-dom'
import { jwtDecode } from 'jwt-decode';
export default function Moderator() {
  let myToken =jwtDecode(localStorage.getItem("token"));
  return (
    <div className="row row-cols-1 row-cols-md-2 g-4">
      <div className='col'>
        <h2>{myToken.name}</h2>
            <p>{myToken.email}</p>
            <Link to={'/bejelentkezes'}>
              <button onClick={function(){localStorage.removeItem("token")}} class="upload-btn">Kijelentekzes</button>
            </Link>
      </div>
      <div className='col'>
        <h3>Felhasználók</h3>
        <div class="ertesitesek-item" style={{}}>Bejelentet felhasználók</div>        
      </div>
            
    </div>
  )
}
