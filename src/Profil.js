import React from 'react'

export default function Profil() {
  const token = localStorage.getItem("token")
  return (
    <div>
       <h2>{token.userName}</h2>
            <p>email@pelda.hu</p>
            <button class="upload-btn">Profilkép feltöltése</button>
    </div>
  )
}
