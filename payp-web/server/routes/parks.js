import express from 'express';

import { getParks, getPark, createPark, updatePark, likePark, deletePark } from '../controllers/parks.js';

const router = express.Router();
import auth from "../middleware/auth.js";

router.get('/', getParks);
router.post('/',auth,  createPark);
router.patch('/:id', auth, updatePark);
router.delete('/:id', auth, deletePark);
router.patch('/:id/likePark', auth, likePark);

export default router;