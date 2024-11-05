
import firebase_admin
from firebase_admin import credentials, db


# This for R
# import time
# import adafruit_dht
# import board
 

# Fetch Google Firebase Database via json file 
cred = credentials.Certificate('firebasConfigration/firebase-adminsdk.json')
firebase_admin.initialize_app(cred, { 'databaseURL': "https://research-143-default-rtdb.firebaseio.com/"})


def listener(event):
    print(' ---------------------------------------------------- ')
    print('Firebase event detected: ')
    print(event.event_type)  # can be 'put' or 'patch'
    print(event.path)  # relative to the reference, it seems
    print(event.data)  # new data at /reference/event.path. None if deleted


firebase_admin.db.reference('sensor').listen(listener)