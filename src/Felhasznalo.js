import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link,useNavigate } from 'react-router-dom';
import { useEffect,useState } from "react";
import "./Felhasznalo.css";
import axios from 'axios';

export default function Felhasznalo() { 
  let myToken =jwtDecode(localStorage.getItem("token"));
  let navigate=useNavigate();
  let usercheck="@"+myToken.name;
  console.log(usercheck);
  const[commentek,setcomments]=useState([])
  useEffect(() => {
      Getcom()
    }, [])

  function Getcom()
    {
      axios.get("http://localhost:5198/Comment")
      .then(function(response){setcomments(response.data) })
    }

    function DeleteUser()
    {
      axios.delete(`http://localhost:5198/Felhasználók?id=${myToken.sub}`)
      .then(function(response)
        {
          alert("Sikeres törlés!")
        }
      ).then(function(){localStorage.removeItem("token")}).then(function() {navigate("/bejelentkezes")})
    }
  return (
    <div> 
      <div className="row row-cols-1 row-cols-md-2 g-4">
        <div className='col'>
          <h2>{myToken.name}</h2>
              <p>{myToken.email}</p>
              <Link to={'/bejelentkezes'}>
                <button onClick={function(){localStorage.removeItem("token")}} class="users"><i class="bi bi-door-closed"></i> Kijelentekzes</button>
              </Link>

              <button className='admin_button' onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteUser()}}}>Fiók törlése</button>
        </div>
        <div className='col'>
          <h3 className='notifications'>Értesítések</h3>
          <div class="ertesitesek-item" style={{}}>
                {
                   commentek.map((comments)=>{return(
                    comments.postComment.includes(usercheck)?
                   <div className='users_notifications'>      
                        <p class="text-break">{comments.postComment}</p>    
                        <Link to={"/Onecar2/"+comments.autoId}>
                            <button className='usersNotifications_button'>Az autóhoz<i class="bi bi-caret-right-fill"></i></button>
                        </Link>    
                    </div>:
                    <div/>
                    
                   )})
                }
          </div>        
        </div>
              
      </div>
    </div>
  )
}
