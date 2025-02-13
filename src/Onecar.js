import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
export default function Onecar() {
    const param = useParams();
  const[datam,setdata]=useState([]);
  useEffect(() => {
    Get()
  }, [])
  function Get()
    {
        fetch("http://10.169.84.39:5198/api/Autok/"+param.id)
        .then(Response=>Response.json())
        .then(function(data){
        console.log(data)
        setdata(data);
        })
    }
  return (
    <div>
        <div class="card" style={{width:"18rem;"}}>
          <img src={datam.kep} class="card-img-top" alt="..."/>
          <div class="card-body" style={{backgroundColor:"black"}}>
            <h5 class="card-title" style={{color:"white"}}>{datam.marka}</h5>
            <p class="card-text">{datam.GyartasEv}</p>
            </div>
        </div>
    </div>
  )
}
