import mongoose from "mongoose";

const slotsDetails = mongoose.Schema({
  PID: {type: String, required: true},
  Name: {type: String, required: true},
  Occupancy :{type: String, required: true},
  Slots:{
    sid: {type: String, required: true},
    availability: {type: Boolean, required: true},
  }
});

var SlotsDetails = mongoose.model('SlotsDetails', slotsDetails);

export default SlotsDetails;