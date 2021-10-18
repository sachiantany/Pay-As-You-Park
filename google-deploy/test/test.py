import requests

url = "https://sableasphalt.com/wp-content/uploads/2018/02/Sable-Potholes-Before.jpg"
url2 = "https://res.cloudinary.com/dkp9t1k1g/image/upload/v1634469117/mtx5hknsfgc8esybqtz0.jpg"

# resp = requests.post("http://127.0.0.1:5000/", json={'url': url})
resp = requests.post("http://127.0.0.1:5000/", url2)


print(resp.text)