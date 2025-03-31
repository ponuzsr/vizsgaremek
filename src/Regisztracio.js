import React from 'react'
import { useNavigate } from 'react-router-dom'
import { jwtDecode } from 'jwt-decode';
import "./Regisztracio.css";
import axios from 'axios';
export default function Regisztracio() {
  let navigate=useNavigate();
  async function Post(){
    
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
    try{
    await axios.post(`${process.env.REACT_APP_URL}/Felhasználók/Register`,felhasznalo) 
    
   
    axios.post(`${process.env.REACT_APP_URL}/Felhasználók/AssignRole?UserName=${role_adat.userName}&roleName=${role_adat.role}`)
    alert("Köszönjük! Az ön regisztrálása sikeres!")
    
    navigate("/bejelentkezes")
  }
  catch(error)
  {
    console.log(error)
  }
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
            <input type="username" class="form-control" id="exampleInputEmailnev" aria-describedby="emailHelp" required className='signin_data'/>
          </div>

           {/*Email */}
          <div className="email">
            <label for="exampleInputEmailcim" class="form-label" className='label'>Email cím</label>
            <input type="email" class="form-control" id="exampleInputEmailcim" aria-describedby="emailHelp" required className='signin_data'/>
          </div>

           {/*Jelszó */}
          <div className="password">
            <label for="exampleInputPassword" class="form-label" className='label'>Jelszó</label>
            <input type="password" class="form-control" id="exampleInputPassword" required className='signin_data'/>
          </div>
          <br/>

           {/*Sikeres regisztrálás után vissza dob a bejelentkezés oldalra */}
          
          <button type="submit" className='button'>Regisztráció</button>
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
        <p>A Jelszó készítéskor ajánljuk, hogy tartalmazzon kicsi és nagy betűket illetve számot és speciális karaktereket.</p>
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
