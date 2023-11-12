import serial

gps = serial.Serial('COM3', baudrate=9600)

while True:
    ser_bytes = gps.readline()
    decoded_bytes = ser_bytes.decode("utf-8")
    data = decoded_bytes.split(",")

    if data[0] == "$GPGGA":  # Check for GGA (Global Positioning System Fix Data) sentence
        if data[2] != '' and data[4] != '' and data[3] != '' and data[5] != '':
            latitude = float(data[2][:2]) + float(data[2][2:]) / 60.0
            if data[3] == 'S':
                latitude = -latitude
                
            longitude = float(data[4][:3]) + float(data[4][3:]) / 60.0
            if data[5] == 'W':
                longitude = -longitude
                
            print("Latitude: {}, Longitude: {}".format(latitude, longitude))
