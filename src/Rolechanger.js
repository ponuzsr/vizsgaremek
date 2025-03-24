import React from 'react'
import "./Rolechanger.css";
import axios from 'axios';

export default function Rolechanger() {
    function Post()
    {
      let role_adat=
      {
        userName: document.getElementById("nev").value,
        role: document.getElementById("rol").value,
      }
        axios.post(`http://localhost:5198/Felhasználók/AssignRole?UserName=${role_adat.userName}&roleName=${role_adat.role}`)
      
    }
    
  return (
    <div className='rolechange'>
         <h2 className='admin'>Adminná változtatás</h2>
        <form onSubmit={function(event) {
            event.preventDefault()
            Post()
        }}>
        <div>
            <label for="nev" class="form-label" className='label'>Felhasználónév</label>
            <br/>
                <input type="username" class="form-control" className='szerepkor' id="nev" aria-describedby="nevHelp"/>
            </div>

            <br/>

            {/*Jelszó */}
            <div>
                <label for="rol" class="form-label" className='label'>Új szerepkör</label>
                <br/>
                <input type="text" class="form-control" className='szerepkor' id="rol" />
            </div>
            <br />
            
            <button onClick={function(){alert(document.getElementById("nev").value+" mostantól admin")}} className='eloleptetes' type="submit">Előléptetés</button>
            <div/>
        </form>
    </div>
  )
}
