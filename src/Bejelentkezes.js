import React from 'react'
import { Link } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'
import { jwtDecode } from "jwt-decode";
import "./Bejelentkezes.css";
import axios from 'axios';

export default function() {
    let navigate=useNavigate();
  function Post(){
    
    let felhasznalo=
    {
      userName: document.getElementById("exampleInputEmail1").value,
    
      password: document.getElementById("exampleInputPassword1").value,
  
    }
    console.log(felhasznalo.userName);
    console.log(felhasznalo.password);
    axios.post("http://localhost:5198/Felhasználók/Login",felhasznalo) 
    .then(function(response) {
      console.log(response)
      localStorage.setItem("token", response.data.token)
      let myToken =jwtDecode(localStorage.getItem("token"));
      console.log(myToken);
      //const token = localStorage.getItem("token")
    }) .then(function() {
      navigate("/profil")
      
  })
  }
  return (
    <div className="row row-cols-1 row-cols-md-2 g-4">
      <div className='col'>
        <form onSubmit={function(event) {
            event.preventDefault()
            Post()
        }}>
          <div className='profil'>

          
           {/*Bejelentkezéshez adatok */}
          <div className='center_texts d-grid gap-2 col-5 mx-auto'>
            
            {/*Felhasználónév */}
            <div className="username">
              <label for="exampleInputEmail1" class="form-label" className='label'>Felhasználónév</label>
              <input type="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" className='login_data' />
            </div>

            {/*Jelszó */}
            <div className="password">
              <label for="exampleInputPassword1" class="form-label" className='label'>Jelszó</label>
              <input type="password" class="form-control" id="exampleInputPassword1" className='login_data' />
            </div>
            <br />
            
            <button className='button' type="submit">Bejelentkezés</button>
    
            {/*Át navigál a Regisztrációs oldalra */}
            <Link to={"/regisztracio"}>
              <button className='button'type="submit">Regisztráció</button>
            </Link>
          </div>
          </div>
        </form>
      </div>
      <div className='col'>
        <div className='koszones'>
          <h2>Hello! Köszönjük, hogy beregisztráltál oldalunkra. 
            Jelentkezz be és nézd meg új értesítéseidet. Kommentelj kocsiaink alá oszd meg velünk és másokkal vélemyényedet.</h2>
            <h2>Ha még nem lennél beregisztrálva akkor a "Regisztráció" gombra kattintva ezt is megteheted.</h2>
              <h2>További jó szórakozást!</h2>
            </div>
      </div>
    </div>
  )
}

