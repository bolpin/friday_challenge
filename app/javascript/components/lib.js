import axios from "axios";

export const axiosClient = axios.create({
  baseURL: "https://localhost:3000/api/v1"
});

export const createArray = length => [...Array(length)];
