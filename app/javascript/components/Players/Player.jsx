export default function Player = (props) => {
  return(
    <Card>
      <h2>
        Name : {first_name} {last_name}
      </h2>
      Birthdate : {birthdate}
      <button onClick={clickHandler}>Change name</button>
    </Card>
  );

}
