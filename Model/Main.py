import numpy as np
import pandas as pd
import random
# from datetime import datetime
import time
import datetime

#generate random sample data based on parking history overview

PARKING_SLOT = {
    'P1' : 120,
    'P2' : 75,
    'P3' : 100,
    'P4' : 225,
    'P5' : 300,
    'P6' : 250,
    'P7' : 450,
    'P8' : 150,
    'P9' : 300,
    'P10' : 450,
    'P11' : 800,
    'P12' : 780,
    'P13' : 600,
    'P14' : 400,
    'P15' : 445,
    'P16' : 667,
    'P17' : 289,
    'P18' : 380,
    'P19' : 560,
    'P20' : 180,
    'P21' : 300,
    'P22' : 400,
    'P23' : 280,
    'P24' : 740,
    'P25' : 469,
    'P26' : 385,
    'P27' : 198,
    'P28' : 228,
    'P29' : 663,
    'P30' : 445,
}

global START_DATE
global END_DATE
global TIME_BETWEEN_DATE
global DAYS_BETWEEN_DATES
START_DATE = '01-01-2021 00:00:00'
END_DATE = '04-01-2021 00:00:00'

UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 0, 0, 0)
UNIQUE_DATE_TIME_LIST = []

# some_dict = {'monday': [60,80], 'tuesday': [30, 50], 'wednesday': [80, 90]}
# 'monday' => 8-3 [60-70, 3-12 , [80-90],  12-8 [30-40]
# monday => 48 0:30 => 
# P1 => 100 (60-70, 80-90, 30-40)

def is_time_between(begin_time, end_time, check_time=None):
    # If check time is not given, default to current UTC time
    check_time = check_time or datetime.utcnow().time()
    if begin_time >= end_time:
        return True
        # return check_time >= begin_time and check_time <= end_time
    else: # crosses midnight
        return check_time >= begin_time or check_time <= end_time

def get_parking_range_for_days(day, dtime, max_parking):

    str_time_to_date_time = datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S')
    # str_time_to_date_time = datetime.datetime.strptime('12:30:42', '%H:%M:%S').time())
    # print(str_time_to_date_time , "    ------     ", type(dtime))

    # 7-9 
    week_day_time_range_1_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'07:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_1_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'09:00:00', '%Y-%m-%d %H:%M:%S')

    # 9-12 
    week_day_time_range_2_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'09:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_2_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'12:00:00', '%Y-%m-%d %H:%M:%S')

    # 12-15
    week_day_time_range_3_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'12:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_3_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'15:00:00', '%Y-%m-%d %H:%M:%S')

    # 15-17
    week_day_time_range_4_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'15:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_4_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'17:00:00', '%Y-%m-%d %H:%M:%S')

    # 17-22
    week_day_time_range_5_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'17:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_5_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'22:00:00', '%Y-%m-%d %H:%M:%S')

    # 22-07
    week_day_time_range_6_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'22:00:00', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_6_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'00:00:00', '%Y-%m-%d %H:%M:%S')

    # 22-07
    week_day_time_range_7_start_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'23:59:59', '%Y-%m-%d %H:%M:%S')
    week_day_time_range_7_end_value = datetime.datetime.strptime(str(datetime.datetime.strptime(str(dtime), '%Y-%m-%d %H:%M:%S').date())+" "+'07:00:00', '%Y-%m-%d %H:%M:%S')

    weekdays_list = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    weekends_list = ['Saturday', 'Sunday']

    try:

        if (day in weekdays_list):
            # r1
            # breakpoint()

            # 12 >x<10
            if ((str_time_to_date_time > week_day_time_range_1_start_value) and (str_time_to_date_time < week_day_time_range_1_end_value)):
                percent = random.randint(10, 30)
                occupied = max_parking * (percent/100)
                return {'range': '10 - 30', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r2
            if ((str_time_to_date_time >= week_day_time_range_2_start_value) and (str_time_to_date_time <= week_day_time_range_2_end_value)):
                percent = random.randint(30, 55)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '30 -50', 'percent': percent, 'occupied': int(round(occupied, 0))}
                
            # r3
            if ((str_time_to_date_time >= week_day_time_range_3_start_value) and (str_time_to_date_time <= week_day_time_range_3_end_value)):
                percent = random.randint(55, 60)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '55 - 60', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r4
            if ((str_time_to_date_time >= week_day_time_range_4_start_value) and (str_time_to_date_time <= week_day_time_range_4_end_value)):
                percent = random.randint(45, 55)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '45 - 55', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r5
            if ((str_time_to_date_time >= week_day_time_range_5_start_value) and (str_time_to_date_time <= week_day_time_range_5_end_value)):
                percent = random.randint(25, 40)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '25 - 40', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r6
            if ((week_day_time_range_6_start_value >= str_time_to_date_time) and (week_day_time_range_6_end_value <= str_time_to_date_time)):
                
                percent = random.randint(5, 10)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '5 - 10', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            if ((week_day_time_range_7_start_value >= str_time_to_date_time) and (week_day_time_range_7_end_value < str_time_to_date_time)):
                percent = random.randint(5, 10)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '5 -10', 'percent': percent, 'occupied': int(round(occupied, 0))}

            print(str_time_to_date_time)
            return {'range': '5 -10', 'percent': True, 'occupied': True}

        
        if (day in weekends_list):
            if ((str_time_to_date_time > week_day_time_range_1_start_value) and (str_time_to_date_time < week_day_time_range_1_end_value)):
                percent = random.randint(10, 30)
                occupied = max_parking * (percent/100)
                return {'range': '10 - 30', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r2
            if ((str_time_to_date_time >= week_day_time_range_2_start_value) and (str_time_to_date_time <= week_day_time_range_2_end_value)):
                percent = random.randint(30, 55)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '30 -50', 'percent': percent, 'occupied': int(round(occupied, 0))}
                
            # r3
            if ((str_time_to_date_time >= week_day_time_range_3_start_value) and (str_time_to_date_time <= week_day_time_range_3_end_value)):
                percent = random.randint(55, 60)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '55 - 60', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r4
            if ((str_time_to_date_time >= week_day_time_range_4_start_value) and (str_time_to_date_time <= week_day_time_range_4_end_value)):
                percent = random.randint(45, 55)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '45 - 55', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r5
            if ((str_time_to_date_time >= week_day_time_range_5_start_value) and (str_time_to_date_time <= week_day_time_range_5_end_value)):
                percent = random.randint(25, 40)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '25 - 40', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            # r6
            if ((week_day_time_range_6_start_value >= str_time_to_date_time) and (week_day_time_range_6_end_value <= str_time_to_date_time)):
                
                percent = random.randint(5, 10)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '5 - 10', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            if ((week_day_time_range_7_start_value >= str_time_to_date_time) and (week_day_time_range_7_end_value < str_time_to_date_time)):
                percent = random.randint(5, 10)
                occupied = max_parking * (percent/100)
                # print(occupied)
                return {'range': '5 -10', 'percent': percent, 'occupied': int(round(occupied, 0))}
            
            return {'range': '5 -10', 'percent': False, 'occupied': False}
    
    except Exception as e:
        print(e)
        import sys
        sys.exit()



def ceil_dt(dt, delta):
    return dt + (datetime.min - dt) % delta

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

        day_name= ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday']
        week_day_in_integer = UNIQUE_DATE_TIME.weekday()
        week_day_in_words = day_name[week_day_in_integer]
        occupied_percent_dict = get_parking_range_for_days(week_day_in_words, UNIQUE_DATE_TIME, max_parking)
        # print(random_date)
        if (len(occupied_percent_dict.keys()) <=0 ):
            breakpoint()

        to_return_data = {'parking_yard_id': parking, 'occcupancy': occupied_percent_dict['occupied'], 'last_update': str(random_date), 'capacity': max_parking}
       
            # print(to_return_data)
        yield to_return_data
    
    UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 0, 0, 0)


to_csv_data = []
for parking in PARKING_SLOT:
    # global UNIQUE_DATE_TIME
    print(parking)
    # breakpoint()

    data_set_values = random.randint(2160, 2160)

    max_parking = PARKING_SLOT[parking]

    data_generator = generate_data(data_set_values, max_parking, parking)



    # UNIQUE_DATE_TIME  = datetime.datetime(2021, 1, 1, 12, 0, 0)

    # breakpoint()
    for ss in data_generator:
        to_csv_data.append(ss)
        # print(ss)
    


# To dataframe
final_Data_frame = pd.DataFrame(to_csv_data)
final_Data_frame.to_csv('result.csv', index=False)