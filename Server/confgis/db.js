const mongoose = require("mongoose");

const connectDB = () => {
  mongoose
    .connect(process.env.ATLAS_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    })
    .then(() => console.log("Database connection established successfully"))
    .catch(() => console.log("Error connecting to Database "));
};

module.exports = connectDB;
