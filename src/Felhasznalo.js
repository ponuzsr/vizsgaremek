import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link } from 'react-router-dom';
import { useEffect,useState } from "react";

export default function Felhasznalo() { 
  let myToken =jwtDecode(localStorage.getItem("token"));
  let usercheck="@"+myToken.name;
  console.log(usercheck);
  const[commentek,setcomments]=useState([])
  useEffect(() => {
      Getcom()
    }, [])
  function Getcom()
    {
      fetch("http://localhost:5198/Comment")
      .then(Response=>Response.json()).then(function(commentek){setcomments(commentek) })
    }
  return (
    <div> 
      <div className="row row-cols-1 row-cols-md-2 g-4">
        <div className='col'>
          <h2>{myToken.name}</h2>
              <p>{myToken.email}</p>
              <Link to={'/bejelentkezes'}>
                <button onClick={function(){localStorage.removeItem("token")}} class="upload-btn">Kijelentekzes</button>
              </Link>
        </div>
        <div className='col'>
          <h3>Értesítések</h3>
          <div class="ertesitesek-item" style={{}}>
                {
                   commentek.map((comments)=>{return(
                    comments.postComment.includes(usercheck)?
                   <div style={{backgroundColor:"black",color:"white"}}>      
                        <p class="text-break">{comments.postComment}</p>    
                        <Link to={"/Onecar2/"+comments.autoId}>
                            <button style={{backgroundColor:"#0806A8",color:"white"}} className="btn btn w-100">Az utóhoz</button>
                        </Link>    
                    </div>:
                    <div/>
                    
                   )})
                }
          </div>        
        </div>
              
      </div>
    </div>
  )
}
