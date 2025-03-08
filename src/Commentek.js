import React from 'react'

export default function Commentek(props) {
  function delete_button(id)
  {
      fetch("ttp://localhost:5198/Comment/"+id, {method:"DELETE"}).then(
          function(res)
          {
              alert("Sikeres törlés!");
              props.get()
          }
      )
  }
  return (
    <div style={{backgroundColor:"black",color:"white"}}>      
        <p class="text-break">{props.datak.postComment}</p>
        <a onClick={function() {if(window.confirm("Biztosan törölni szeretnél?")){delete_button(props.datak.id)}}} class="btn btn-danger">törlés</a>
    </div>
  )
}
