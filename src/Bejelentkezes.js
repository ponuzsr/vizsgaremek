import React from 'react'
import { Link } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'
import { jwtDecode } from "jwt-decode";
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
    fetch("http://localhost:5198/Felhasználók/Login",{method:"POST",body:JSON.stringify(felhasznalo),headers:{"content-type":"application/json"}}) 
    .then(function(response) {
      return response.json()
    })
    .then(function(response) {
      console.log(response)
      localStorage.setItem("token", response.token)
      let myToken =jwtDecode(localStorage.getItem("token"));
      console.log(myToken.sub);
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
          <div id='profil'>

          
           {/*Bejelentkezéshez adatok */}
          <div className='center_texts d-grid gap-2 col-5 mx-auto'>
            
            {/*Felhasználónév */}
            <div class="username">
              <label for="exampleInputEmail1" class="form-label">Felhasználónév</label>
              <input type="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" />
            </div>

            {/*Jelszó */}
            <div class="password">
              <label for="exampleInputPassword1" class="form-label">Jelszó</label>
              <input type="password" class="form-control" id="exampleInputPassword1" />
            </div>
            <br />

            <button type="submit" class="btn btn-info">Bejelentkezés</button>

            {/*Át navigál a Regisztrációs oldalra */}
            <Link to={"/regisztracio"}>
              <button type="submit" class="btn btn-info">Regisztráció</button>
            </Link>
          </div>
          </div>
        </form>
      </div>
      <div className='col'>

      </div>
    </div>
  )
}

