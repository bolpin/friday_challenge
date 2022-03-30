import React, { createContext, useState, useContext } from "react";
import resultsData from "./results-data.json";
import { v4 } from "uuid";

const ResultsContext = createContext();
export const useResults = () => useContext(ResultsContext);

export default function ResultsProvider({ children }) {
  const [results, setResults] = useState(colorData);

  const addColor = (title, color) =>
    setColors([
      ...results,
      {
        id: v4(),
        rating: 0,
        title,
        color
      }
    ]);

  // const rateColor = (id, rating) =>
  //   setColors(
  //     colors.map(color => (color.id === id ? { ...color, rating } : color))
  //   );

  // const removeColor = id => setColors(colors.filter(color => color.id !== id));

  return (
    <ResultsContext.Provider value={{ results }}>
      {children}
    </Results.Provider>
  );
}

