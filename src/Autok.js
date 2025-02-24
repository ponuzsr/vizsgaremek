import React from "react";
import { useParams } from "react-router-dom";
import AutoKartya from "./AutoKartya";
import { useEffect,useState } from "react";
function Autok () {
  const params = useParams();
  const[database,setdatabase]=useState([]);
  useEffect(() => {
    Get()
  }, [params.ev])
  function Get()
  {
    fetch("http://localhost:5198/api/Autok"/*"http://10.169.84.233:5198/api/Autok/"*/)
    .then(Response=>Response.json())
    .then(function(data){
      let filtered = data.filter(auto=> auto.idEv==params.ev )
      console.log(filtered);
      setdatabase(filtered)
    })
      
  }
  // Placeholder adatok
  /*const carInfo = {
    "50": "Az 50-es évek klasszikus amerikai és európai autói lenyűgözőek voltak.",
    "60": "A 60-as évek ikonikus izomautói és sportautói még ma is legendásak.",
    "70": "Az olajválság előtti utolsó igazi benzinfaló gépek korszaka.",
    "80": "A turbókorszak kezdete, digitális műszerfalak és futurisztikus design.",
  };*/

  return (
      <div className="row row-cols-1 row-cols-md-5 g-4">
          {
            
            database.map((auto)=>{return(<AutoKartya datak={auto}/>)})
          }
      </div>
  );
};

export default Autok;
