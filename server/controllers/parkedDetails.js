import express from 'express';

import ParkingDetail from '../models/parkedDetails.js';

const router = express.Router();

export const getParkingDetails = async (req, res) => { 
    try {
        const parkingDetails = await ParkingDetail.find();
                
        res.status(200).json(parkingDetails);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getParkingDetail = async (req, res) => { 
    const { id } = req.params;

    try {
        const parkingDetail = await ParkingDetail.findById(id);
        
        res.status(200).json(parkingDetail);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const createparkingDetail = async (req, res) => {
    const parkingDetail = req.body;

    const newParkingDetail = new ParkingDetail({ ...parkingDetail })

    try {
        await newParkingDetail.save();

        res.status(201).json(newParkingDetail);
    } catch (error) {
        res.status(409).json({ message: error.message });
    }
}

export default router;