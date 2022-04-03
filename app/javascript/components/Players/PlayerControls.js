import React from "react"

export default function PlayerControls( {player_id} ) {
  clickHandler = (ev) => {
    console.log(`${ev.target.dataset.player_id} clicked`)
  }

  return(
    <>
      <div>
        <button data_player_id={player_id} onClick={clickHandler}>Do something {player_id}</button>
      </div>
    </>
  );
}