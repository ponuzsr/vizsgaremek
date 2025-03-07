import React from 'react'

export default function Commentek(props) {
  return (
    <div style={{backgroundColor:"black",color:"white"}}>
        
        <p class="text-break">{props.datak.postComment}</p>
    </div>
  )
}
