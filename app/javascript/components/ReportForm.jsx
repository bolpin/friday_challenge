import React from "react";
import { render, createRoot } from "react-dom";
import ColorProvider from "./ColorProvider";
import App from "./App";
// import ReactDOM from 'react-dom/client'
// import React from 'react'


render(
  <ColorProvider>
    <App />
  </ColorProvider>,
  document.getElementById("root")
);

