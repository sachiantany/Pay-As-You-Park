import express from "express";
const router = express.Router();

import { getSlotDetails, addSlotDetails, getSlotDetail } from "../controllers/slotDetails.js";

router.get("/", getSlotDetails);
router.get("/:PID", getSlotDetail);
router.post("/", addSlotDetails);


export default router;