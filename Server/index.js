require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();

const db = require("./confgis/db");

const port = process.env.PORT || 8000;

app.use(express.json());

app.use(cors());

app.get("/", (_, res) => {
  res.send("Server is listening for requests");
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

db();
