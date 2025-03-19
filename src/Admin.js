import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link } from 'react-router-dom';
import { useEffect,useState } from "react";
import AutoFelvitel from './AutoFelvitel';
import Rolechanger from './Rolechanger';
import Modosito from './Modosito';
import "./modal.css"
export default function Admin() {
  let myToken =jwtDecode(localStorage.getItem("token"));
  let usercheck="@"+myToken.name;
  console.log(usercheck);
  const[commentek,setcomments]=useState([])
  const[autobase,setautobase]=useState([]);
  const[modalOpened,setModalOpened]=useState(false)
  console.log(modalOpened);
  useEffect(() => {
      Getcom()
      Get()
    }, [])
    function Get(){
    fetch("http://localhost:5198/Autok"/*"http://10.169.84.233:5198/api/Autok/"*/)
    .then(Response=>Response.json())
    .then(function(data){
      
      
      setautobase(data)
    })
  }
  function Getcom()
    {
      fetch("http://localhost:5198/Comment")
      .then(Response=>Response.json()).then(function(commentek){setcomments(commentek) })
    }
    
    function delete_button(id)
    {
        fetch(`http://localhost:5198/Autok?Id=${id}`, {method:"DELETE"}).then(
            function(res)
            {
                alert("Sikeres törlés!");
                
                Get()
            }
        )
       
    }
   //teszt
   function mod1()
   {
    
    let modal = document.getElementById("myModal");
    modal.style.display = "block";
    setModalOpened(true)
    
  
   // var span = document.getElementsByClassName("close1")[0];
    
    
    // When the user clicks on <span> (x), close the modal
   /* span.onclick = function() {
      modal.style.display = "none";
    }*/
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
   }
  }
  function mod2()
  {
   
   let modal = document.getElementById("myModal2");
   modal.style.display = "block";
   setModalOpened(true)
   
 
   //var span = document.getElementsByClassName("close2")[0];
   
   
   // When the user clicks on <span> (x), close the modal
   /*span.onclick = function() {
     modal.style.display = "none";
   }*/
   
   // When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == modal) {
       modal.style.display = "none";
     }
  }
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
      <div className='row row-cols-1 row-cols-md-2 g-4'>
        <div className='col'>
        <button onClick={mod1} id="myBtn">Előléptetés</button>
            <div id="myModal" className="modal">
            <div className="modal-content">
             {/* <span className="close1">&times;</span>*/}
               <Rolechanger/>
            </div>
            </div>
         
        <br/>
            {/*<AutoFelvitel/>*/}
            <button onClick={mod2} id="myBtn">Új Autó</button>
            <div id="myModal2" className="modal">
            <div className="modal-content">
              {/*<span className="close2">&times;</span>*/}
               <AutoFelvitel get={Get}/>
            </div>
            </div>   
        </div>
      </div>
      <div className="row row-cols-1 row-cols-md-5 g-4">
        {
          autobase.map((autok)=>{return(
            <div style={{backgroundColor:"black"}} className='col'>
                <p style={{color:"white"}}>{autok.marka}</p>
                <button onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(autok.id)}}} className='btn btn-danger'>Törlés</button>
                <Link to={"/modsitas/"+autok.id}>
                    <a className='btn btn-warning'>Módosítás</a>
                </Link>
                
            </div>
          )})
        }
      </div>
    </div>
  )
}

