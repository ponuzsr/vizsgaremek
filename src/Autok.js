import React from "react";
import { useParams } from "react-router-dom";

function Autok () {
  const { ev } = useParams();

  // Placeholder adatok
  const carInfo = {
    "50": "Az 50-es évek klasszikus amerikai és európai autói lenyűgözőek voltak.",
    "60": "A 60-as évek ikonikus izomautói és sportautói még ma is legendásak.",
    "70": "Az olajválság előtti utolsó igazi benzinfaló gépek korszaka.",
    "80": "A turbókorszak kezdete, digitális műszerfalak és futurisztikus design.",
  };

  return (
    <div className="cars-container">
      <h2>{ev}-es évek autói</h2>
      <p>{carInfo[ev] || "Nincs információ erről az évtizedről."}</p>
    </div>
  );
};

export default Autok;
