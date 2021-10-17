import express from 'express';

import { getParkingArea, getParkingAreas, createParkingArea, updateParkingArea, deleteParkingArea, getParkingAreaByUserId, updateParkingAreaSlots } from '../controllers/parkingAreas.js';

const router = express.Router();
import auth from "../middleware/auth.js";

router.get('/', getParkingAreas);
router.get('/:id', getParkingArea);
router.post('/create/',auth,  createParkingArea);
router.patch('/update/:id', auth, updateParkingArea);
router.delete('/:id', auth, deleteParkingArea);
router.get('/user/', auth, getParkingAreaByUserId);
router.patch('/occupancy/:id', updateParkingAreaSlots);

export default router;
