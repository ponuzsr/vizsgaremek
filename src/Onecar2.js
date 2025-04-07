import React from 'react'
import { useEffect,useState } from 'react';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { jwtDecode } from 'jwt-decode'
import "./CardInner.css"; 
import "./Commentek.css";
import axios from 'axios';
export default function Onecar2() {
  let userToken =jwtDecode(localStorage.getItem("token"));
    const param = useParams();
  const[datam,setdata]=useState([]);
  const[commentek,setcomments]=useState([])
  const [isDClicked, setIsDClicked] = useState(false)

  useEffect(() => {
    Get()
  }, [])
  //Új comment küldése
  function Post()
  {
    let comment=
    {     postComment:document.getElementById('comment').value,
          commenteloId:userToken.sub,
          autoId: param.id,
          createdTime: new Date().toJSON(),
    }
    console.log(comment)
    if(comment.postComment!="")
    {
      axios.post(`${process.env.REACT_APP_URL}/Comment`,comment)
      .then(function(){Get()})
    }
    else
    {
      alert("Nem írtál semmit!")
    }
    
  }
  //Comment mdóosítása
  async function Put(id)
  {
    let edit=
    {
      postComment: document.getElementById(id).firstElementChild.value
    }
    try{
    await axios.put(`${process.env.REACT_APP_URL}/Comment/`+id,edit)
    .then(function(response){Get()})
    }
    catch(error)
    {
      console.log(error)
    }
  }
    //Adott autó adatainak lekérése
  function Get()
    {
        axios.get(`${process.env.REACT_APP_URL}/Autok/`+param.id)
        .then(function(response){
        setdata(response.data);
        })
        .then(
          function()
          {
            axios.get(`${process.env.REACT_APP_URL}/Autok/autocommentTeszt/`+param.id)
            .then(function(response){setcomments(response.data)})
            
          }
        )
    }
    //Comment törlése
  function DeleteCom(id)
    {
        axios.delete(`${process.env.REACT_APP_URL}/Comment?id=${id}`)
        .then(function(response)
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
                       <h2><i className="bi bi-person-fill"></i>{userToken.name}</h2>
                      <div className="input-group">
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
                          <h3><i className="bi bi-person-fill"></i>{comments.userName}</h3>
                          <p  id={comments.id} onDoubleClick={function(e){e.target.innerHTML=`<input value=${comments.postComment}>`;setIsDClicked(true);}} className="text-break">{comments.postComment}</p>
                       
                        
                            <div>  
                              {/*Comment módosítása */}                
                            <button onClick={function(){Put(comments.id)}} className='modositas' disabled={!isDClicked}><i className="bi bi-pen"></i>Módosítás</button>
                            {/*Comment törlése */}
                            <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteCom(comments.id)}}} className='torles'><i className="bi bi-trash"></i> Törlés</a>
                            </div>
                        </div>:
                        <div className='comments'>
                          <h3>{comments.userName}</h3>
                          <p class="text-break">{comments.postComment}</p>   
                            <div>      
                              {/*Comment törlése */}
                                <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteCom(comments.id)}}} className="btn btn-danger"><i className="bi bi-trash3"></i>Törlés</a>
                            </div>
                        </div>
                        }
                        
                        
                    
                    </div>:
                     <div className='comments'>  
                     <h3>{comments.userName}</h3>
                     <p className="text-break">{comments.postComment}</p>
                      
                    </div>
                  )})
                }
            </div>
          </div>
      </div>
    </div>
  )
}
