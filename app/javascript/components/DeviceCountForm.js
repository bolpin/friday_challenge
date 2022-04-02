import React from "react";
import { useInput } from "./hooks";

export default function DeviceCountForm() {
  const [osProps, resetOs] = useInput("");
  const [minVersionProps, resetMinVersion] = useInput("");
  const [maxVersionProps, resetMaxVersion] = useInput("");

  const submit = e => {
    e.preventDefault();

    console.log("submitted");
  };

  return (
    <form onSubmit={submit}>
      <input
        {...osProps}
        type="text"
        placeholder="Operating System"
        required
      />
      <input
        {...minVersionProps}
        type="text"
        placeholder="Min. version"
        required
      />
      <input
        {...maxVersionProps}
        type="text"
        placeholder="Max. version"
        required
      />
      <button>Submit</button>
    </form>
  );
}


