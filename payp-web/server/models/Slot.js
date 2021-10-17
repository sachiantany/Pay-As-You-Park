const mongoose = require("mongoose");
mongoose.set('useFindAndModify', false);
const Schema = mongoose.Schema;

//create Schema
const SlotSchema = new Schema(
    {
        slotNumber : {
            type : Number ,
            require : true
        },

        availability :{
            type: Boolean ,
            require: false,
            default: false
        }
    },

);

module.exports = Slot = mongoose.model("slot" , SlotSchema);
