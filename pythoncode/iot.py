
import firebase_admin # type: ignore
from firebase_admin import credentials, db # type: ignore
import json


# This for Rasspry pi 
import time
# import adafruit_dht
# import board   #for rassprt GPIO




# Sensor data pin is connected to GPIO 4
# Uncomment for DHT11
#sensor = adafruit_dht.DHT11(board.D4)



# Fetch Google Firebase Database via json file 
cred = credentials.Certificate('firebasConfigration/firebase-adminsdk.json')
firebase_admin.initialize_app(cred, { 'databaseURL': "https://research-143-default-rtdb.firebaseio.com/"})


def listener(event):
    print(' ---------------------------------------------------- ')
    print('Firebase event detected: ')
    # print(event.event_type)  # can be 'put' or 'patch'
    # print( event.path )  # relative to the reference, it seems
    print(event.data)  # new data at /reference/event.path. None if deleted

    y = json.loads(json.dumps(event.data)) 
 
    print("Fan:> " , y["fan"])
    print("Light:> ", y["light"] )
    print("Water Pump:> ", y ["waterpump"] )
    print("Air Humdity:> ", y ["air_humdity"] )
    print("Soail Humdity:> ", y ["soail_humdity"] )
    print("Temperature:> ", y ["temperature"] )


    # while True:
    #     try:
    #         # Print the values to the serial port
    #         temperature_c = sensor.temperature
    #         temperature_f = temperature_c * (9 / 5) + 32
    #         humidity = sensor.humidity
    #         print("Temp={0:0.1f}ºC, Temp={1:0.1f}ºF, Humidity={2:0.1f}%".format(temperature_c, temperature_f, humidity))

    #     except RuntimeError as error:
    #         # Errors happen fairly often, DHT's are hard to read, just keep going
    #         print(error.args[0])
    #         time.sleep(2.0)
    #         continue
    #     except Exception as error:
    #         sensor.exit()
    #         raise error
    #     time.sleep(3.0)


firebase_admin.db.reference('sensor').listen(listener)