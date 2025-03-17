import React from 'react'

export default function AutoFelvitel() {
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
    .then(alert("Az utó sikeresen felökerült az adatbázisba!"))
  }
  return (
    <div>
      <h2>Új autó felvitele</h2>
       <form onSubmit={function(event) {
            event.preventDefault()
            Post();
        }}>
            <div>
                <label for="marka" class="form-label" className='label'>Márka</label>
                <br/>
                <input type="text" class="form-control" id="marka"/>
            </div>

            <div>
                <label for="evid" class="form-label" className='label'>Év azonosító:</label>
                <br/>
                <input type="text" class="form-control" id="evid" />
            </div>

            <div>
                <label for="Gyarev" class="form-label" className='label'>Gyártási év:</label>
                <br/>
                <input type="text" class="form-control" id="Gyarev" />
            </div>

            <div>
                <label for="tor" class="form-label" className='label'>Történet:</label>
                <br/>
                <input type="text" class="form-control" id="tor" />
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
            <br />
            <button className='btn btn-primary' type="submit">Új autó</button>
            <div/>
        </form>
    </div>
  )
}
