CREATE TABLE S20_5_Aircraft (
    aircraftNo INT,
    firstClass INT  NOT NULL, 
    Economy INT  NOT NULL,
    Business INT  NOT NULL,
    yearOfManufacture INT  NOT NULL,
    Company varchar2(255)  NOT NULL,
    PRIMARY KEY (aircraftNo)
);

CREATE TABLE S20_5_Airport (
    airportCode INT,
    airportName varchar2(255) NOT NULL, 
    city varchar2(255) NOT NULL, 
    PRIMARY KEY (airportCode)
);

CREATE TABLE S20_5_Employee (
    employeeID INT NOT NULL,
    airportCode INT,
    firstName varchar2(255) NOT NULL, 
    lastName varchar2(255) NOT NULL,
    jobType varchar2(255) NOT NULL,
    emailID varchar2(255) NOT NULL,
    phoneNum varchar2(15) NOT NULL,
    dateofbirth DATE NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender = 'm' or gender = 'f'),
    FOREIGN KEY(airportCode) REFERENCES S20_5_Airport(airportCode),
    PRIMARY KEY (employeeID)
);

CREATE TABLE S20_5_Passanger (
    PassangerID INT NOT NULL,
    firstName varchar2(255) NOT NULL, 
    lastName varchar2(255) NOT NULL,
    emailID varchar2(255) NOT NULL,
    phoneNum varchar2(15) NOT NULL,
    dateofbirth DATE,
    gender CHAR(1) NOT NULL CHECK (gender = 'm' or gender = 'f'), 
    PRIMARY KEY (PassangerID)
);

CREATE TABLE S20_5_Flight_Schedule (
    FlightID INT NOT NULL,
    FlightAircraftNo INT ,
    departualAirportCode INT ,
    arrivalAirportCode INT ,
    arrivalTime TIMESTAMP ,
    departureTime TIMESTAMP ,
    PRIMARY KEY (FlightID),
    FOREIGN KEY(FlightAircraftNo) REFERENCES S20_5_Aircraft(aircraftNo),
    FOREIGN KEY(departualAirportCode) REFERENCES S20_5_Airport(airportCode),
    FOREIGN KEY(arrivalAirportCode) REFERENCES S20_5_Airport(airportCode)
);

CREATE TABLE S20_5_Booking (
    PassangerID INT NOT NULL,
    FlightID INT NOT NULL,
    Pnr	INT NOT NULL,
    Airfare	INT NOT NULL,
    ClassOfTravel varchar2(20),
    bookingDate DATE,
    PRIMARY KEY(Pnr),
    FOREIGN KEY(PassangerID) REFERENCES S20_5_Passanger(PassangerID),
    FOREIGN KEY(FlightID) REFERENCES S20_5_Flight_Schedule(FlightID)
);
CREATE TABLE S20_5_WorksOn (
    employeeID INT NOT NULL,
    FlightID INT NOT NULL,
    FOREIGN KEY(employeeID) REFERENCES S20_5_Employee(employeeID),
    FOREIGN KEY(FlightID) REFERENCES S20_5_Flight_Schedule(FlightID)
);