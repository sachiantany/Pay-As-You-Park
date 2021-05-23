/*
This program used to generate reandom parking data
*/

import numpy as np
import pandas as pd
import random
from datetime import datetime
import time

PARKING_SLOT = {
    'P1': 120,
    'P2': 75,
    'P3': 100,
    'P4': 225,
    'P5': 300,
    'P6': 250,
    'P7': 450,
    'P8': 150,
    'P9': 300,
    'P10': 450,
    'P11': 800,
    'P12': 780,
    'P13': 600,
    'P14': 400,
    'P15': 445,
    'P16': 667,
    'P17': 289,
    'P18': 380,
    'P19': 560,
    'P20': 180,
    'P21': 300,
    'P22': 400,
    'P23': 280,
    'P24': 740, 
    'P25': 469, 
    'P26': 385, 
    'P27': 198, 
    'P28': 228, 
    'P29': 663, 
    'P30': 445
}

global START_DATE
global END_DATE
global TIME_BETWEEN_DATE
global DAYS_BETWEEN_DATES
START_DATE = '01-01-2020 00:00:00'
END_DATE = '04-01-2021 00:00:00'



def generate_random_date(start, end):
    frmt = '%d-%m-%Y %H:%M:%S'

    stime = time.mktime(time.strptime(start, frmt))
    etime = time.mktime(time.strptime(end, frmt))

    ptime = stime + random.random() * (etime - stime)
    dt = datetime.fromtimestamp(time.mktime(time.localtime(ptime)))
    return dt


# Fucntiont to generate data
# range_value => to create the number of data
# max_parking => the number of parking slots available in the given parking yard
def generate_data(range_value, max_parking, parking):
    random_date_list = []
    # breakpoint()
    # for item in (0, range_value):
    for i in range(0, range_value):
        # random_number_of_days = random.randrange(DAYS_BETWEEN_DATES)

        # data
        occupied = random.randint(0, max_parking)
        random_date = generate_random_date(START_DATE, END_DATE)
        # random_date = START_DATE + datetime.timedelta(days=random_number_of_days)

        random_date_list.append(random_date)
        while random_date not in (random_date_list):
            random_date = generate_random_date(START_DATE, END_DATE)

        to_return_data = {'parking_yard_id': parking, 'occcupancy': occupied, 'last_update': str(random_date)}
        yield to_return_data
            


to_csv_data = []
for parking in PARKING_SLOT:
    print(parking)
    # breakpoint()

    data_set_values = random.randint(5000, 10000)

    max_parking = PARKING_SLOT[parking]

    data_generator = generate_data(data_set_values, max_parking, parking)

    # breakpoint()
    for ss in data_generator:
        to_csv_data.append(ss)
        # print(ss)
    


# To dataframe
final_Data_frame = pd.DataFrame(to_csv_data)
final_Data_frame.to_csv('res.csv', index=False)