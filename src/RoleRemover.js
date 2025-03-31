
import axios from 'axios'

import React, { useState } from 'react'

export default function RoleRemover() {
    const [nev,setnev] = useState(null)
    const [message, setMessage] = useState("")
    function Felhasznalo(event)
    {
        setnev(event.target.value)
    }
    async function RemoveRole(name)
    {
       
      try{
        await axios.delete(`${process.env.REACT_APP_URL}/Felhasználók/DeleteRole?user=${name}&role=admin`)
        setMessage(`${name} mostantól nem admin`)
        //alert(name+" mostantól nem admin")

      }
      catch(error)
      {
          console.log(error)
      }
     
    }
  return (
        <div className='rolechange'>
            <h2 className='admin'>Lefokozás</h2>
        <form onSubmit={function(event) {
            event.preventDefault()
            RemoveRole(nev)
        }}>
        <div>
            <label for="nev" class="form-label" className='label'>Felhasználónév</label>
            <br/>
                <input type="username" class="form-control" className='szerepkor' id="nev" aria-describedby="nevHelp" required onChange={Felhasznalo}/>
            </div>

            {/*Jelszó */}
        
            <br />
            {message?<p>{message}</p>:null}
            <button className='eloleptetes' type="submit">Lefokozás</button>
            <div/>
        </form>
        </div>
  )

}



