import React from 'react'
import { Link } from 'react-router-dom'
import "./AutoKartya.css"
export default function AutoKartya(props) {
  let myToken =localStorage.getItem("token");
  
  return (
    <div className='col'>
      {/*<div class="card cardback" style={{border:"1px solid #0D3173"}}>
          <img src={props.datak.kep}  class="card-img-top" alt="..."/>
          <div className="card-body">
            <h5 className="card-title" style={{color:"white"}}>{props.datak.nev}</h5>
            <p className="card-text" style={{color:"white"}}>Márkája: {props.datak.marka}</p>
            <p className="card-text" style={{color:"white"}}>Gyártás kezdete: {props.datak.gyartasEv}</p>
            
                {!myToken?  <Link className='nav-item nav-link' to={"/Onecar/"+props.datak.id}>
                      <a style={{backgroundColor:"#0806A8",color:"white"}} className="btn btn w-100">Részletesebben</a>
                  </Link>: 
                  <Link className='nav-item nav-link' to={"/Onecar2/"+props.datak.id}>
                      <a style={{backgroundColor:"#0806A8",color:"white"}} className="btn btn w-100">Részletesebben</a>
                  </Link>   
                }
          </div>
              </div>*/}
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                  <img src={props.datak.kep}/>
                </div>
                <div class="flip-card-back">
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