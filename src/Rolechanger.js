import React from 'react'
import "./Rolechanger.css";
import axios from 'axios';
import { useState } from "react";
export default function Rolechanger() {
  const [message, setMessage] = useState("")
    async function Post()
    {
      let role_adat=
      {
        userName: document.getElementById("nev").value,
        role: document.getElementById("rol").value,
      }
      try
      {
        await axios.post(`${process.env.REACT_APP_URL}/Felhasználók/AssignRole?UserName=${role_adat.userName}&roleName=${role_adat.role}`)
        setMessage(`${role_adat.userName} mostantól admin`)
      }
      catch(error)
      {
        console.log(error)
      }
      
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
                <input type="text" class="form-control" className='szerepkor' required id="rol" />
            </div>
            <br />
            {message?<p>{message}</p>:null}
            <button className='eloleptetes' type="submit">Előléptetés</button>
            <div/>
        </form>
    </div>
  )
}
