import React from 'react'
import { Link } from 'react-router-dom'
export default function () {
  return (
    <div className="row row-cols-1 row-cols-md-2 g-4">
    <div  className='col'>
      <form>

         {/*Regisztrációhoz adatok */}
        <div className='center_texts d-grid gap-2 col-5 mx-auto'>
          <div class="email">
            <label for="exampleInputEmail1" class="form-label">Email cím</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
          </div>
          <div class="phonenumber">
            <label for="exampleInputEmail1" class="form-label">Telefonszám</label>
            <input type="phonenumber" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
          </div>
          <div class="username">
            <label for="exampleInputEmail1" class="form-label">Felhasználónév</label>
            <input type="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
          </div>
          <div class="password">
            <label for="exampleInputPassword1" class="form-label">Jelszó</label>
            <input type="password" class="form-control" id="exampleInputPassword1"/>
          </div>
          <br/>

           {/*Vissza navigál a Bejelentkezés oldalra */}
          <Link to={"/bejelentkezes"}>
          <button type="submit" class="btn btn-info">Regisztráció</button>
          </Link>
          
        </div>
      </form>
    </div>
     {/*Regisztrációs feltételek leírása */}
    <div className='col'>
        <h1>Regisztrációs feltételek!</h1>
        <p>Email cím tartalmazzon @ .hu vagy .com-ot</p>
        <p>Telefonszám legyen meg 11 karakter</p>
        <p>Felhasználónév minimum 10 karakter legyen</p>
        <p>Jelszó tartalmazzon kicsi és nagy betűket illetve számot is minimum 12 karakter legyen.</p>
        <p>Regisztrálás után kérem jelentkezzen is be.</p>
        <p>Adatait kérem jegyezze meg és ne továbbítsa senkinek se.</p>
        <h1>Regisztrálását és megértését köszönjük!</h1>
    </div>
    </div>
  )
}
