import React from 'react'

export default function 
() {
  return (
    <div className="row row-cols-1 row-cols-md-2 g-4">
    <div  className='col'>
      <form>
        <div className='center_texts'>
          <div class="email">
            <label for="exampleInputEmail1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
          </div>
          <div class="username">
            <label for="exampleInputEmail1" class="form-label">Felhasználónév</label>
            <input type="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
          </div>
          <div class="password">
            <label for="exampleInputPassword1" class="form-label">Jelszó</label>
            <input type="password" class="form-control" id="exampleInputPassword1"/>
          </div>
          <br/>
          <button type="submit" class="btn btn-info">Submit</button>
        </div>
      </form>
    </div>
    <div className='col'>

    </div>
    </div>
  )
}

