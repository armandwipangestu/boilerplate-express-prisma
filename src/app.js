import express from "express";
import dotenv from "dotenv";
import postController from "./post/post.controller.js";

const app = express();

dotenv.config();

app.use(express.json());
app.use(`${process.env.API_VERSION}`, postController);

app.listen(5000, () => {
    console.log(`Server running on port http://localhost:5000`);
});
