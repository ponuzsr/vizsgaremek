import React from 'react'
import { useNavigate } from 'react-router-dom'
import { jwtDecode } from 'jwt-decode';
import "./Bejelentkezes.css";
import "./Regisztracio.css";
export default function Regisztracio() {
  let navigate=useNavigate();
  function Post(){
    
    let felhasznalo=
    {
      userName: document.getElementById("exampleInputEmailnev").value,
      email: document.getElementById("exampleInputEmailcim").value,
      password: document.getElementById("exampleInputPassword").value,
  
    }
    let role_adat=
    {
      userName: document.getElementById("exampleInputEmailnev").value,
      role: "user"
    }
    fetch("http://localhost:5198/Felhasználók/Register",{method:"POST",body:JSON.stringify(felhasznalo),headers:{"content-type":"application/json"}}) 
    /*.then(function(response)
    {
      return response.json()
    }
    )
    .then(function(response) {
      console.log(response)
      localStorage.setItem("token", response.token)
      let myToken =jwtDecode(localStorage.getItem("token"));
      console.log(myToken);}
    )*/
    .then(function () {
      fetch(`http://localhost:5198/Felhasználók/AssignRole?UserName=${role_adat.userName}&roleName=${role_adat.role}`,{method:"POST",headers:{"content-type":"application/json"}})
    } 
    )
    //.then(function(){localStorage.removeItem("token")})
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

          <div className='signin_container'>
         {/*Regisztrációhoz adatok */}
        <div className='center_texts d-grid gap-2 col-5 mx-auto'>

           {/*Felhasználónév */}
        <div className="username">
            <label for="exampleInputEmailnev" class="form-label" className='label'>Felhasználónév</label>
            <input type="username" class="form-control" id="exampleInputEmailnev" aria-describedby="emailHelp" className='data'/>
          </div>

           {/*Email */}
          <div className="email">
            <label for="exampleInputEmailcim" class="form-label" className='label'>Email cím</label>
            <input type="email" class="form-control" id="exampleInputEmailcim" aria-describedby="emailHelp" className='data'/>
          </div>

           {/*Jelszó */}
          <div className="password">
            <label for="exampleInputPassword" class="form-label" className='label'>Jelszó</label>
            <input type="password" class="form-control" id="exampleInputPassword" className='data'/>
          </div>
          <br/>

           {/*Sikeres regisztrálás után vissza dob a bejelentkezés oldalra */}
          
          <button onClick={function(){alert("Köszönjük! Az ön regisztrálása sikeres!")}} type="submit" className='button'>Regisztráció</button>
          </div>
          
        </div>
      </form>
    </div>
     {/*Regisztrációs feltételek leírása */}
    <div className='col'>
      <div className='feltetelek'>
        <h1>Regisztrációs feltételek!</h1>
        <p>Az Email cím csak akkor érvényes ha tartalmaz @ és .hu vagy .com-ot,</p>
        <p>A Felhasználónév létrehozásakor ügyeljen arra, hogy minimum 6 karakter legyen</p>
        <p>A Jelszó készítéskor ajánjuk, hogy tartalmazzon kicsi és nagy betűket illetve számot és speciális karaktereket.</p>
        <p>Regisztrálni csak 12 év felettieknek lehet!</p>
        <p>Regisztrálás után ha bejelentkezel jogosultságot kapsz kommentelni autóink alá.</p>
        <p>Kérjük kommenteléskor csúnya szavakat kerülje! Ha ez nem sikerül akkor profilja törlésre kerül!</p>
        <p>Adatait kérjük jegyezze meg és ne továbbítsa senkinek se.</p>
        <h1>Regisztrálását és megértését köszönjük!</h1>
        </div>
    </div>
    </div>
  )
}
