import React, { useState } from 'react'

export default function RoleRemover() {
    const [nev,setnev] = useState(null)
    function Felhasznalo(event)
    {
        setnev(event.target.value)
    }
    function RemoveRole(name)
    {
       
      console.log(name)
      fetch(`http://localhost:5198/Felhasználók/DeleteRole?user=${name}&role=admin`,{method:"DELETE"})
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
            
            <button onClick={function(){alert(document.getElementById("nev").value+" mostantól nem admin")}} className='eloleptetes' type="submit">Lefokozás</button>
            <div/>
        </form>
        </div>
  )
}
