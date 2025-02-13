import React from 'react'
import { Link } from 'react-router-dom'
export default function AutoKartya(props) {
  return (
    <div>
        <div class="card" style={{width:"18rem;"}}>
          <img src={props.datak.kep} class="card-img-top" alt="..."/>
          <div class="card-body" style={{backgroundColor:"black"}}>
            <h5 class="card-title" style={{color:"white"}}>{props.datak.marka}</h5>
            <p class="card-text">{props.datak.id}</p>
            
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
              <Link className='nav-item nav-link' to={"/Onecar/"+props.datak.id}>
                  <a style={{backgroundColor:"#0806A8",color:"white"}} class="btn btn">Részletesebben</a>
              </Link>
              
              <a href="#" style={{backgroundColor:"#0806A8",color:"white"}} class="btn btn">Commentek</a>
            </div>
          </div>
        </div>
        <br/>
    </div>
  )
}
