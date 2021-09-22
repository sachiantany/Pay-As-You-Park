import datetime

# datetime object containing current date and time
now = datetime.datetime.now()
print(now)
now = now + datetime.timedelta(seconds=1331)
print(now)

