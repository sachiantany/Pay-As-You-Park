import mongoose from 'mongoose';

const parkingDetailSchema = mongoose.Schema({
    user: String,
    inTime: String,
    outTime: String,
})

var ParkingDetail = mongoose.model('ParkingDetail', parkingDetailSchema);

export default ParkingDetail;