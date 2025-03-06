import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link } from 'react-router-dom';
export default function Admin() {
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
        <h3>Autók</h3>
        <div class="ertesitesek-item" style={{}}>Admin felület</div>        
      </div>
            
    </div>
  )
}

