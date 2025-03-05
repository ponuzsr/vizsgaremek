import React from 'react'
import { Link } from 'react-router-dom'
export default function GameStarter() {
  return (
    <div>
        <Link className='nav-item nav-link' to={"/Game"}>
        <a style={{backgroundColor:"black",color:"white"}} className="btn btn w-100">Játék indítása</a>
        </Link>   
    </div>
  )
}
