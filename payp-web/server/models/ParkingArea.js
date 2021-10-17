import mongoose from 'mongoose';
const Schema = mongoose.Schema;
const ObjectId = mongoose.Schema.Types.ObjectId;

const ParkingAreaSchema = new Schema({
    user_id:{
      type: ObjectId,
      ref: 'User',
      required: true
    },
    PID: {
        type: String,
        required: true
    },
    Latitude: {
        type: String,
        required: false
    },
    Longitude: {
        type: String,
        required: false
    },
    Name: {
        type: String,
        required: true
    },
    Address: {
        type: String,
        required: false,
        default: ""
    },
    Capacity: {
        type: Number,
        required: true
    },
    Occupancy: {
        type: Number,
        required: true
    },
    MaxWidth:{
        type:String,
        required: false,
        default: ""
    },
    slots: [{
        slotNumber : {
            type : Number ,
            require : true
        },

        availability :{
            type: Boolean ,
            require: false,
            default: false
        }
    }]
});

const ParkingArea = mongoose.model('ParkingArea', ParkingAreaSchema);

export default ParkingArea;
