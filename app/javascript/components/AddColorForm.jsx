import React from "react";
import { useInput } from "./hooks";

export default function AddColorForm() {
  const [titleProps, resetTitle] = useInput("");

  const submit = e => {
    e.preventDefault();
    addColor(titleProps.value, colorProps.value);
    resetTitle();
    resetColor();
  };

  return (
    <form onSubmit={submit}>
      <input
        {...titleProps}
        type="text"
        placeholder="Minimum version"
        required
      />
      <input {...colorProps} type="color" required />
      <button>Submit</button>
    </form>
  );
}


