import React from 'react'
import { useEffect,useState } from 'react';
import { Link, useParams } from 'react-router-dom';
export default function Modosito() {
    const param = useParams();
    const[datam,setdata]=useState([]);
     useEffect(() => {
        Get()
      }, [])
    function Get()
    {
        fetch("http://localhost:5198/Autok/"/*"http://10.169.84.233:5198/api/Autok/"*/+param.id)
        .then(Response=>Response.json())
        .then(function(data){
        console.log(data)
        setdata(data);
        })
    }
  return (
    <div>{datam.marka}
        <Link to={"/profil"}>
        <a className='btn btn-primary'>Mégse</a>
        </Link>
    </div>
    
  )
}
