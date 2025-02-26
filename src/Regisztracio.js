import React from 'react'
import { useNavigate } from 'react-router-dom'
export default function Regisztracio() {
  let navigate=useNavigate();
  function Post(){
    
    let felhasznalo=
    {
      userName: document.getElementById("exampleInputEmailnev").value,
      email: document.getElementById("exampleInputEmailcim").value,
      password: document.getElementById("exampleInputPassword").value,
  
    }
    fetch("http://localhost:5198/Felhasználók/Register",{method:"POST",body:JSON.stringify(felhasznalo),headers:{"content-type":"application/json"}}) 
    .then(function() {
        navigate("/bejelentkezes")
    })
  }
 
  return (
    <div className="row row-cols-1 row-cols-md-2 g-4">
    <div  className='col'>
      <form onSubmit={function(event) {
            event.preventDefault()
            Post()
        }}>

         {/*Regisztrációhoz adatok */}
        <div className='center_texts d-grid gap-2 col-5 mx-auto'>

           {/*Felhasználónév */}
        <div class="username">
            <label for="exampleInputEmailnev" class="form-label">Felhasználónév</label>
            <input type="username" class="form-control" id="exampleInputEmailnev" aria-describedby="emailHelp"/>
          </div>

           {/*Email */}
          <div class="email">
            <label for="exampleInputEmailcim" class="form-label">Email cím</label>
            <input type="email" class="form-control" id="exampleInputEmailcim" aria-describedby="emailHelp"/>
          </div>

           {/*Jelszó */}
          <div class="password">
            <label for="exampleInputPassword" class="form-label">Jelszó</label>
            <input type="password" class="form-control" id="exampleInputPassword"/>
          </div>
          <br/>

           {/*Sikeres regisztrálás után vissza dob a bejelentkezés oldalra */}
          
          <button onClick={function(){alert("Köszönjük! Az ön regisztrálása sikeres!")}} type="submit" class="btn btn-info">Regisztráció</button>
          
          
        </div>
      </form>
    </div>
     {/*Regisztrációs feltételek leírása */}
    <div className='col'>
        <h1>Regisztrációs feltételek!</h1>
        <p>Az Email cím csak akkor érvényes ha tartalmaz @ és .hu vagy .com-ot,</p>
        <p>A Felhasználónév létrehozásakor ügyeljen arra, hogy minimum 10 karakter legyen és tartalmazzon számot is,</p>
        <p>A Jelszó készítéskor ajánjuk, hogy tartalmazzon kicsi és nagy betűket illetve számot is illetve minimum 12 karakter legyen.</p>
        <p>Regisztrálás után kérjük jelentkezzen be felületünkön.</p>
        <p>Adatait kérjük jegyezze meg és ne továbbítsa senkinek se.</p>
        <h1>Regisztrálását és megértését köszönjük!</h1>
    </div>
    </div>
  )
}
