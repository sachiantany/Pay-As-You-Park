import express from "express";
const router = express.Router();
import auth from "../middleware/auth.js";
import { getIndoorLocations, getIndoorLocation, createLocation } from "../controllers/indoorLocation.js";

router.get("/", getIndoorLocations);
router.get("/:id", auth,getIndoorLocation);
router.post("/", createLocation);


export default router;