from flask import Flask, render_template, request
import pickle

app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def home():
    if request.method == 'POST':
        x_model = pickle.load(open('modelX.pkl','rb'))
        # y_model = pickle.load(open('modelY.pkl','rb'))
        user_input_A = request.form.get('beaconA')
        user_input_B = request.form.get('beaconB')
        user_input_C = request.form.get('beaconC')
        print(user_input_A,user_input_B,user_input_C)
        # prediction = x_model.predict([[user_input_A],[user_input_B],[user_input_C]])
        # print(prediction)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)