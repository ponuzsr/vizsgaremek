import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Commentek from './Commentek';
import { jwtDecode } from 'jwt-decode'
import "./Commentek.css";
export default function Onecar2() {
  let userToken =jwtDecode(localStorage.getItem("token"));
    const param = useParams();
  const[datam,setdata]=useState([]);
  const[commentek,setcomments]=useState([])
  useEffect(() => {
    Get()
  }, [])
  //29cc4580-b1a6-4c4c-a665-6f7daba47c75
  function Post()
  {
    let comment=
    {     postComment:document.getElementById('comment').value,
          commenteloId:userToken.sub,
          autoId: param.id,
          createdTime: new Date().toJSON(),
          //comment
    }
    console.log(comment)
    fetch("http://localhost:5198/Comment",{method:"POST",body:JSON.stringify(comment),headers:{"content-type":"application/json"}}).then(function(){Get()})
  }
  function Put(id)
  {
    let edit=
    {
      postComment: document.getElementById(id).firstElementChild.value
    }
    console.log(edit)
    fetch("http://localhost:5198/Comment/"+id,{method:"PUT",body:JSON.stringify(edit),headers:{"content-type":"application/json"}}).then(function(res){Get()})
  }
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
            fetch("http://localhost:5198/Comment")
            .then(Response=>Response.json()).then(function(commentek){setcomments(commentek)})
            
          }
        )
    }
  function delete_button(id)
    {
        fetch(`http://localhost:5198/Comment?id=${id}`, {method:"DELETE"}).then(
            function(res)
            {
                alert("Sikeres törlés!");
                
                Get()
            }
        )
       
    }
  return (
    <div>
      <div className="row g-3">
          <div  className="col">
            <img style={{border:"5px solid black"}} src={datam.kep} class="card-img-top" alt="..."/>  
          </div>
          <div className='col'>
            <h5 style={{color:"white",fontSize:"200%"}}>Név: {datam.nev}</h5>
            <p style={{color:"white",fontSize:"200%"}}>marka: {datam.marka}</p>
            <p style={{color:"white",fontSize:"200%"}}>Gyártás kezdete: {datam.gyartasEv}</p>
            <p style={{color:"white",fontSize:"200%"}}>Meghajtás: {datam.kerekmeghajtas}</p>
            <p style={{color:"white",fontSize:"200%"}}>Teljesítmény: {datam.maxteljesitmeny} ló erő</p>
            <Link className='nav-item nav-link' to={"/autok/"+datam.idEv}>
                <a style={{backgroundColor:"black",color:"white"}} className="btn btn">Vissza</a>
            </Link>
          </div>
          <h5 style={{color:"white"}}>{datam.tortenet}</h5>
          <div className="row g-3">
            <div className='col'>
                {
                   commentek.map((comments)=>{return(         
                    userToken.sub==comments.commenteloId||userToken.role=="admin"?        
                    <div style={{backgroundColor:"black",color:"white"}}> 
                        
                         
                          <p id={comments.id} onDoubleClick={function(e){e.target.innerHTML=`<input value=${comments.postComment}>`}} class="text-break">{comments.postComment}</p>
                         
                       
                        {userToken.sub==comments.commenteloId&&userToken.role=="user"?
                        <div>                  
                        <a onClick={function(){Put(comments.id)}} class="btn btn-warning">módosítás</a>
                        <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(comments.id)}}} class="btn btn-danger">törlés</a>
                        </div>:
                        <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(comments.id)}}} class="btn btn-danger">törlés</a>
                        }
                    </div>:
                     <div style={{backgroundColor:"black",color:"white"}}>  
                     
                     <p class="text-break">{comments.postComment}</p>
                      
                    </div>
                  )})
                }
            </div>
            <div className='col'>
            
                   <form onSubmit={function(event) {
                    event.preventDefault()
                    Post()  
                    }}>
                       <h2>{userToken.name}</h2>
                      <div class="input-group">
                         
                          <span class="input-group-text">Comment</span>
                          
                          <input type="text" id='comment' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"/>
                      </div>
                      <button type="submit" class="btn btn-primary">Küldés</button>
                  </form>
                 
            </div>
          </div>
      </div>
    </div>
  )
}
