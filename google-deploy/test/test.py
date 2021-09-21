import requests

resp = requests.post("http://127.0.0.1:5000/", json={'url': 'https://sableasphalt.com/wp-content/uploads/2018/02/Sable-Potholes-Before.jpg'})

print(resp.text)