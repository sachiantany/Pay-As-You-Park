import express from 'express';
import mongoose from 'mongoose';
import IndoorLocation from '../models/indoorLocation.js';


const router = express.Router();

export const getIndoorLocations = async (req, res) => { 
    try {
        const locationMessages = await IndoorLocation.find();

        res.status(200).json(locationMessages);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getIndoorLocation = async (req, res) => { 
    const { id } = req.params;

    try {
        const location = await IndoorLocation.findById(id);
        
        res.status(200).json(location);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const giveLocation = async (req, res) => {
    const location = req.body;

    const newLocation = new IndoorLocation({ ...location })

    try {
        await newLocation.save();

        res.status(201).json(newLocation);
    } catch (error) {
        res.status(409).json({ message: error.message });
    }
}

export default router;