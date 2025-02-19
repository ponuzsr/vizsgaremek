import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
export default function Onecar() {
    const param = useParams();
  const[datam,setdata]=useState([]);
  useEffect(() => {
    Get()
  }, [])
  function Get()
    {
        fetch("http://localhost:5198/api/Autok/"/*"http://10.169.84.233:5198/api/Autok/"*/+param.id)
        .then(Response=>Response.json())
        .then(function(data){
        console.log(data)
        setdata(data);
        })
    }
  return (
    <div>
      <div className="row g-3">
          <div  className="col">
            <img style={{border:"5px solid black"}} src={datam.kep} class="card-img-top" alt="..."/>  
          </div>
          <div className='col'>
            <h5 style={{color:"white",fontSize:"200%"}}>Név:{datam.marka}</h5>
            <p style={{color:"white",fontSize:"200%"}}>Gyártás kezdete:{datam.gyartasEv}</p>
            <Link className='nav-item nav-link' to={"/autok/"+datam.idEv}>
                <a style={{backgroundColor:"black",color:"white"}} className="btn btn">Vissza</a>
            </Link>
          </div>
          <h5 style={{color:"white"}}>{datam.tortenet}</h5>
      </div>
    </div>
  )
}
