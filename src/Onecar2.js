import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { jwtDecode } from 'jwt-decode'
import "./CardInner.css"; 
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
            fetch("http://localhost:5198/Comment/autocomment/"+param.id)
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
            <img src={datam.kep} className='car_img card' alt="..." /> 
          
            <Link className='nav-item nav-link' to={"/autok/"+datam.idEv}>
                <button className="back"><i class="bi bi-arrow-bar-left"></i>Vissza</button>
            </Link> 
          </div>
          <div className='col'>
            <p className='p'>Márka: {datam.marka}</p>
            <p className='p'>Gyártás kezdete: {datam.gyartasEv}</p>
            <p className='p'>Meghajtás: {datam.kerekmeghajtas}</p>
            <p className='p'>Teljesítmény: {datam.maxteljesitmeny} Ló erő</p>
            <p className='p'>Köbcenti:{datam.kobcenti}</p>
            <p className='p'>Tipus: {datam.tipus}</p>
            
          </div>
          <h5>Története:</h5>
          <p className='tortenet'>{datam.tortenet}</p>
          <div className="row g-3">
           
            <div className='col'>
            
                   <form onSubmit={function(event) {
                    event.preventDefault()
                    Post()  
                    }}>
                       <h2>{userToken.name}</h2>
                      <div class="input-group">
                          
                          <input type="text" id='comment' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" className='comment_input'/>
                      </div>
                      <button type="submit" className='submit'>Küldés</button>
                  </form>
                 
            </div>
            <div className='col'>
              <h3 className='kommentek'>Kommentek</h3>
                {
                   commentek.map((comments)=>{return(         
                    userToken.sub==comments.commenteloId||userToken.role=="admin"?        
                    <div className='comments'> 
                        {userToken.sub==comments.commenteloId?
                        <div>
                          <p id={comments.id} onDoubleClick={function(e){e.target.innerHTML=`<input value=${comments.postComment}>`}} class="text-break">{comments.postComment}</p>
                       
                        
                            <div>                  
                            <a onClick={function(){Put(comments.id)}} className='modositas'>Módosítás</a>
                            <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(comments.id)}}} className='torles'><i class="bi bi-trash"></i> Törlés</a>
                            </div>
                        </div>:
                        <div>
                          
                          <p class="text-break">{comments.postComment}</p>   
                            <div>      
                                <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(comments.id)}}} class="btn btn-danger">törlés</a>
                            </div>
                        </div>
                        }
                        
                        
                    
                    </div>:
                     <div style={{backgroundColor:"black",color:"white"}}>  
                     
                     <p class="text-break">{comments.postComment}</p>
                      
                    </div>
                  )})
                }
            </div>
          </div>
      </div>
    </div>
  )
}
