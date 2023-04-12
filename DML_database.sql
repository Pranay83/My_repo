
----
INSERT INTO Guest (GuestID, FirstName, LastName, EmailAddress, PhoneNumber, Address)
VALUES (6, 'Samuel', 'Barlow', 'samuelbarlow@email.com', 612863805, '3771 Rocket Drive');

INSERT INTO Reservation (ReservationID, CheckInDate, CheckOutDate, TotalPrice, GuestID, RoomNumber)
VALUES (5, '2023-04-15', '2023-04-18', 500.00, 1, 101);

----
UPDATE Room
SET PricePerNight = 150.00
WHERE RoomNumber = 101;

UPDATE Service
SET Description = 'A relaxing massage to help you unwind.'
WHERE ServiceID = 2;

--
DELETE FROM ServiceBooking
WHERE BookingID = 3;

---
SELECT * FROM Guest;

--
SELECT R.CheckInDate, R.CheckOutDate, R.TotalPrice, R.RoomNumber, RO.Capacity
FROM Reservation R INNER JOIN Room RO
ON R.RoomNumber = RO.RoomNumber;

SELECT SB.BookingDate, SB.TotalPrice, S.ServiceName, S.Description
FROM ServiceBooking SB LEFT JOIN Service S
ON SB.ServiceID = S.ServiceID;

--
SELECT AVG(PricePerNight)
FROM Room;


SELECT G.FirstName, G.LastName, COUNT(R.ReservationID) AS NumReservations
FROM Guest G LEFT JOIN Reservation R 
ON G.GuestID = R.GuestID
GROUP BY G.FirstName, G.LastName;

--
SELECT R.CheckInDate, R.CheckOutDate, R.TotalPrice, R.RoomNumber, RO.Capacity, RT.RoomTypeName
FROM Reservation R INNER JOIN Room RO
ON R.RoomNumber = RO.RoomNumber
INNER JOIN RoomType RT
ON RO.RoomTypeID = RT.RoomTypeID
INNER JOIN Guest G
ON R.GuestID = G.GuestID
WHERE G.LastName = 'Brown';

--
SELECT RT.RoomTypeName, SUM(R.TotalPrice) as TotalRevenue
FROM Reservation R INNER JOIN Room RO
ON R.RoomNumber = RO.RoomNumber
INNER JOIN RoomType RT
ON RO.RoomTypeID = RT.RoomTypeID
GROUP BY RT.RoomTypeName;


