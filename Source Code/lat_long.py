from geopy.geocoders import Nominatim
geolocator = Nominatim(user_agent="geoapiExercises")
Latitude = "25.594095"
Longitude = "85.137566"
 
location = geolocator.reverse(Latitude+","+Longitude)
 
print(location)
a = str(location)
x = a.split(", ")
y = x[:-1]
print(y)