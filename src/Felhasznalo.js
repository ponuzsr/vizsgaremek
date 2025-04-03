import React from 'react'
import { jwtDecode } from 'jwt-decode'
import { Link,useNavigate } from 'react-router-dom';
import { useEffect,useState } from "react";
import "./Felhasznalo.css";
import axios from 'axios';
import "./ProfilePictureUploader.css";
export default function Felhasznalo() { 
  let myToken =jwtDecode(localStorage.getItem("token"));
  const [image, setImage] = useState(null);
  let navigate=useNavigate();
  let usercheck="@"+myToken.name;
  console.log(usercheck);
  const[commentek,setcomments]=useState([])
  useEffect(() => {
      Getcom()
    }, [])
    
  function Getcom()
    {
      axios.get(`${process.env.REACT_APP_URL}/Comment`)
      .then(function(response){setcomments(response.data) })
    }

    function DeleteUser()
    {
      axios.delete(`${process.env.REACT_APP_URL}/Felhasználók?id=${myToken.sub}`)
      .then(function(response)
        {
          alert("Sikeres törlés!")
        }
      ).then(function(){localStorage.removeItem("token")}).then(function() {navigate("/bejelentkezes")})
    }
    const handleImageChange = (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onloadend = () => {
          setImage(reader.result);
        };
        reader.readAsDataURL(file);
      }}
  return (
    <div> 
      <div className="row row-cols-1 row-cols-md-2 g-4">
        <div className='col'>
          <div >
            <div className="profile-image-container">
              {image ? (
                <img src={image} alt="Profilkép" className="profile-image" />
              ) : (
                <div className="text-gray-400">Nincs kép</div>
              )}
            </div>
            <input type="file" accept="image/*" onChange={handleImageChange} id="fileInput" className="hidden-input" />
            <label htmlFor="fileInput" className="upload-button">
              Kép feltöltése
            </label>
          </div>
          <h2>{myToken.name}</h2>
              <p>{myToken.email}</p>
              <Link to={'/bejelentkezes'}>
                <button onClick={function(){localStorage.removeItem("token")}} class="users"><i class="bi bi-door-closed"></i> Kijelentekzés</button>
              </Link>
              <br/>
              <button className='admin_button' onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){DeleteUser()}}}><i class="bi bi-person-dash"></i> Fiók törlése</button>
        </div>
        <div className='col'>
          <h3 className='notifications'>Értesítések <i class="bi bi-bell"></i></h3>
          <div class="ertesitesek-item" style={{}}>
                {
                   commentek.map((comments)=>{return(
                    comments.postComment.includes(usercheck)?
                   <div className='users_notifications'>      
                         <h3>{comments.userName}</h3>
                        <p class="text-break">{comments.postComment}</p>    
                        <Link to={"/Onecar2/"+comments.autoId}>
                            <button className='usersNotifications_button'>Az autóhoz<i class="bi bi-caret-right-fill"></i></button>
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
