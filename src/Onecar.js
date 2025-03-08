import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Commentek from './Commentek';
export default function Onecar() {  
    const param = useParams();
  const[datam,setdata]=useState([]);
  const[commentek,setcomments]=useState([])
  useEffect(() => {
    Get()
  }, [])
  //29cc4580-b1a6-4c4c-a665-6f7daba47c75
  
  function Get()
    {
        fetch("http://localhost:5198/Autok/"/*"http://10.169.84.233:5198/api/Autok/"*/+param.id)
        .then(Response=>Response.json())
        .then(function(data){
        console.log(data)
        setdata(data);
        })
        .then(
          function()
          {
            fetch("http://localhost:5198/Comment/autocomment/"+param.id)
            .then(Response=>Response.json()).then(function(commentek){setcomments(commentek)})
            
          }
        )
    }
  return (
    <div>
      <div className="row g-3">
          <div  className="col">
            <img style={{border:"5px solid black"}} src={datam.kep} class="card-img-top" alt="..."/>  
          </div>
          <div className='col'>
            <h5 style={{color:"white",fontSize:"200%"}}>Név: {datam.nev}</h5>
            <p style={{color:"white",fontSize:"200%"}}>marka: {datam.marka}</p>
            <p style={{color:"white",fontSize:"200%"}}>Gyártás kezdete: {datam.gyartasEv}</p>
            <p style={{color:"white",fontSize:"200%"}}>Meghajtás: {datam.kerekmeghajtas}</p>
            <p style={{color:"white",fontSize:"200%"}}>Teljesítmény: {datam.maxteljesitmeny} ló erő</p>
            <Link className='nav-item nav-link' to={"/autok/"+datam.idEv}>
                <a style={{backgroundColor:"black",color:"white"}} className="btn btn">Vissza</a>
            </Link>
          </div>
          <h5 style={{color:"white"}}>{datam.tortenet}</h5>
          <div className="row g-3">
            <div className='col'>
                {
                   commentek.map((comments)=>{return(
                    <div style={{backgroundColor:"black",color:"white"}}>      
                        <p class="text-break">{comments.postComment}</p>
                        
                    </div>
                   )})
                }
            </div>
            <div className='col'>
             
                  <form>
                        <div class="input-group">
                            <span class="input-group-text">Comment</span>
                            <textarea class="form-control" aria-label="With textarea"></textarea>
                        </div>
                        <button type="submit" disabled class="btn btn-primary">Küldés</button>
                    </form>
             
            </div>
          </div>
      </div>
    </div>
  )
}
