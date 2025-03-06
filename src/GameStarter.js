import React from 'react'
import { Link } from 'react-router-dom'
export default function GameStarter() {
  return (
    <div>
      {/*Játék leírása */}
      <div className='description'>
      <h1>Üdvözölünk a ClassicGarage weboldal "Ricsi kicsi kocsija" játékába!</h1>
      <h2>Játék leírás:</h2>
      {/*Kicsike kép */}
      <div className='minipic'>
            <img src='pics/minicar.png'/>
        </div>
      <p>Ha Ricsi kicsi kocsijára kattintasz akkor Ricsi megjutalmazz egy ponttal.</p>
      <p>Minden 10. pont után egyre gyorsabban fognak menni az autók.</p>
      <p>Amelyik kocsit nem sikerül elkapnod az minusz egy élet.</p>
      <p>3 életed van, ha az életed elfogyik a játéknak vége.</p>
        <h1>Jó játékot kivánunk!</h1> 
        </div>

        <br/>
        {/*Játék elindítása gomb */}
        <div className='gameStart'>
        <Link className='nav-item nav-link' to={"/Game"}>
        <a type="button"><i class="bi bi-car-front-fill"></i> Játék Indítása</a>
        </Link> 

        </div> 
      
      
    </div>
  )
}
