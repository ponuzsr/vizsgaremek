import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import "./Commentek.css";
import "./CardInner.css"; 
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
            fetch("http://localhost:5198/Autok/comment/autocomment/"+param.id)
            .then(Response=>Response.json()).then(function(commentek){setcomments(commentek)})
            
          }
        )
    }
  return (
    <div>
      <div className="row g-3">
          <div  className="col">
          <img src={datam.kep} className='car_img card' alt="..." /> 
          <Link className='nav-item nav-link' to={"/autok/"+datam.idEv}>
            <button className="back"><i class="bi bi-arrow-bar-left"></i>Vissza</button>
            </Link>
          </div>
          <div className='col'>
            <p className='p'>Márka: {datam.marka}</p>
            <p className='p'>Gyártás kezdete: {datam.gyartasEv}</p>
            <p className='p'>Meghajtás: {datam.kerekmeghajtas}</p>
            <p className='p'>Teljesítmény: {datam.maxteljesitmeny} Ló erő</p>
            <p className='p'>Köbcenti:{datam.kobcenti}</p>
            <p className='p'>Tipus: {datam.tipus}</p>
            
          </div>
          <h5>Története:</h5>
          <p className='tortenet'>{datam.tortenet}</p>
          <div className="row g-3">
           
            <div className='col'>
             
                  <form>
                        <div class="input-group">
                       
                        <input type="text" id='comment' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" className='comment_input'/>
                        
          
                        </div>
                        <button type="submit" className='submit'>Küldés</button>
                    </form>
             
            </div>
            <div className='col'>
            <h3 className='kommentek'>Kommentek</h3>
                {
                   commentek.map((comments)=>{return(
                    <div className='comments'>  
                        <h3>{comments.userName}</h3>    
                        <p class="text-break">{comments.postComment}</p>
                        
                    </div>
                   )})
                }
            </div>
          </div>
      </div>
    </div>
  )
}
