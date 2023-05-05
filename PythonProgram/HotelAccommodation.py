# header file for mysql
import mysql.connector
# database connection 
mydb = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'root',
    port = '3306',
    database = 'HotelAccommodation'
)

print("\n\n---- Welcome to HotelAccommodation System ---- \n")
# print Guest table 
mycursor = mydb.cursor()
mycursor.execute("select * from Guest")
gue = mycursor.fetchall()
print("\n--------------------------------------")
print("Guest Table Values:")
with open('Guest.txt','w') as f:
    for Guest in gue:
        f.write(str(Guest))
        f.write('\n')
        # display the text file
        print(Guest)
print("--------------------------------------")

# print RoomType table 
mycursor = mydb.cursor()
mycursor.execute("select * from RoomType")
Rot = mycursor.fetchall()
print("\n--------------------------------------")
print("Room Type Table Values:")
with open('RoomType.txt','w') as f:
    for RoomType in Rot:
        f.write(str(RoomType))
        f.write('\n')
        # display the text file
        print(RoomType)
print("--------------------------------------")


# print Room table 
mycursor = mydb.cursor()
mycursor.execute("select * from Room")
Ro = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Room Table Values:")
# save the values in text file
with open('Room.txt','w') as f:
    for Room in Ro:
        f.write(str(Room))
        f.write('\n')
        # display the text file
        print(Room)
print("--------------------------------------")

# print Reservation table 
mycursor = mydb.cursor()
mycursor.execute("select * from Reservation")
Rese = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Reservation Values:")
# save the values in text file
with open('Reservation.txt','w') as f:
    for Reservation in Rese:
        f.write(str(Reservation))
        f.write('\n')
        # display the text file
        print(Reservation)
print("--------------------------------------")


# print Service table 
mycursor = mydb.cursor()
mycursor.execute("select * from Service")
Ser = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Service Values:")
# save the values in text file
with open('Service.txt','w') as f:
    for Service in Ser:
        f.write(str(Service))
        f.write('\n')
        # display the text file
        print(Service)
print("--------------------------------------")


# print ServiceBooking table 
mycursor = mydb.cursor()
mycursor.execute("select * from ServiceBooking")
SerBok = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Service Booking Values:")
# save the values in text file
with open('ServiceBooking.txt','w') as f:
    for ServiceBooking in SerBok:
        f.write(str(ServiceBooking))
        f.write('\n')
        # display the text file
        print(ServiceBooking)
print("--------------------------------------")


# print Staff table 
mycursor = mydb.cursor()
mycursor.execute("select * from Staff")
Stf = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Staff Values:")
# save the values in text file
with open('Staff.txt','w') as f:
    for Staff in Stf:
        f.write(str(Staff))
        f.write('\n')
        # display the text file
        print(Staff)
print("--------------------------------------")

# print Shift table 
mycursor = mydb.cursor()
mycursor.execute("select * from Shift")
Sft = mycursor.fetchall()
print("\n--------------------------------------")
#print heading
print("Shift Values:")
# save the values in text file
with open('Sft.txt','w') as f:
    for Shift in Stf:
        f.write(str(Shift))
        f.write('\n')
        # display the text file
        print(Shift)
print("--------------------------------------")







