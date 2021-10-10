import express from "express";
const router = express.Router();

import { getIndoorLocations, giveLocation, getIndoorLocation } from "../controllers/indoorLocation.js";

router.get("/", getIndoorLocations);
router.get("/:id", getIndoorLocation);
router.post("/", giveLocation);


export default router;