import express from 'express';

import { getParkingDetails, getParkingDetail, createparkingDetail } from '../controllers/parkedDetails.js';

const router = express.Router();
import auth from "../middleware/auth.js";

router.get('/', getParkingDetails);
// router.get('/', auth, getParkingDetail);
router.post('/', createparkingDetail);

export default router;