from DBConnection import get_database
from pandas import DataFrame
from Haversine import dist
import datetime
import googlemaps
import pickle

def find_nearest(lat, long):
    distances = available_yards_df.apply(
        lambda row: dist(lat, long, row['Latitude'], row['Longitude']), 
        axis=1)
    return available_yards_df.loc[distances.idxmin(), 'PID']

user_lat = 79.9099906
user_lon = 6.9342454
user_max_width = 8
user_max_length = 10
user_max_height = 11

dbname = get_database()

# Create a new collection
collection_name = dbname["parking_yard"]
query = {"Capacity" > "Occupancy"}

parking_yards = collection_name.find()

from pandas import DataFrame
# convert the dictionary objects to dataframe
items_df = DataFrame(parking_yards)

# see the magic
#print(items_df)

items_df['Capacity'] = items_df.Capacity.astype(int)
items_df['Occupancy'] = items_df.Occupancy.astype(int)
items_df['MaxWidth'] = items_df.MaxWidth.astype(int)
items_df['MaxLength'] = items_df.MaxLength.astype(int)
items_df['MaxHeight'] = items_df.MaxHeight.astype(int)
items_df['Latitude'] = items_df.Latitude.astype(str).astype(float)
items_df['Longitude'] = items_df.Longitude.astype(str).astype(float)

available_yards_df = items_df.loc[(items_df.Capacity > items_df.Occupancy) & (items_df.MaxHeight > user_max_height) & (items_df.MaxWidth > user_max_width) & (items_df.MaxLength > user_max_length)]

print(available_yards_df)

found_yard = False
sugest_yard_id = ''
yard_id = ''
latitude = ''
longitude = ''
API_key = '' #enter Google Maps API key
gmaps = googlemaps.Client(key=API_key)

model = pickle.load(open('model.pkl','rb'))

while found_yard == False:
    yard_id = find_nearest(user_lat,user_lon)
    latitude = available_yards_df.loc[available_yards_df['PID'] == yard_id].Latitude
    longitude = available_yards_df.loc[available_yards_df['PID'] == yard_id].Longitude

    origins = (user_lon,user_lat)
    destination = (longitude,latitude)

    #print(latitude)
    #print(longitude)

    #result = gmaps.distance_matrix(origins, destination, mode='driving')["rows"][0]["elements"][0]["duration"]["value"]
    result = 1331

    # datetime object containing current date and time
    now = datetime.datetime.now()
    reach_time = now + datetime.timedelta(seconds=result)
    print(reach_time)

    occupancy = model.predict(start=reach_time, end=reach_time)

    print(occupancy)

    if occupancy < 100:
        found_yard = True

    #for now
    found_yard = True
    


