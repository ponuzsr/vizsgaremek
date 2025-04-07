import React from 'react'
import { Link } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'
import { jwtDecode } from "jwt-decode";
import "./Bejelentkezes.css";
import axios from 'axios';

export default function() {
    let navigate=useNavigate();

    //Bejelentkezési adatok elküldése
  async function Post(){
    
    let felhasznalo=
    {
      userName: document.getElementById("Email").value,
    
      password: document.getElementById("Password").value,
  
    }
  
    try{
      const response=await axios.post(`${process.env.REACT_APP_URL}/Felhasználók/Login`,felhasznalo)
      
      localStorage.setItem("token", response.data.token)
      let Tok =jwtDecode(localStorage.getItem("token"));
      if (Tok!="") 
      {
        navigate("/profil")
      }
   }
  catch(error)
  {
    console.log(error)
    alert("Rossz felahsználónév/jelszó!")
  }
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
          <div className='center_texts gap-2 mx-auto'>
            
            {/*Felhasználónév */}
            <div className="username">
              <label for="exampleInputEmail1" class="form-label" className='label_login'>Felhasználónév</label>
              <input type="username" class="form-control" id="Email" aria-describedby="emailHelp" required className='login_data' />
            </div>

            {/*Jelszó */}
            <div className="password">
              <label for="exampleInputPassword1" class="form-label" className='label_login'>Jelszó</label>
              <input type="password" class="form-control" id="Password" required className='login_data' />
            </div>
            <br />
            
            <button className='logbut' type="submit">Bejelentkezés</button>
    
            {/*Át navigál a Regisztrációs oldalra */}
            <Link className='logbut' type="submit" to={"/regisztracio"}>
              Regisztráció
            </Link>
          </div>
          </div>
        </form>
      </div>
      <div className='col'>
        <div className='koszones'>
          <h2>Hello! Köszönjük, hogy beregisztráltál oldalunkra. 
            Jelentkezz be és nézd meg új értesítéseidet. Kommentelj kocsijaink alá oszd meg velünk és másokkal véleményedet.</h2>
            <h2>Ha még nem lennél beregisztrálva akkor a "Regisztráció" gombra kattintva ezt is megteheted.</h2>
              <h2>További jó szórakozást!</h2>
            </div>
      </div>
    </div>
  )
}

