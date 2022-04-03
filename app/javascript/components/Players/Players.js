import React from "react";
import Player from './Player'
import './Player.css'

export default function Players({ data }) {
  return (
    <>
      <h2>Players</h2>
      { data.map( (item) => (
        <Player key={item.id} {...item} />
      ))}
    </>
  )};