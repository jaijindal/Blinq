import requests, json
from geopy.geocoders import Nominatim
import geocoder
import requests
import asyncio
from sanic import Sanic, json
from sanic.response import text


import cv2
import pytesseract
from skimage import io

def get_text(link):
    pytesseract.pytesseract.tesseract_cmd ="D://jinda//NTU//SEMESTER 3//MLDA//Tesseract-OCR//tesseract.exe"
    img = io.imread(link)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    ret, thresh1 = cv2.threshold(gray, 0, 255, cv2.THRESH_OTSU | cv2.THRESH_BINARY_INV)
    rect_kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (18, 18))
    dilation = cv2.dilate(thresh1, rect_kernel, iterations = 1)
    contours, hierarchy = cv2.findContours(dilation, cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_NONE)
    im2 = img.copy()
    for cnt in contours:
        x, y, w, h = cv2.boundingRect(cnt)
        rect = cv2.rectangle(im2, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cropped = im2[y:y + h, x:x + w]
        text = pytesseract.image_to_string(cropped)
        return text



def get_weather():
    api_key = "c5ab4f266e6a5a19486dd3958124143a"
    base_url = "http://api.openweathermap.org/data/2.5/weather?"
    loc = geocoder.ip('me')
    latitude = str(loc.geojson['features'][0]['properties']['lat'])
    longitude = str(loc.geojson['features'][0]['properties']['lng'])
    geolocator = Nominatim(user_agent="geoapiExercises")   
    location = geolocator.reverse(latitude+","+longitude)
    city_name = (location.raw['address']['country'])
    complete_url = base_url + "appid=" + api_key + "&q=" + city_name
    response = requests.get(complete_url)
    x = response.json()
    if (x["cod"] != "404"):
        y = x["main"]
        current_temperature = float(y["temp"]) -273.15
        current_pressure = y["pressure"]
        current_humidity = y["humidity"]
        z=x["weather"]
        weather_description = z[0]["description"]
        #print("City Name: ", city_name)
        return weather_description
        
    else:
        pass

def get_uv():
    api_key = "28cc5865df648ac64d12593ce6a70f2e"
    loc = geocoder.ip('me')
    latitude = str(loc.geojson['features'][0]['properties']['lat'])
    longitude = str(loc.geojson['features'][0]['properties']['lng'])
    headers = {'x-access-token': api_key,}
    response = requests.get('https://api.openuv.io/api/v1/uv?lat=-31.45&lng=115.67&dt=2018-01-24T10:50:52.283Z', headers=headers)
    data=response.text
    data.split("{")
    uv = float(data[16:20])
    return uv



app = Sanic("CodeToAPI")
HOST = "localhost"
PORT = 8000


@app.route('/get_weather')
async def getweather(request):
    return json({'now': get_weather()})

@app.route('/get_text')
async def gettext(request):
    parameters=request.args
    result=get_text(str(parameters['link'][0]))
    return json({'text': get_text()})

@app.route('/get_uv')
async def getuv(request):
    return json({'uv': get_uv()})

if __name__ == "__main__":
    app.run(host=HOST, port=PORT, debug=True, auto_reload=True)






