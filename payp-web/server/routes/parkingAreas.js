import express from 'express';

import { getParkingArea, getParkingAreas, createParkingArea, updateParkingArea, deleteParkingArea } from '../controllers/parkingAreas.js';

const router = express.Router();
import auth from "../middleware/auth.js";

router.get('/', getParkingAreas);
// router.get('/', getParkingAreas);
router.post('/create/',auth,  createParkingArea);
router.patch('/update/:id', auth, updateParkingArea);
router.delete('/:id', auth, deleteParkingArea);

export default router;
