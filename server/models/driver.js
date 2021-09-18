import mongoose from "mongoose";

const driverSchema = mongoose.Schema({
  first_name: { type: String, required:  true },
  last_name: { type: String, required:  true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  vehicle_registration_no :{type: String},
  vehicle_width: { type: String, required: true  },
  vehicle_length: { type: String, required: true  },
  vehicle_height: { type: String, required: true  },
  id: { type: String},
});

export default mongoose.model("Driver", driverSchema);