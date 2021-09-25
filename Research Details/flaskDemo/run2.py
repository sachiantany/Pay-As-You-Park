import numpy as np
from keras.models import load_model
from flask import Flask, render_template, request
import pickle

app = Flask(__name__)
model_x = load_model('x.model')
model_y = load_model('y.model')


def give_predictions(input_array):
    prediction = {}
    # get x value
    predicted_x = np.argmax(model_x.predict(np.array(input_array).reshape(1, 3, )))
    #predicted_x = np.argmax(model_x.predict(np.array(input_array)))
    # predicted_x=model_x.predict(input_array)

    # get y value
    predicted_y = np.argmax(model_y.predict(np.array(input_array).reshape(1, 3, )))
    #predicted_y = np.argmax(model_y.predict(np.array(input_array)))
    # predicted_y=model_y.predict(input_array)

    prediction['x'] = predicted_x
    prediction['y'] = predicted_y

    return prediction

    # print(give_predictions([0.877462, 0.768608, 1.457214]))


@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        user_input_A = request.form.get('beaconA')
        user_input_B = request.form.get('beaconB')
        user_input_C = request.form.get('beaconC')

        user_input_A = float(user_input_A)
        user_input_B = float(user_input_B)
        user_input_C = float(user_input_C)

        beacon_array = [user_input_A, user_input_B, user_input_C]

        print("####################################################")
        prediction = give_predictions(beacon_array)
        print(prediction)
    return render_template('index.html', prediction=prediction)

if __name__ == '__main__':
    app.run(debug=True, threaded=False)