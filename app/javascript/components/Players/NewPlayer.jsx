const PlayerForm = () => {
  return <form>
      <div className='actions'>
        <label>First name</label>
        <input type="text" />
      </div>
      <div className='actions'>
        <label>Last name</label>
        <input type="text" />
      </div>
      <div className='controls'>
        <label>Birthdate</label>
        <input type="date" min="1920-01-01" max="2012-01-01"/>
      </div>
      <div className='actions'>
        <button type='submit'>Add Player</button>
      </div>
    </form>
}
