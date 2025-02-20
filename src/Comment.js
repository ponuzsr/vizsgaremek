import React from 'react'

export default function Comment() {
  return (
    <div>
       <label for="exampleInputcomment" class="form-label">Ide írja kommentjét:</label>
      <input type="comment" class="form-control" id="exampleInputcomment" aria-describedby="commentHelp"/>
      <br/>
      <button type="submit" class="btn btn-info">Küldés</button>
    </div>
  )
}
