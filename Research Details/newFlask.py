import numpy as np
from keras.models import load_model
from flask import Flask, request, jsonify

app = Flask(__name__)
model_x = load_model('x.model')
model_y = load_model('y.model')


def give_predictions(input_array):
    prediction = {}
    # get x value
    predicted_x = np.argmax(model_x.predict(np.array(input_array).reshape(1, 3, )))

    # get y value
    predicted_y = np.argmax(model_y.predict(np.array(input_array).reshape(1, 3, )))

    prediction['x'] = predicted_x
    prediction['y'] = predicted_y

    return prediction

    # print(give_predictions([0.877462, 0.768608, 1.457214]))


@app.route('/api', methods=['GET'])
def position():
    dict = {}
    user_input_a = str(request.args['beacon_a'])
    user_input_b = str(request.args['beacon_b'])
    user_input_c = str(request.args['beacon_c'])

    print("inputs: " + user_input_a, user_input_b, user_input_c)

    value_float_a = float(user_input_a)
    value_float_b = float(user_input_b)
    value_float_c = float(user_input_c)

    beacon_array = [value_float_a, value_float_b, value_float_c]
    print(beacon_array)
    print("####################################################")
    prediction = give_predictions(beacon_array)

    print(prediction)
    print("*****************************************************")
    dict['output'] = prediction
    print(dict)
    return [dict]


if __name__ == '__main__':
    app.run(debug=False, threaded=False)