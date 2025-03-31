import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link,useNavigate } from 'react-router-dom';
import { useEffect,useState } from "react";
import AutoFelvitel from './AutoFelvitel';
import Rolechanger from './Rolechanger';
import "./Admin.css";
import "./modal.css"
import RoleRemover from './RoleRemover';

import axios from 'axios';

export default function Admin() {
  let myToken =jwtDecode(localStorage.getItem("token"));
  let navigate=useNavigate();
  let usercheck="@"+myToken.name;
  console.log(usercheck);
  const[commentek,setcomments]=useState([])
  const[autobase,setautobase]=useState([]);
  const[modalOpened,setModalOpened]=useState(false)
  const[userbase,setuserbase]=useState([])
  console.log(modalOpened);
  useEffect(() => {
      Getcom()
      Get()
      GetUsers()
    }, [])
    function Get()
    {
    axios.get(`${process.env.REACT_APP_URL}/Autok`)
    .then(function(response){
      
      
      setautobase(response.data)
    })
    }

  function Getcom()
    {
      axios.get(`${process.env.REACT_APP_URL}/Comment`)
      .then(function(response){setcomments(response.data) })
    }
    
    function delete_button(id)
    {
        axios.delete(`${process.env.REACT_APP_URL}/Autok?Id=${id}`)
        .then(function(response)
            {
                alert("Sikeres törlés!");
                
                Get()
            }
        )
       
    }
    function GetUsers()
    {
      axios.get(`${process.env.REACT_APP_URL}/Felhasználók`)
      .then(function(response){setuserbase(response.data)})
    }

    function DeleteUsers(id){
      axios.delete(`${process.env.REACT_APP_URL}/Felhasználók?id=${id}`)
      .then(function(response)
      {
        alert("Sikeres törlés!")
        GetUsers()
      }
    )
    }
    function DeleteUser()
    {
      axios.delete(`${process.env.REACT_APP_URL}/Felhasználók?id=${myToken.sub}`).then(
        function(response)
        {
          alert("Sikeres törlés!")
        }
      ).then(function(){localStorage.removeItem("token")}).then(function() {navigate("/bejelentkezes")})
    }
   function mod1()
   {
    
    let modal = document.getElementById("elo");
    modal.style.display = "block";
    setModalOpened(true)
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
   }
  }
  function mod2()
  {
   
   let modal = document.getElementById("le");
   modal.style.display = "block";
   setModalOpened(true)
   window.onclick = function(event) {
     if (event.target == modal) {
       modal.style.display = "none";
     }
  }
 }
 function mod3()
 {
  
  let modal = document.getElementById("fel");
  modal.style.display = "block";
  setModalOpened(true)
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
 }
}
  return (
    <div> 
      <div className="row row-cols-1 row-cols-md-2 g-4">
        <div className='col'>
          <h2>{myToken.name}</h2>
              <p>{myToken.email}</p>
              <Link to={'/bejelentkezes'}>
                <button onClick={function(){localStorage.removeItem("token")}} className='admin_button'><i class="bi bi-door-closed"></i> Kijelentekzés</button>
              </Link>
              <br/>
              <button onClick={mod1} id="myBtn" className='admin_button'><i class="bi bi-trophy"></i> Előléptetés</button>
              <div id="elo" className="modal">
                <div  className="modal-content">   
                  <Rolechanger/>
                </div>
              </div>
              <br/>
              <button onClick={mod2} id="myBtn" className='admin_button'><i class="bi bi-emoji-frown"></i> Lefokozás</button>
              <div id="le" className="modal">
                <div  className="modal-content">   
                  <RoleRemover/>
                </div>
              </div>
              <br/>
              {/*<AutoFelvitel/>*/}
              <button onClick={mod3} id="myBtn" className='admin_button'><i class="bi bi-plus-circle"></i> Új Autó</button>
              <div id="fel" className="modal">
                <div  className="modal-content">
                  <AutoFelvitel get={Get}/>
                </div>
              </div>   
              <br/>
              
              <button className='admin_button' onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteUser()}}}><i class="bi bi-person-dash"></i> Fiók törlése</button>
              
        </div>
        <div className='col'>
          <h3 className='notifications'>Értesítések <i class="bi bi-bell"></i></h3>
          <div class="ertesitesek-item" style={{}}>
                {
                   commentek.map((comments)=>{return(
                    comments.postComment.includes(usercheck)?
                   <div className='notification'>      
                        <h3>{comments.userName}</h3>
                        <p class="text-break">{comments.postComment}</p>    
                         <Link to={"/Onecar2/"+comments.autoId}>
                            <button className="notification_button">Az autóhoz<i class="bi bi-caret-right-fill"></i></button>
                          </Link>    
                    </div>:
                    null
                    
                   )})
                }
          </div>        
        </div>
              <br/>
      </div>
      <div className='row'>
      <div className="col-md-12">
        <div className='row'>
        <div className='col-6 col-md-6'>
          <h2><i class="bi bi-car-front"></i>Autók:</h2>
        <div className='row row-cols-1 row-cols-md-2 g-4'>
        {
          autobase.map((autok)=>{return(
            
            <div className='col'>
              <div className='cars'>
                <div className='cars2'>
                <p>{autok.marka}</p>
                <button onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(autok.id)}}} className='cars_delete'><i class="bi bi-trash3"></i>Törlés</button>
                <Link to={"/modsitas/"+autok.id}>
                    <a className='cars_modification'><i class="bi bi-pen"></i>Módosítás</a>
                </Link>
                </div>
            </div>
            </div>
          )})
          
        }
        </div>
       </div>
       {/* className='row row-cols-1 row-cols-md-1 g-4'*/}
       <div className='col-6 col-md-6'>
        <h2><i class="bi bi-person-circle"></i>Felhasználók:</h2>
        <div className='row row-cols-1 row-cols-md-2 g-4'>
        {
            userbase.map((users)=>{return(
              users.userName!=myToken.name?
              <div className='col'>
                <div className='cars'>
                  <div className='cars2'>
                  <p>{users.userName}</p>
                  <button onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteUsers(users.id)}}} className='cars_delete'><i class="bi bi-trash3"></i>Törlés</button>
                  </div>
                </div>
              </div>:
              null
            )})
          
          }
          </div>
       </div>
      </div>
      </div>
    </div>
    </div>
  )
}