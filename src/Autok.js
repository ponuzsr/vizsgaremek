import React from "react";
import { useParams } from "react-router-dom";
import AutoKartya from "./AutoKartya";
import { useEffect,useState } from "react";
import axios from "axios";

function Autok () {
  const params = useParams();
  const[database,setdatabase]=useState([]);
  useEffect(() => {
    Get()
  }, [params.ev])
  function Get()
  {
    axios.get(`${process.env.REACT_APP_URL}/Autok`)
    .then(function(response){
      let filtered = response.data.filter(auto=> auto.idEv==params.ev )
      setdatabase(filtered)
    })
      
  }

  return (
      <div className="row row-cols-1 row-cols-md-5 g-4">
          {
            
            database.map((auto)=>{return(<AutoKartya key={auto.id} datak={auto}/>)})
          }
      </div>
  );
};

export default Autok;
