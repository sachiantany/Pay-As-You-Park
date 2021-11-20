import express from 'express';
import mongoose from 'mongoose';
import SlotDetails from '../models/slotsDetails.js';

const router = express.Router();

export const getSlotDetails= async (req, res) => { 
   
    try {
        const slotMessages= await SlotDetails.find();

        res.status(200).json(slotMessages);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getSlotDetail= async (req, res) => { 
    const { PID } = req.params;
    try {
        const slotMessages= await SlotDetails.findById(PID);

        res.status(200).json(slotMessages);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const addSlotDetails = async (req, res) => {
    const slots = req.body;

    //const newPostMessage = new PostMessage({ ...post, creator: req.userId, createdAt: new Date().toISOString() })
    const newSlot = new SlotDetails({ ...slots});


    try {
        await newSlot.save();

        res.status(201).json(newSlot);
    } catch (error) {
        res.status(409).json({ message: error.message });
    }
}

export default router;