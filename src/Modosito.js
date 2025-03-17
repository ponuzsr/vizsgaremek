import React from 'react'
import { useEffect,useState } from 'react';
import { Link, useParams } from 'react-router-dom';
export default function Modosito(props) {
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
    <div>
        <p>Márka:{datam.marka}</p>
        <p>Gyrátási év{datam.gyartasEv}</p>
        <p>Meghajtás:{datam.kerekmeghajtas}</p>
        <p>Teljesítmény:{datam.maxteljesitmeny}</p>
        <p>Köbcenti:{datam.kobcenti}</p>
        <p>Tipus:{datam.tipus}</p>
        <label for="kep" class="form-label" className='label'>kép:</label>
                <br/>
        <input type="text" class="form-control" id="kep" />
        <div class="form-group">
        <label for="tor">Történet</label>
          <textarea class="form-control" id="tor" rows="6"></textarea>
        </div>
       
    </div>
    
  )
}
