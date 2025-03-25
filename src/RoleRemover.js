
import axios from 'axios'

import React, { useState } from 'react'

export default function RoleRemover() {
    const [nev,setnev] = useState(null)
    function Felhasznalo(event)
    {
        setnev(event.target.value)
    }
    function RemoveRole(name)
    {
       
      if(name!="")
      {
        axios.delete(`http://localhost:5198/Felhasználók/DeleteRole?user=${name}&role=admin`).then(function(){alert(name+" mostantól nem admin")})
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
                <input type="username" class="form-control" className='szerepkor' id="nev" aria-describedby="nevHelp" onChange={Felhasznalo}/>
            </div>

            {/*Jelszó */}
        
            <br />
            
            <button className='eloleptetes' type="submit">Lefokozás</button>
            <div/>
        </form>
        </div>
  )

}



