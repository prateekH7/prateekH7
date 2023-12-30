CREATE DATABASE los_dulces_suenos_resort;

USE los_dulces_suenos_resort;

-- Create the Manager table
CREATE TABLE Manager (
    employeeID INT PRIMARY KEY,
    `name` VARCHAR(40),
    position VARCHAR(40),
	CHECK (position IN (
            'General Manager', 'Rooms Manager', 'Housekeeping Manager',
            'Restaurant Manager', 'Front Office Manager', 'Valet Manager',
            'IT Manager', 'Facilities Manager'
        )
	)
);

CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    `name` VARCHAR(40),
    employeeID INT,
    FOREIGN KEY (employeeID) REFERENCES Manager(employeeID),
    CHECK (
        `name` IN ('Facility', 'Office', 'Housekeeping', 'Restaurant', 'Security')
    )
);

CREATE TABLE Hotel (
    hotelID INT PRIMARY KEY,
    hotelName VARCHAR(40),
    capacity INT, 
    employeeID INT,
    check (capacity <= 250),
    FOREIGN KEY (employeeID) REFERENCES Manager(employeeID)
);

CREATE TABLE AffiliatedWith (
    employeeID INT PRIMARY KEY,
    hotelName VARCHAR(60),
    deptID INT,
    FOREIGN KEY (employeeID) REFERENCES Hotel(employeeID),
    FOREIGN KEY (hotelName) REFERENCES Hotel(hotelName),
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

CREATE TABLE Room (
    roomID INT PRIMARY KEY,
    roomType VARCHAR(40),
	CHECK ( roomType IN ('King', 'Double Queen', 'Double Queen Accessible'))
);

CREATE TABLE Guest (
    guestID INT PRIMARY KEY,
    `name` VARCHAR(40),
    address VARCHAR(100),
    phone VARCHAR(16),
    roomID INT,
    FOREIGN KEY (roomID) REFERENCES Room(roomID)
);


CREATE TABLE Staff (
    employeeID INT PRIMARY KEY,
    `name` VARCHAR(40),
    position VARCHAR(40),
	CHECK ( position IN (
            'Front Desk Clerk', 'Concierge', 'Housekeeper',
            'Valet', 'Chef', 'Server', 'Security Officer'
        )
    )
);

CREATE TABLE Amenity (
    amenityID INT PRIMARY KEY,
    amenityType VARCHAR(30),
    amenityName VARCHAR(40),
    CHECK ( amenityType IN ('Consumable', 'Return')),
    CHECK ( amenityName IN (
            'Pillow', 'Blanket', 'Iron', 'Robe',
            'Hair Dryer', 'Toiletries'
        )
    )
);

CREATE TABLE Delivers (
    employeeID INT,
    guestID INT,
    amenityID INT,
    deliveryDateTime DATETIME,
    quantity INT, 
    CHECK (quantity <= 5),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (amenityID) REFERENCES Amenity(amenityID)
);

CREATE TABLE Stay (
    stayID INT,
    guestID INT,
    roomID INT,
    startDate DATE,
    endDate DATE,
    PRIMARY KEY(stayID, guestID),
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (roomID) REFERENCES Room(roomID)
);

CREATE TABLE Rental (
    guestID INT,
    itemName VARCHAR(40),
    stayID INT,
    eventDate DATE,
    employeeID INT,
    PRIMARY KEY (guestID, itemName, stayID),
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (stayID) REFERENCES Stay(stayID),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    CHECK ( itemName IN (
            'Golf clubs', 'Tennis racket', 'Bicycle', 'Golf cart', 'Games', 'Movies'
        )
    )
);

CREATE TABLE OnCall (
    employeeID INT,
    startDate DATE,
    endDate DATE,
    PRIMARY KEY(employeeID, startDate, endDate),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID)
);

CREATE TABLE Reservation (
    reserveID INT PRIMARY KEY,
    guestID INT,
    employeeID INT,
    startDateTime DATETIME,
    endDateTime DATETIME,
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID)
);








