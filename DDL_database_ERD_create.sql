-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-11 03:53:02.175

-- tables
-- Table: Guest
CREATE TABLE Guest (
    GuestID int  NOT NULL,
    FirstName char(15)  NOT NULL,
    LastName char(15)  NOT NULL,
    EmailAddress char(35)  NOT NULL,
    PhoneNumber int  NOT NULL,
    Address char(35)  NOT NULL,
    CONSTRAINT Guest_pk PRIMARY KEY (GuestID)
);

-- Table: Reservation
CREATE TABLE Reservation (
    ReservationID int  NOT NULL,
    CheckInDate date  NOT NULL,
    CheckOutDate date  NOT NULL,
    TotalPrice decimal(5,2)  NOT NULL,
    GuestID int  NOT NULL,
    RoomNumber int  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY (ReservationID)
);

-- Table: Room
CREATE TABLE Room (
    RoomNumber int  NOT NULL,
    Capacity int  NOT NULL,
    PricePerNight decimal(5,2)  NOT NULL,
    RoomTypeID int  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (RoomNumber)
);

-- Table: RoomType
CREATE TABLE RoomType (
    RoomTypeID int  NOT NULL,
    RoomTypeName char(25)  NOT NULL,
    Description char(45)  NOT NULL,
    CONSTRAINT RoomType_pk PRIMARY KEY (RoomTypeID)
);

-- Table: Service
CREATE TABLE Service (
    ServiceID int  NOT NULL,
    ServiceName char(25)  NOT NULL,
    Description char(45)  NOT NULL,
    Price decimal(5,2)  NOT NULL,
    CONSTRAINT Service_pk PRIMARY KEY (ServiceID)
);

-- Table: ServiceBooking
CREATE TABLE ServiceBooking (
    BookingID int  NOT NULL,
    BookingDate date  NOT NULL,
    TotalPrice decimal(5,2)  NOT NULL,
    GuestID int  NOT NULL,
    ServiceID int  NOT NULL,
    CONSTRAINT ServiceBooking_pk PRIMARY KEY (BookingID)
);

-- Table: Shift
CREATE TABLE Shift (
    ShiftID int  NOT NULL,
    StartTime char(15)  NOT NULL,
    EndTime char(15)  NOT NULL,
    StaffID int  NOT NULL,
    ServiceID int  NOT NULL,
    CONSTRAINT Shift_pk PRIMARY KEY (ShiftID)
);

-- Table: Staff
CREATE TABLE Staff (
    StaffID int  NOT NULL,
    FirstName char(25)  NOT NULL,
    LastName char(25)  NOT NULL,
    EmailAddress char(35)  NOT NULL,
    PhoneNumber int  NOT NULL,
    Position char(25)  NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY (StaffID)
);

-- foreign keys
-- Reference: Reservation_Guest (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Guest FOREIGN KEY Reservation_Guest (GuestID)
    REFERENCES Guest (GuestID);

-- Reference: Reservation_Room (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Room FOREIGN KEY Reservation_Room (RoomNumber)
    REFERENCES Room (RoomNumber);

-- Reference: Room_RoomType (table: Room)
ALTER TABLE Room ADD CONSTRAINT Room_RoomType FOREIGN KEY Room_RoomType (RoomTypeID)
    REFERENCES RoomType (RoomTypeID);

-- Reference: ServiceBooking_Guest (table: ServiceBooking)
ALTER TABLE ServiceBooking ADD CONSTRAINT ServiceBooking_Guest FOREIGN KEY ServiceBooking_Guest (GuestID)
    REFERENCES Guest (GuestID);

-- Reference: ServiceBooking_Service (table: ServiceBooking)
ALTER TABLE ServiceBooking ADD CONSTRAINT ServiceBooking_Service FOREIGN KEY ServiceBooking_Service (ServiceID)
    REFERENCES Service (ServiceID);

-- Reference: Shift_Service (table: Shift)
ALTER TABLE Shift ADD CONSTRAINT Shift_Service FOREIGN KEY Shift_Service (ServiceID)
    REFERENCES Service (ServiceID);

-- Reference: Shift_Staff (table: Shift)
ALTER TABLE Shift ADD CONSTRAINT Shift_Staff FOREIGN KEY Shift_Staff (StaffID)
    REFERENCES Staff (StaffID);

-- End of file.

