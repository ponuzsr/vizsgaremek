import React from 'react'
import "./Rolechanger.css";
import axios from 'axios';
import { useState } from "react";
export default function Rolechanger() {
  const [message, setMessage] = useState("")
    //Szerepkőr adatok elküldése
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
            {/*Felhasználó neve */}
            <label for="nev" className='form-label' class='label'>Felhasználónév</label>
            <br/>
                <input type="username" className='form-control' class='szerepkor' id="nev" aria-describedby="nevHelp"/>
            </div>

            <br/>

            {/*Szerepkőr */}
            <div>
                <label for="rol" className='form-label' class='label'>Új szerepkör</label>
                <br/>
                <input type="text" className='form-control' class='szerepkor' required id="rol" />
            </div>
            <br />
            {message?<p>{message}</p>:null}
            <button className='eloleptetes' type="submit">Előléptetés</button>
            <div/>
        </form>
    </div>
  )
}
