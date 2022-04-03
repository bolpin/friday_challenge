import React, { useState } from "react";
import Fetch from "./Fetch"
import Players from "./Players/Players"
// import { axiosClient } from "./lib"

export default App = () => {
  return (
      <Fetch
        uri={`http://localhost:3000/api/v1/players`}
        renderSuccess={Players}
      />
  );
}
// [{
//   "id":1,
//   "first_name":"Baz",
//   "last_name":"Who",
//   "birthdate":"1980-03-25",
//   "created_at":"2022-04-02T21:45:28.859Z",
//   "updated_at":"2022-04-02T21:45:28.859Z",
//   "gender_id":1},

// function Hoopy({ data }) {
//   return (
//     <div>
//       {
//         data.map( ({id, first_name, last_name, birthdate, created_at, updated_at, gender_id} ) => {
//           return <p id={id}>{first_name} {last_name}</p> 
//         })
//       }
//     </div>
//   );
// }