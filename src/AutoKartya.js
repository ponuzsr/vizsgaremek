import React from 'react'
import { Link } from 'react-router-dom'
import "./AutoKartya.css"
export default function AutoKartya(props) {
  let myToken =localStorage.getItem("token");
  
  return (
    <div className='col'>
        <div className="flip-card">
            <div className="flip-card-inner">
                <div className="flip-card-front">
                  <img src={props.datak.kep}/>
                </div>
                <div className="flip-card-back">
                  <h5 className="card-title">{props.datak.nev}</h5>
                  <p className="card-text">Márkája: {props.datak.marka}</p>
                   <p className="card-text">Gyártás kezdete: {props.datak.gyartasEv}</p>
              
                  {!myToken?  <Link className='link' to={"/Onecar/"+props.datak.id}>
                  <button className="info">Részletesebben</button>
                  </Link>: 
                  <Link className='link' to={"/Onecar2/"+props.datak.id}>
                  <button className="info">Részletesebben</button>
                  </Link>   
                  }
                </div>
            </div>
        </div>
    </div>
  )
}