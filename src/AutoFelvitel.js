import React from 'react'
import "./Autofelvitel.css";
export default function AutoFelvitel(props) {
  function Post()
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
    //http://localhost:5198/Autok
    fetch("http://localhost:5198/Autok",{method:"POST",body:JSON.stringify(auto),headers:{"content-type":"application/json"}})
    .then(alert("Az utó sikeresen felökerült az adatbázisba!")).then(function(res){props.get()})
  }
  return (
    <div className='newcar'>
      <h2 className='new'>Új autó felvitele</h2>
       <form onSubmit={function(event) {
            event.preventDefault()
            Post();
        }}>
            
                <label for="marka" class="form-label" className='label'>Márka</label>
                <br/>
                <input type="text" class="form-control" id="marka" className='bevitel'/>
            

            <div>
                <label for="evid" class="form-label" className='label'>Év azonosító:</label>
                <br/>
                <input type="text" class="form-control" id="evid" className='bevitel' />
            </div>

            <div>
                <label for="Gyarev" class="form-label" className='label'>Gyártási év:</label>
                <br/>
                <input type="text" class="form-control" id="Gyarev" className='bevitel' />
            </div>

            <div>
                <label for="kep" class="form-label" className='label'>Kép:</label>
                <br/>
                <input type="text" class="form-control" id="kep" className='bevitel' />
            </div>

            <div>
                <label for="kob" class="form-label" className='label'>Köbcenti:</label>
                <br/>
                <input type="text" class="form-control" id="kob" className='bevitel' />
            </div>

            <div>
                <label for="tip" class="form-label" className='label'>Tipus:</label>
                <br/>
                <input type="text" class="form-control" id="tip" className='bevitel'/>
            </div>

            <div>
                <label for="max" class="form-label" className='label'>Max teljesítmény:</label>
                <br/>
                <input type="text" class="form-control" id="max" className='bevitel' />
            </div>
            
            <div>
                <label for="ker" class="form-label" className='label'>Kerékmeghajtás:</label>
                <br/>
                <input type="text" class="form-control" id="ker" className='bevitel' />
            </div>

            <div>
                <label for="tor" class="form-label" className='label'>Történet:</label>
                <br/>
                <textarea id='tor' className='bevitel'></textarea>
            </div>
            <br />
            <button className='newcar_button' type="submit">Új autó</button>
            <div/>
           
        </form>
    </div>
   
  )
}
