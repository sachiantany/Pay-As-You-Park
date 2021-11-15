
import express from 'express';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import cors from 'cors';

import postRoutes from './routes/posts.js';
import userRouter from "./routes/user.js";
import driverRouter from "./routes/driver.js";
import packageRouter from "./routes/package.js";
import subscriptionRouter from "./routes/subscription.js";


const app = express();

app.use(express.json())

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors());

app.use('/posts', postRoutes);
app.use("/user", userRouter);
app.use("/driver", driverRouter)
app.use("/package", packageRouter)
app.use("/subscription", subscriptionRouter)


const CONNECTION_URL = 'mongodb+srv://admin:admin@cluster0.rubhg.mongodb.net/paypdb?retryWrites=true&w=majority';
const PORT = process.env.PORT|| 5000;

mongoose.connect(CONNECTION_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => app.listen(PORT, () => console.log(`Server Running on Port: http://localhost:${PORT}`)))
  .catch((error) => console.log(`${error} did not connect`));

mongoose.set('useFindAndModify', false);