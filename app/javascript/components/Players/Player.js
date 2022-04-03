import React from "react"
import PlayerControls from "./PlayerControls"

export default function Player({id, first_name, last_name, birthdate, gender_id}) {
  clickHandler = () => { console.log("clicked")}
  return(
    <>
      <div className='player'>
        <h2>
          {first_name} {last_name}
        </h2>
        <div className='player__name'> 
          dob: {birthdate}
        </div>
        <div className='player__gender'> 
          gender_id: {gender_id}
        </div>
        <PlayerControls player_id={id} />
      </div>

    </>
  );

}
