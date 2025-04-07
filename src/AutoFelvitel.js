import React from 'react'
import "./Autofelvitel.css";
import axios from 'axios';
export default function AutoFelvitel(props) {
    //Új autó adatainak elküldése
  async function Post()
  {
    let auto=
    {
      idEv: document.getElementById("evid").value,
      marka: document.getElementById("marka").value,
      gyartasEv: document.getElementById("Gyarev").value,
      tortenet: document.getElementById("tor").value,
      kep: document.getElementById("kep").value,
      kobcenti: document.getElementById("kob").value,
      tipus: document.getElementById("tip").value,
      maxteljesitmeny: document.getElementById("max").value,
      kerekmeghajtas: document.getElementById("ker").value,
    }
    try{
    await axios.post(`${process.env.REACT_APP_URL}/Autok`,auto)
    alert("Az autó sikeresen felökerült az adatbázisba!");
    props.get()
    }
    catch(error)
    {
        console.log(error)
    }
  }
  return (
    <div className='newcar'>
      <h2 className='new'>Új autó felvitele</h2>
       <form onSubmit={function(event) {
            event.preventDefault()
            Post();
        }}>
            
                <label for="marka" class="form-label" className='label'>Márka:</label>
                <br/>
                <input type="text" class="form-control" id="marka" required className='bevitel'/>
            

            <div>
                <label for="evid" class="form-label" className='label'>Év azonosító:</label>
                <br/>
                <input type="text" class="form-control" id="evid" required className='bevitel' />
            </div>

            <div>
                <label for="Gyarev" class="form-label" className='label'>Gyártási év:</label>
                <br/>
                <input type="text" class="form-control" id="Gyarev" required className='bevitel' />
            </div>

            <div>
                <label for="kep" class="form-label" className='label'>Kép:</label>
                <br/>
                <input type="text" class="form-control" id="kep" required className='bevitel' />
            </div>

            <div>
                <label for="kob" class="form-label" className='label'>Köbcenti:</label>
                <br/>
                <input type="text" class="form-control" id="kob" required className='bevitel' />
            </div>

            <div>
                <label for="tip" class="form-label" className='label'>Tipus:</label>
                <br/>
                <input type="text" class="form-control" id="tip" required className='bevitel'/>
            </div>

            <div>
                <label for="max" class="form-label" className='label'>Max teljesítmény:</label>
                <br/>
                <input type="text" class="form-control" id="max" required className='bevitel' />
            </div>
            
            <div>
                <label for="ker" class="form-label" className='label'>Kerékmeghajtás:</label>
                <br/>
                <input type="text" class="form-control" id="ker" required className='bevitel' />
            </div>

            <div>
                <label for="tor" class="form-label" className='label'>Történet:</label>
                <br/>
                <textarea id='tor' required className='bevitel'></textarea>
            </div>
            <br />
            <button className='newcar_button' type="submit">Új autó +</button>
            <div/>
           
        </form>
    </div>
   
  )
}
