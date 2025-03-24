import axios from 'axios';
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
        axios.get("http://localhost:5198/Autok/"/*"http://10.169.84.233:5198/api/Autok/"*/+param.id)
        .then(function(response){
        console.log(response)
        setdata(response.data);
        })
    }

    function Put(id)
    {
        let modositott_adatok=
        {
          idEv: document.getElementById("gyard").value,
          marka: document.getElementById("mar").value,
          gyartasEv: document.getElementById("gyar").value,
          tortenet: document.getElementById("tor").value,
          kep: document.getElementById("kep").value,
          kobcenti: document.getElementById("kob").value,
          tipus: document.getElementById("tip").value,
          maxteljesitmeny: document.getElementById("max").value,
          kerekmeghajtas: document.getElementById("ker").value,
        }
        console.log(modositott_adatok)
        axios.put("http://localhost:5198/Autok/"+id,modositott_adatok)
        .then(function(response){Get()})
    }
  return (
    <div className='row row-cols-1 row-cols-md-2 g-4'>
      <div className='col'>
        <label>Márka:</label>
        <p>{datam.marka}</p>
        <label>Gyártási év:</label>
        <p>{datam.gyartasEv}</p>
        <label>Gyártás id:</label>
        <p>{datam.idEv}</p>
        <label>Meghajtás:</label>
        <p>{datam.kerekmeghajtas}</p>
        <label>Teljesítmény:</label>
        <p>{datam.maxteljesitmeny}</p>
        <label>Köbcenti:</label>
        <p>{datam.kobcenti}</p>
        <label>Tipus:</label>
        <p>{datam.tipus}</p>
        <label>kép:</label>
        <p>{datam.kep}</p>
        <label>Történet:</label>
        <p>{datam.tortenet}</p>
      </div>
      <div className='col'>
      <h2>Új autó felvitele</h2>
       <form onSubmit={function(event) {
            event.preventDefault()
            Put(datam.id);
        }}>
            <div>
                <label for="marka" class="form-label" className='label'>Márka</label>
                <br/>
                <input type="text" class="form-control" id="mar"/>
            </div>

            <div>
                <label for="evid" class="form-label" className='label'>Év azonosító:</label>
                <br/>
                <input type="text" class="form-control" id="gyard" />
            </div>

            <div>
                <label for="Gyarev" class="form-label" className='label'>Gyártási év:</label>
                <br/>
                <input type="text" class="form-control" id="gyar" />
            </div>

            <div>
                <label for="kep" class="form-label" className='label'>kép:</label>
                <br/>
                <input type="text" class="form-control" id="kep" />
            </div>

            <div>
                <label for="kob" class="form-label" className='label'>Köbcenti:</label>
                <br/>
                <input type="text" class="form-control" id="kob" />
            </div>

            <div>
                <label for="tip" class="form-label" className='label'>Tipus:</label>
                <br/>
                <input type="text" class="form-control" id="tip" />
            </div>

            <div>
                <label for="max" class="form-label" className='label'>Max teljesítmény:</label>
                <br/>
                <input type="text" class="form-control" id="max" />
            </div>
            
            <div>
                <label for="ker" class="form-label" className='label'>Kerékmeghajtás:</label>
                <br/>
                <input type="text" class="form-control" id="ker" />
            </div>
            <div>
                <label for="tor" class="form-label" className='label'>Történet:</label>
                <br/>
                <textarea id='tor'></textarea>
            </div> 
            <a onClick={function(){Put(datam.id)}} className='modositas'>Módosítás</a>
        </form>
      </div>
    </div>
    
  )
}
