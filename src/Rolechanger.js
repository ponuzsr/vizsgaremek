import React from 'react'

export default function Rolechanger() {
    function Post()
    {
      let role_adat=
      {
        userName: document.getElementById("nev").value,
        role: document.getElementById("rol").value,
      }
        fetch(`http://localhost:5198/Felhasználók/AssignRole?UserName=${role_adat.userName}&roleName=${role_adat.role}`,{method:"POST",headers:{"content-type":"application/json"}})
      
    }
  return (
    <div>
         <h2>Adminná változtatás</h2>
        <form onSubmit={function(event) {
            event.preventDefault()
            Post()
        }}>
        <div>
            <label for="nev" class="form-label" className='label'>Felhasználónév</label>
            <br/>
                <input type="username" class="form-control" id="nev" aria-describedby="nevHelp"/>
            </div>

            {/*Jelszó */}
            <div>
                <label for="rol" class="form-label" className='label'>Új szerepkör</label>
                <br/>
                <input type="text" class="form-control" id="rol" />
            </div>
            <br />
            
            <button onClick={function(){alert(document.getElementById("nev").value+" mostantól admin")}} className='btn btn-primary' type="submit">Előléptetés</button>
            <div/>
        </form>
    </div>
  )
}
