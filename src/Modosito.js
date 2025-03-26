import axios from 'axios';
import React from 'react'
import { useEffect,useState } from 'react';
import "./Modositas.css";
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

   async function Put(id)
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
        try{
        await axios.put("http://localhost:5198/Autok/"+id,modositott_adatok)
        .then(function(response){Get()})
        }
        catch(error)
        {
          console.log(error)
        }
    }

  return (
    <div className='row row-cols-1 row-cols-md-2 g-4' id='modositas'>
      <div className='col'>
        
        <label className='data_label'>Márka:</label>
        <p className='data_p'>{datam.marka}</p>

        <label className='data_label'>Gyártási év:</label>
        <p className='data_p'>{datam.gyartasEv}</p>

        <label className='data_label'>Gyártás id:</label>
        <p className='data_p'>{datam.idEv}</p>

        <label className='data_label'> Meghajtás:</label>
        <p className='data_p'>{datam.kerekmeghajtas}</p>

        <label className='data_label'>Teljesítmény:</label>
        <p className='data_p'>{datam.maxteljesitmeny}</p>

        <label className='data_label'>Köbcenti:</label>
        <p className='data_p'>{datam.kobcenti}</p>

        <label className='data_label'>Tipus:</label>
        <p className='data_p'>{datam.tipus}</p>

        <label className='data_label'>Kép:</label>
        <p className='data_p'>{datam.kep}</p>

        <label className='data_label'>Történet:</label>
        <p className='data_p'>{datam.tortenet}</p> 

        <Link className='nav-item nav-link' to={"/profil/"}>
          <button className="vissza"><i class="bi bi-arrow-bar-left"></i>Vissza</button>
        </Link>
      </div>
      
      <div className='col'>
      <h2 className='auto_modositas'>Autó Módosítása</h2>
       <form onSubmit={function(event) {
            event.preventDefault()
            Put(datam.id);
        }}>
            <div>
                <label for="marka" class="form-label" className='mod_label'>Márka</label>
                <br/>
                <input type="text" class="form-control" id="mar" className='mod_input'/>
            </div>

            <div>
                <label for="evid" class="form-label" className='mod_label'>Év azonosító:</label>
                <br/>
                <input type="text" class="form-control" id="gyard" className='mod_input'/>
            </div>

            <div>
                <label for="Gyarev" class="form-label" className='mod_label'>Gyártási év:</label>
                <br/>
                <input type="text" class="form-control" id="gyar" className='mod_input'/>
            </div>

            <div>
                <label for="kep" class="form-label" className='mod_label'>Kép:</label>
                <br/>
                <input type="text" class="form-control" id="kep" className='mod_input'/>
            </div>

            <div>
                <label for="kob" class="form-label" className='mod_label'>Köbcenti:</label>
                <br/>
                <input type="text" class="form-control" id="kob" className='mod_input'/>
            </div>

            <div>
                <label for="tip" class="form-label" className='mod_label'>Tipus:</label>
                <br/>
                <input type="text" class="form-control" id="tip" className='mod_input'/>
            </div>

            <div>
                <label for="max" class="form-label" className='mod_label'>Max teljesítmény:</label>
                <br/>
                <input type="text" class="form-control" id="max" className='mod_input'/>
            </div>
            
            <div>
                <label for="ker" class="form-label" className='mod_label'>Kerékmeghajtás:</label>
                <br/>
                <input type="text" class="form-control" id="ker" className='mod_input'/>
            </div>
            <div>
                <label for="tor" class="form-label" className='mod_label'>Történet:</label>
                <br/>
                <textarea id='tor' className='mod_input'></textarea>
            </div> 
            <a onClick={function(){Put(datam.id)}} className='modositas'>Módosítás</a>
        </form>
      </div>
    </div>
   
  )
}
