import numpy as np
import pandas as pd
import random
# from datetime import datetime
import time
import datetime

PARKING_SLOT = {
    'P1': 120,
    'P2': 75,
    'P3': 100,
    'p4': 40
}

global START_DATE
global END_DATE
global TIME_BETWEEN_DATE
global DAYS_BETWEEN_DATES
START_DATE = '01-01-2021 00:00:00'
END_DATE = '04-01-2021 00:00:00'

UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 12, 0, 0)
UNIQUE_DATE_TIME_LIST = []



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
    global UNIQUE_DATE_TIME

    random_date_list = []


    for i in range(0, range_value):
        # random_number_of_days = random.randrange(DAYS_BETWEEN_DATES)

        # data
        occupied = random.randint(0, max_parking)

        # ranges
        random_adding_minutes = random.randint(29, 30)
        random_adding_seconds = random.randint(0, 59)

        # date_and_time = datetime.datetime(2021, 1, 1, 12, 0, 0)
        date_and_time = UNIQUE_DATE_TIME
        time_change = datetime.timedelta(minutes=random_adding_minutes, seconds=random_adding_seconds)
        random_date = date_and_time + time_change
        random_date = random_date.strftime('%m/%d/%Y %H:%M:%S')
        # UNIQUE_DATE_TIME = random_date

        UNIQUE_DATE_TIME = datetime.datetime.strptime(random_date, '%m/%d/%Y %H:%M:%S')

        to_return_data = {'parking_yard_id': parking, 'occcupancy': occupied, 'last_update': str(random_date), 'capacity': max_parking}
        yield to_return_data
    
    UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 12, 0, 0)


to_csv_data = []
for parking in PARKING_SLOT:
    # global UNIQUE_DATE_TIME
    print(parking)
    # breakpoint()

    data_set_values = random.randint(5, 10)

    max_parking = PARKING_SLOT[parking]

    data_generator = generate_data(data_set_values, max_parking, parking)



    # UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 12, 0, 0)

    # breakpoint()
    for ss in data_generator:
        to_csv_data.append(ss)
        # print(ss)
    


# To dataframe
final_Data_frame = pd.DataFrame(to_csv_data)
final_Data_frame.to_csv('res.csv', index=False)