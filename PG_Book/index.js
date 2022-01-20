const express = require("express");
const app = express();
const pool = require("./db");

app.use(express.json());

app.post("/book", async(req,res) => {
    try{
        const {isbn_id,year,title,price } = req.body;
        const newBook = await pool.query("INSERT INTO book (isbn_id,year,title,price) VALUES ($1,$2,$3,$4) RETURNING *", [isbn_id,year,title,price]);
        res.json(newBook);
    }catch(err){
        console.error(err.message);
    }
});

app.listen(3000, () => {
    console.log("server is listening on port 3000");
});