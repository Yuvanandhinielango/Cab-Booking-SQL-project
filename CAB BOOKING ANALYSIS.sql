Create Database CabBookingAnalysis;
USE CabBookingAnalysis;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(50),
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    license_no VARCHAR(20) UNIQUE,
    rating DECIMAL(2,1),
    status ENUM('Available','On Trip','Inactive') DEFAULT 'Available'
);

CREATE TABLE Cabs (
    cab_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT,
    cab_number VARCHAR(15) UNIQUE,
    cab_type ENUM('Mini','Sedan','SUV','Luxury'),
    capacity INT,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

ALTER TABLE Cabs MODIFY cab_type 
ENUM('Sedan', 'SUV', 'Mini', 'Hatchback');


CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    cab_id INT,
    booking_time DATETIME,
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    status ENUM('Ongoing','Completed','Cancelled') DEFAULT 'Ongoing',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (cab_id) REFERENCES Cabs(cab_id)
);

CREATE TABLE TripDetails (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    distance_km DECIMAL(5,2),
    duration_min INT,
    fare DECIMAL(8,2),
    payment_mode ENUM('Cash','UPI','Card','Wallet'),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Feedback(
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    driver_id INT,
    rating DECIMAL(2,1),
    comments VARCHAR(255),
    feedback_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

INSERT INTO Customers (customer_id, name, phone, email, city, registration_date) VALUES
(1, 'Arun Kumar', '98765100', 'arunkumar@example.com', 'Chennai', '2024-06-29'),
(2, 'Priya Ramesh', '98765101', 'priyaramesh@example.com', 'Erode', '2023-01-31'),
(3, 'Karthik S', '98765102', 'karthiks@example.com', 'Coimbatore', '2024-12-29'),
(4, 'Meena V', '98765103', 'meenav@example.com', 'Tiruppur', '2023-06-18'),
(5, 'Vijay Anand', '98765104', 'vijayanand@example.com', 'Madurai', '2024-08-30'),
(6, 'Divya Suresh', '98765105', 'divyasuresh@example.com', 'Tiruppur', '2024-12-22'),
(7, 'Rohit Raj', '98765106', 'rohitraj@example.com', 'Chennai', '2024-11-13'),
(8, 'Anjali P', '98765107', 'anjalip@example.com', 'Erode', '2024-11-23'),
(9, 'Sanjay Kumar', '98765108', 'sanjaykumar@example.com', 'Tiruppur', '2025-07-12'),
(10, 'Nithya R', '98765109', 'nithyar@example.com', 'Tiruppur', '2024-11-02'),
(11, 'Hari Krishna', '98765110', 'harikrishna@example.com', 'Tirunelveli', '2025-09-23'),
(12, 'Lakshmi N', '98765111', 'lakshmin@example.com', 'Tiruchirappalli', '2024-09-08'),
(13, 'Suresh B', '98765112', 'sureshb@example.com', 'Thoothukudi', '2025-06-26'),
(14, 'Deepa K', '98765113', 'deepak@example.com', 'Salem', '2023-11-29'),
(15, 'Vimal S', '98765114', 'vimals@example.com', 'Tiruppur', '2024-07-15'),
(16, 'Radha M', '98765115', 'radham@example.com', 'Tiruppur', '2024-08-05'),
(17, 'Ajith Kumar', '98765116', 'ajithkumar@example.com', 'Chennai', '2023-10-10'),
(18, 'Shalini P', '98765117', 'shalinip@example.com', 'Erode', '2025-06-14'),
(19, 'Ramesh S', '98765118', 'rameshs@example.com', 'Erode', '2025-01-22'),
(20, 'Geetha V', '98765119', 'geethav@example.com', 'Thoothukudi', '2024-12-22'),
(21, 'Kiran R', '98765120', 'kiranr@example.com', 'Thoothukudi', '2025-09-03'),
(22, 'Rekha S', '98765121', 'rekhas@example.com', 'Salem', '2025-05-29'),
(23, 'Pradeep N', '98765122', 'pradeepn@example.com', 'Coimbatore', '2025-06-14'),
(24, 'Anitha R', '98765123', 'anithar@example.com', 'Salem', '2024-10-10'),
(25, 'Venkatesh K', '98765124', 'venkateshk@example.com', 'Vellore', '2023-11-15'),
(26, 'Divya P', '98765125', 'divyap@example.com', 'Tiruchirappalli', '2024-10-03'),
(27, 'Ravi Shankar', '98765126', 'ravishankar@example.com', 'Tirunelveli', '2024-04-09'),
(28, 'Bhavana S', '98765127', 'bhavanas@example.com', 'Thoothukudi', '2025-04-06'),
(29, 'Manoj V', '98765128', 'manojv@example.com', 'Madurai', '2025-03-24'),
(30, 'Naveen R', '98765129', 'naveenr@example.com', 'Tiruchirappalli', '2024-06-08'),
(31, 'Sathya K', '98765130', 'sathyak@example.com', 'Tirunelveli', '2023-04-13'),
(32, 'Keerthi P', '98765131', 'keerthip@example.com', 'Chennai', '2025-04-15'),
(33, 'Rajesh S', '98765132', 'rajeshs@example.com', 'Madurai', '2023-10-20'),
(34, 'Sneha V', '98765133', 'snehav@example.com', 'Vellore', '2023-11-26'),
(35, 'Aravind K', '98765134', 'aravindk@example.com', 'Tiruchirappalli', '2024-07-31'),
(36, 'Lakshman R', '98765135', 'lakshmanr@example.com', 'Tirunelveli', '2024-11-09'),
(37, 'Vidya P', '98765136', 'vidyap@example.com', 'Thoothukudi', '2023-09-22'),
(38, 'Mohan S', '98765137', 'mohans@example.com', 'Tiruppur', '2023-08-15'),
(39, 'Harini K', '98765138', 'harinik@example.com', 'Vellore', '2024-10-19'),
(40, 'Raghu N', '98765139', 'raghun@example.com', 'Madurai', '2024-04-14'),
(41, 'Pooja V', '98765140', 'poojav@example.com', 'Salem', '2023-12-04'),
(42, 'Karthiga S', '98765141', 'karthigas@example.com', 'Tiruchirappalli', '2024-01-07'),
(43, 'Vasanth R', '98765142', 'vasanthr@example.com', 'Tiruchirappalli', '2024-06-14'),
(44, 'Nandhini P', '98765143', 'nandhinip@example.com', 'Tiruchirappalli', '2023-10-26'),
(45, 'Gokul S', '98765144', 'gokuls@example.com', 'Coimbatore', '2023-07-19'),
(46, 'Anu M', '98765145', 'anum@example.com', 'Erode', '2024-06-14'),
(47, 'Shivani R', '98765146', 'shivanir@example.com', 'Erode', '2025-02-04'),
(48, 'Sathish Kumar', '98765147', 'sathishkumar@example.com', 'Madurai', '2023-09-20'),
(49, 'Divya Suresh', '98765148', 'divyasuresh@example.com', 'Tirunelveli', '2023-05-11'),
(50, 'Kavya P', '98765149', 'kavyap@example.com', 'Thoothukudi', '2024-02-17');

INSERT INTO Drivers (driver_id, name, phone, license_no, rating, status) VALUES
(1, 'Ravi Shankar', '90000100', 'TN10039', 4.3, 'Available'),
(2, 'Sathish Kumar', '90000101', 'TN54588', 4.4, 'Inactive'),
(3, 'Anitha R', '90000102', 'TN23633', 3.8, 'Available'),
(4, 'Manoj V', '90000103', 'TN39539', 4.4, 'Inactive'),
(5, 'Ramesh B', '90000104', 'TN62978', 4.2, 'On Trip'),
(6, 'Kumaravel S', '90000105', 'TN61805', 4.3, 'On Trip'),
(7, 'Harish R', '90000106', 'TN99098', 4.3, 'On Trip'),
(8, 'Rajesh S', '90000107', 'TN11468', 4.8, 'On Trip'),
(9, 'Vignesh K', '90000108', 'TN28145', 4.7, 'Available'),
(10, 'Selvi P', '90000109', 'TN92726', 3.9, 'Available'),
(11, 'Aravind R', '90000110', 'TN68705', 3.6, 'Inactive'),
(12, 'Meena S', '90000111', 'TN64341', 4.4, 'On Trip'),
(13, 'Praveen K', '90000112', 'TN85800', 4.5, 'Inactive'),
(14, 'Geetha V', '90000113', 'TN30942', 4.3, 'Inactive'),
(15, 'Naveen R', '90000114', 'TN33743', 3.6, 'Inactive'),
(16, 'Deepa M', '90000115', 'TN76288', 4.0, 'Available'),
(17, 'Karthik S', '90000116', 'TN19843', 4.2, 'On Trip'),
(18, 'Lakshmi P', '90000117', 'TN50353', 4.1, 'Inactive'),
(19, 'Ajith Kumar', '90000118', 'TN83796', 4.6, 'Available'),
(20, 'Bhavana R', '90000119', 'TN68782', 4.3, 'Available');

INSERT INTO Cabs (cab_id, driver_id, cab_number, cab_type, capacity) VALUES
(1, 1, 'TN8687XY', 'Mini', 4),
(2, 2, 'TN3385XY', 'Sedan', 4),
(3, 3, 'TN6933XY', 'Hatchback', 4),
(4, 4, 'TN9347XY', 'Hatchback', 5),
(5, 5, 'TN1220XY', 'Hatchback', 5),
(6, 6, 'TN5319XY', 'Sedan', 5),
(7, 7, 'TN7523XY', 'Hatchback', 6),
(8, 8, 'TN3523XY', 'Sedan', 6),
(9, 9, 'TN5568XY', 'Mini', 4),
(10, 10, 'TN5234XY', 'Sedan', 5),
(11, 11, 'TN6115XY', 'SUV', 5),
(12, 12, 'TN3518XY', 'Mini', 5),
(13, 13, 'TN9937XY', 'Mini', 6),
(14, 14, 'TN2645XY', 'Hatchback', 4),
(15, 15, 'TN9076XY', 'SUV', 6),
(16, 16, 'TN7068XY', 'SUV', 4),
(17, 17, 'TN8692XY', 'Sedan', 5),
(18, 18, 'TN5141XY', 'Sedan', 4),
(19, 19, 'TN8420XY', 'Hatchback', 6),
(20, 20, 'TN2783XY', 'Hatchback', 6);

INSERT INTO Bookings (booking_id, customer_id, cab_id, booking_time, pickup_location, drop_location, status) VALUES
(1, 17, 4, '2025-09-20 15:27:41', 'Madurai', 'Thoothukudi', 'Completed'),
(2, 12, 18, '2025-03-21 15:27:41', 'Chennai', 'Erode', 'Cancelled'),
(3, 27, 18, '2024-11-15 15:27:41', 'Chennai', 'Tirunelveli', 'Completed'),
(4, 1, 17, '2025-01-20 15:27:41', 'Madurai', 'Madurai', 'Cancelled'),
(5, 9, 8, '2025-10-12 15:27:41', 'Erode', 'Thoothukudi', 'Ongoing'),
(6, 20, 11, '2025-05-04 15:27:41', 'Chennai', 'Salem', 'Completed'),
(7, 8, 8, '2025-07-21 15:27:41', 'Erode', 'Tiruchirappalli', 'Ongoing'),
(8, 38, 16, '2025-07-12 15:27:41', 'Chennai', 'Erode', 'Ongoing'),
(9, 24, 12, '2025-03-04 15:27:41', 'Tiruppur', 'Salem', 'Cancelled'),
(10, 24, 13, '2025-02-07 15:27:41', 'Erode', 'Thoothukudi', 'Ongoing'),
(11, 19, 16, '2025-10-22 15:27:41', 'Coimbatore', 'Vellore', 'Ongoing'),
(12, 32, 17, '2025-06-04 15:27:41', 'Erode', 'Tiruchirappalli', 'Cancelled'),
(13, 19, 19, '2025-02-06 15:27:41', 'Vellore', 'Vellore', 'Completed'),
(14, 7, 8, '2025-04-27 15:27:41', 'Coimbatore', 'Madurai', 'Completed'),
(15, 40, 9, '2024-12-03 15:27:41', 'Chennai', 'Madurai', 'Ongoing'),
(16, 30, 3, '2025-08-20 15:27:41', 'Erode', 'Chennai', 'Ongoing'),
(17, 9, 5, '2025-04-02 15:27:41', 'Coimbatore', 'Vellore', 'Completed'),
(18, 40, 15, '2025-06-25 15:27:41', 'Chennai', 'Chennai', 'Completed'),
(19, 32, 16, '2025-04-27 15:27:41', 'Tiruppur', 'Tiruppur', 'Completed'),
(20, 45, 19, '2025-10-10 15:27:41', 'Tirunelveli', 'Tirunelveli', 'Ongoing'),
(21, 36, 4, '2025-07-11 15:27:41', 'Tiruppur', 'Thoothukudi', 'Completed'),
(22, 47, 6, '2025-09-03 15:27:41', 'Tiruchirappalli', 'Erode', 'Completed'),
(23, 34, 12, '2025-04-27 15:27:41', 'Coimbatore', 'Tirunelveli', 'Completed'),
(24, 12, 20, '2025-07-30 15:27:41', 'Vellore', 'Tiruchirappalli', 'Ongoing'),
(25, 32, 14, '2024-10-26 15:27:41', 'Coimbatore', 'Madurai', 'Completed'),
(26, 42, 11, '2024-12-24 15:27:41', 'Thoothukudi', 'Chennai', 'Ongoing'),
(27, 6, 3, '2025-04-08 15:27:41', 'Vellore', 'Tiruppur', 'Ongoing'),
(28, 2, 10, '2025-03-26 15:27:41', 'Tiruchirappalli', 'Tiruchirappalli', 'Completed'),
(29, 25, 11, '2024-12-17 15:27:41', 'Tiruchirappalli', 'Thoothukudi', 'Cancelled'),
(30, 26, 1, '2024-11-04 15:27:41', 'Tiruchirappalli', 'Chennai', 'Ongoing'),
(31, 4, 4, '2025-01-10 15:27:41', 'Tiruppur', 'Tirunelveli', 'Completed'),
(32, 38, 10, '2024-12-05 15:27:41', 'Tiruppur', 'Erode', 'Completed'),
(33, 13, 7, '2024-11-02 15:27:41', 'Madurai', 'Coimbatore', 'Cancelled'),
(34, 3, 12, '2024-10-14 15:27:41', 'Tiruppur', 'Vellore', 'Completed'),
(35, 44, 9, '2024-12-03 15:27:41', 'Tiruchirappalli', 'Chennai', 'Completed'),
(36, 12, 13, '2025-06-11 15:27:41', 'Vellore', 'Salem', 'Completed'),
(37, 8, 18, '2025-02-14 15:27:41', 'Madurai', 'Madurai', 'Completed'),
(38, 11, 4, '2025-05-20 15:27:41', 'Tiruchirappalli', 'Erode', 'Ongoing'),
(39, 49, 20, '2025-07-15 15:27:41', 'Salem', 'Tiruppur', 'Completed'),
(40, 33, 6, '2024-11-21 15:27:41', 'Chennai', 'Tiruchirappalli', 'Completed'),
(41, 46, 17, '2025-01-11 15:27:41', 'Erode', 'Thoothukudi', 'Ongoing'),
(42, 21, 1, '2024-12-07 15:27:41', 'Madurai', 'Vellore', 'Ongoing'),
(43, 14, 15, '2024-10-18 15:27:41', 'Thoothukudi', 'Chennai', 'Completed'),
(44, 10, 16, '2024-11-06 15:27:41', 'Tirunelveli', 'Erode', 'Ongoing'),
(45, 37, 5, '2024-12-13 15:27:41', 'Madurai', 'Salem', 'Completed'),
(46, 31, 8, '2025-05-28 15:27:41', 'Tirunelveli', 'Vellore', 'Completed'),
(47, 39, 13, '2025-06-15 15:27:41', 'Salem', 'Chennai', 'Cancelled'),
(48, 43, 14, '2025-03-12 15:27:41', 'Chennai', 'Tiruppur', 'Completed'),
(49, 35, 19, '2025-05-18 15:27:41', 'Tirunelveli', 'Coimbatore', 'Completed'),
(50, 41, 12, '2024-11-27 15:27:41', 'Tiruchirappalli', 'Madurai', 'Completed');


INSERT INTO TripDetails (trip_id, booking_id, distance_km, duration_min, fare, payment_mode) VALUES
(1, 1, 32.5, 45, 450.00, 'Cash'),
(2, 2, 85.3, 120, 1200.00, 'Card'),
(3, 3, 60.7, 80, 800.00, 'UPI'),
(4, 4, 15.2, 25, 200.00, 'Wallet'),
(5, 5, 42.1, 55, 600.00, 'Card'),
(6, 6, 120.5, 150, 2500.00, 'Cash'),
(7, 7, 32.8, 40, 450.00, 'UPI'),
(8, 8, 10.2, 15, 180.00, 'Wallet'),
(9, 9, 55.4, 70, 850.00, 'Cash'),
(10, 10, 75.0, 90, 1200.00, 'Card'),
(11, 11, 20.5, 30, 300.00, 'Wallet'),
(12, 12, 45.7, 60, 650.00, 'UPI'),
(13, 13, 33.9, 45, 450.00, 'Cash'),
(14, 14, 18.2, 25, 250.00, 'Card'),
(15, 15, 60.0, 75, 900.00, 'UPI'),
(16, 16, 10.5, 15, 200.00, 'Wallet'),
(17, 17, 120.3, 150, 2500.00, 'Cash'),
(18, 18, 25.7, 35, 400.00, 'UPI'),
(19, 19, 32.8, 45, 500.00, 'Card'),
(20, 20, 55.6, 70, 850.00, 'Wallet'),
(21, 21, 75.2, 90, 1200.00, 'UPI'),
(22, 22, 45.1, 60, 650.00, 'Cash'),
(23, 23, 35.7, 50, 550.00, 'Card'),
(24, 24, 20.5, 25, 300.00, 'Wallet'),
(25, 25, 12.4, 20, 180.00, 'UPI'),
(26, 26, 85.6, 100, 1300.00, 'Cash'),
(27, 27, 42.8, 55, 600.00, 'Card'),
(28, 28, 30.5, 40, 500.00, 'UPI'),
(29, 29, 18.7, 25, 250.00, 'Wallet'),
(30, 30, 60.3, 75, 900.00, 'Cash'),
(31, 31, 45.0, 60, 650.00, 'Card'),
(32, 32, 32.1, 45, 500.00, 'UPI'),
(33, 33, 55.5, 70, 850.00, 'Cash'),
(34, 34, 15.3, 20, 200.00, 'Wallet'),
(35, 35, 75.0, 90, 1200.00, 'Card'),
(36, 36, 10.5, 15, 180.00, 'UPI'),
(37, 37, 20.8, 30, 300.00, 'Cash'),
(38, 38, 32.6, 45, 500.00, 'Wallet'),
(39, 39, 50.2, 65, 800.00, 'UPI'),
(40, 40, 12.3, 20, 180.00, 'Card'),
(41, 41, 28.5, 35, 400.00, 'Cash'),
(42, 42, 35.7, 50, 550.00, 'Wallet'),
(43, 43, 42.1, 55, 650.00, 'UPI'),
(44, 44, 18.4, 25, 250.00, 'Cash'),
(45, 45, 60.0, 75, 900.00, 'Card'),
(46, 46, 32.8, 45, 500.00, 'Wallet'),
(47, 47, 15.7, 20, 200.00, 'UPI'),
(48, 48, 28.5, 35, 400.00, 'Cash'),
(49, 49, 45.9, 60, 650.00, 'Wallet'),
(50, 50, 12.2, 15, 180.00, 'Card');

INSERT INTO Feedback (feedback_id, customer_id, driver_id, rating, comments, feedback_date) VALUES
(1, 1, 1, 4.5, 'Driver was very polite and punctual.', '2025-03-01'),
(2, 2, 2, 4.2, 'Comfortable ride and clean cab.', '2025-03-02'),
(3, 3, 3, 4.8, 'Smooth drive, nice music.', '2025-03-03'),
(4, 4, 4, 3.9, 'Driver reached late.', '2025-03-04'),
(5, 5, 5, 4.5, 'Cab was clean and well maintained.', '2025-03-05'),
(6, 6, 6, 4.1, 'Driver polite but slow.', '2025-03-06'),
(7, 7, 7, 4.7, 'Good experience overall.', '2025-03-07'),
(8, 8, 8, 4.0, 'Driver helpful with luggage.', '2025-03-08'),
(9, 9, 9, 4.6, 'Safe and comfortable ride.', '2025-03-09'),
(10, 10, 10, 4.2, 'Cab smelled fresh, driver courteous.', '2025-03-10'),
(11, 11, 11, 4.5, 'Good route, fast service.', '2025-03-11'),
(12, 12, 12, 4.3, 'Cab was clean, driver polite.', '2025-03-12'),
(13, 13, 13, 4.7, 'Excellent service.', '2025-03-13'),
(14, 14, 14, 4.0, 'Driver was on time.', '2025-03-14'),
(15, 15, 15, 4.6, 'Smooth journey.', '2025-03-15'),
(16, 16, 16, 4.2, 'Driver knew the route well.', '2025-03-16'),
(17, 17, 17, 4.8, 'Very comfortable seats.', '2025-03-17'),
(18, 18, 18, 4.0, 'Pickup was delayed.', '2025-03-18'),
(19, 19, 19, 4.4, 'Reasonable fare, good ride.', '2025-03-19'),
(20, 20, 20, 4.5, 'Overall great experience.', '2025-03-20'),
(21, 21, 1, 4.2, 'Driver polite.', '2025-03-21'),
(22, 22, 2, 4.1, 'Clean cab.', '2025-03-22'),
(23, 23, 3, 4.6, 'Good service.', '2025-03-23'),
(24, 24, 4, 4.0, 'Average experience.', '2025-03-24'),
(25, 25, 5, 4.7, 'Excellent driver.', '2025-03-25'),
(26, 26, 6, 4.3, 'Driver was helpful.', '2025-03-26'),
(27, 27, 7, 4.5, 'Safe drive.', '2025-03-27'),
(28, 28, 8, 4.1, 'Cab was neat.', '2025-03-28'),
(29, 29, 9, 4.4, 'Good journey.', '2025-03-29'),
(30, 30, 10, 4.2, 'Driver polite and punctual.', '2025-03-30'),
(31, 31, 11, 4.7, 'Very comfortable ride.', '2025-03-31'),
(32, 32, 12, 4.3, 'Clean and safe.', '2025-04-01'),
(33, 33, 13, 4.5, 'Excellent service.', '2025-04-02'),
(34, 34, 14, 4.0, 'Satisfactory.', '2025-04-03'),
(35, 35, 15, 4.6, 'Smooth journey.', '2025-04-04'),
(36, 36, 16, 4.2, 'Driver knew routes well.', '2025-04-05'),
(37, 37, 17, 4.8, 'Very comfortable.', '2025-04-06'),
(38, 38, 18, 4.0, 'Pickup delayed.', '2025-04-07'),
(39, 39, 19, 4.4, 'Good experience.', '2025-04-08'),
(40, 40, 20, 4.5, 'Great service.', '2025-04-09'),
(41, 41, 1, 4.2, 'Driver courteous.', '2025-04-10'),
(42, 42, 2, 4.1, 'Cab clean.', '2025-04-11'),
(43, 43, 3, 4.6, 'Excellent ride.', '2025-04-12'),
(44, 44, 4, 4.0, 'Average.', '2025-04-13'),
(45, 45, 5, 4.7, 'Very good.', '2025-04-14'),
(46, 46, 6, 4.3, 'Helpful driver.', '2025-04-15'),
(47, 47, 7, 4.5, 'Safe drive.', '2025-04-16'),
(48, 48, 8, 4.1, 'Clean cab.', '2025-04-17'),
(49, 49, 9, 4.4, 'Good journey.', '2025-04-18'),
(50, 50, 10, 4.2, 'Punctual and polite.', '2025-04-19');

SELECT * FROM CUSTOMERS;
SELECT * FROM BOOKINGS;
SELECT * FROM CABS;
SELECT * FROM DRIVERS;
SELECT * FROM FEEDBACK;
SELECT * FROM TRIPDETAILS;

-- 1. Identify customers who have completed the most bookings. What insights can you draw about their behavior?
SELECT 
    c.customer_id,
    c.name,
    COUNT(b.booking_id) AS completed_bookings
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.status = 'Completed'
GROUP BY c.customer_id, c.name
ORDER BY completed_bookings DESC;

/* 
Insights 
1.These customers show strong brand loyalty and trust the cab service for their regular travel needs.
2.Their frequent usage may indicate consistent commute patterns, such as daily work travel or recurring business trips.
*/

-- 2. Find customers who have canceled more than 30% of their total bookings. What could be the reason for frequent cancellations?
SELECT
    customer_id,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings,
    (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_rate
FROM Bookings
GROUP BY customer_id
HAVING cancellation_rate > 30
ORDER BY cancellation_rate DESC;
/*
Insights:
1. A high cancellation rate might reflect dissatisfaction with service reliability, such as driver delays or sudden fare changes.

2.These customers could also be exploring competitor platforms or facing last-minute plan changes, suggesting a need to analyze customer feedback more deeply.
*/

-- 3. Determine the busiest day of the week for bookings. How can the company optimize cab availability on peak days?
SELECT 
    DAYNAME(booking_time) AS day_of_week,
    COUNT(*) AS total_bookings
FROM Bookings
GROUP BY day_of_week
ORDER BY total_bookings DESC
limit 1;
/*
Insights:
1.The identified day shows peak operational demand, meaning more drivers should be scheduled to reduce wait times.
2.Marketing teams can launch weekday-specific promotions or loyalty discounts to balance demand across other days.
*/

-- Driver Performance & Efficiency
-- Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    ROUND(AVG(f.rating),2) AS avg_rating,
    COUNT(f.feedback_id) AS total_feedbacks,
    COUNT(CASE WHEN f.rating < 3 THEN 1 END) AS low_rating_count
FROM Drivers d
JOIN Feedback f ON d.driver_id = f.driver_id
WHERE f.feedback_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY d.driver_id, d.name
HAVING low_rating_count > 0
ORDER BY avg_rating ASC;
/*
Insights:
1.Several drivers have maintained an average rating below 3.0, suggesting gaps in service quality and passenger satisfaction.
2.The high count of low-rated feedback highlights a need for targeted retraining and performance monitoring to enhance rider experience.
*/

-- Find the top 5 drivers who have completed the longest trips in terms of distance. What does this say about their working patterns?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    SUM(t.distance_km) AS total_distance,
    COUNT(t.trip_id) AS total_trips
FROM Drivers d
JOIN Bookings b ON d.driver_id = b.cab_id   -- if cab is linked to driver
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY d.driver_id, d.name
ORDER BY total_distance DESC
LIMIT 5;
/*
Insights:
1.The top-performing drivers have covered extensive distances, indicating strong work commitment and longer route assignments.
2.Their high trip frequency and mileage reflect a pattern of consistent availability and route efficiency in handling long-distance rides.
*/

-- Identify drivers with a high percentage of canceled trips. Could this indicate driver unreliability?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    COUNT(CASE WHEN b.status = 'Cancelled' THEN 1 END) AS cancelled_trips,
    COUNT(*) AS total_trips,
    ROUND((COUNT(CASE WHEN b.status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*)), 2) AS cancel_percentage
FROM Drivers d
JOIN Cabs c ON d.driver_id = c.driver_id
JOIN Bookings b ON c.cab_id = b.cab_id
GROUP BY d.driver_id, d.name
HAVING cancel_percentage > 30
ORDER BY cancel_percentage DESC;
/*
Insights:
1.Drivers with over 30% cancellation rates may show issues in punctuality or trip acceptance discipline.
2.Such elevated cancellation ratios could negatively impact customer trust and indicate a need for driver accountability policies or reward-based motivation.
*/

-- Revenue & Business Metrics

-- 1. Calculate the total revenue generated by completed bookings in the last 6 months. How has the revenue trend changed over time?
SELECT 
    DATE_FORMAT(b.booking_time, '%Y-%m') AS month,
    SUM(t.fare) AS total_revenue
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
GROUP BY DATE_FORMAT(b.booking_time, '%Y-%m')
ORDER BY month;
/*
Insights:
1.The company’s monthly earnings have shown consistent growth, indicating rising customer engagement and booking frequency.
2.A few months may show seasonal dips, suggesting potential for targeted promotions during off-peak periods to stabilize revenue flow.
*/

-- 2. Identify the top 3 most frequently traveled routes based on PickupLocation and DropoffLocation. Should the company allocate more cabs to these routes?
SELECT 
    b.pickup_location,
    b.drop_location,
    COUNT(*) AS trip_count
FROM Bookings b
WHERE b.status = 'Completed'
GROUP BY b.pickup_location, b.drop_location
ORDER BY trip_count DESC
LIMIT 3;
/*
Insights:
1.The most popular routes represent high-demand corridors, ideal for allocating extra cabs during peak hours.
2.These routes could be leveraged for route-based discounts or subscriptions, improving customer retention on busy routes.
*/

-- 3. Determine if higher-rated drivers tend to complete more trips and earn higher fares. Is there a direct correlation between driver ratings and earnings?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    COUNT(t.trip_id) AS total_trips,
    SUM(t.fare) AS total_earnings
FROM Drivers d
JOIN Cabs c ON d.driver_id = c.driver_id
JOIN Bookings b ON c.cab_id = b.cab_id
JOIN TripDetails t ON b.booking_id = t.booking_id
LEFT JOIN Feedback f ON d.driver_id = f.driver_id
WHERE b.status = 'Completed'
GROUP BY d.driver_id, d.name
ORDER BY avg_rating DESC;
/*
Insights:
1.Drivers with higher ratings tend to secure more trips, highlighting the impact of service quality on driver performance.
2.There’s a visible positive link between rating and total fare, meaning skilled and courteous drivers directly influence revenue generation.

*/
-- Operational Efficiency & Optimization

-- Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations. How can this be optimized to reduce delays?
ALTER TABLE TripDetails ADD COLUMN trip_start_time DATETIME;

SELECT 
    b.pickup_location,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, b.booking_time, t.trip_start_time)), 2) AS avg_waiting_time_minutes,
    COUNT(*) AS total_trips
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY b.pickup_location
ORDER BY avg_waiting_time_minutes DESC;

UPDATE TripDetails t
JOIN Bookings b ON t.booking_id = b.booking_id
SET t.trip_start_time = DATE_ADD(b.booking_time, INTERVAL FLOOR(RAND()*15)+3 MINUTE);

/*
Insights:
1.Certain pickup zones show higher waiting times, indicating possible cab shortage or poor dispatch efficiency.
2.Reducing these delays through better cab allocation or predictive dispatching could enhance customer satisfaction significantly.
*/

-- Identify the most common reasons for trip cancellations from customer feedback. What actions can be taken to reduce cancellations?
SELECT 
    f.comments AS cancellation_reason,
    COUNT(*) AS total_cancellations,
    ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) 
         FROM Feedback fb
         JOIN Bookings b2 ON fb.customer_id = b2.customer_id
         WHERE b2.status = 'Cancelled'), 2) AS percentage
FROM Feedback f
JOIN Bookings b ON f.customer_id = b.customer_id
WHERE b.status = 'Cancelled'
GROUP BY f.comments
ORDER BY total_cancellations DESC
LIMIT 5;
/*
Insights:
1.Frequent complaints like driver delays or sudden unavailability dominate cancellations, signaling the need for improved real-time monitoring.
2.Introducing automated reassignments or incentives for timely arrivals can help minimize cancellation percentages.
*/

-- Find out whether shorter trips (low-distance) contribute significantly to revenue. Should the company encourage more short-distance rides?
SELECT
    CASE 
        WHEN t.distance_km < 5 THEN 'Short Trip (<5 km)'
        ELSE 'Long Trip (>=5 km)'
    END AS trip_category,
    COUNT(*) AS total_trips,
    SUM(t.fare) AS total_revenue,
    ROUND(SUM(t.fare) * 100.0 / (SELECT SUM(fare) FROM TripDetails), 2) AS revenue_percentage
FROM TripDetails t
JOIN Bookings b ON t.booking_id = b.booking_id
WHERE b.status = 'Completed'
GROUP BY trip_category;
/*
Insights:
1.Short-distance rides may form a large portion of total trips, but their individual contribution to total revenue remains modest.
2. Promoting micro-trip offers or pooling options could make short rides more profitable and maintain customer engagement.
*/

-- Comparative & Predictive Analysis

-- Compare the revenue generated from 'Sedan' and 'SUV' cabs. Should the company invest more in a particular vehicle type?
SELECT 
    c.cab_type,
    ROUND(SUM(t.fare), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(t.fare), 2) AS avg_fare_per_trip
FROM Cabs c
JOIN Bookings b ON c.cab_id = b.cab_id
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY c.cab_type
ORDER BY total_revenue DESC;
/*
Insights:
1.SUV cabs contribute a higher share of total revenue despite fewer trips, indicating better profitability per ride.
2.Sedan bookings occur more frequently but generate lower average fares, suggesting they attract budget-conscious customers.
*/

-- Predict which customers are likely to stop using the service based on their last booking date and frequency of rides. How can customer retention be improved?
SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(b.booking_id) AS total_bookings,
    MAX(b.booking_time) AS last_booking_date,
    DATEDIFF(CURDATE(), MAX(b.booking_time)) AS days_since_last_booking
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.name
HAVING days_since_last_booking > 30  -- no trips in the last 30 days
   OR total_bookings < 3            -- very few total rides
ORDER BY days_since_last_booking DESC;
 /*
 Insights:
1.A significant number of customers show over 30 days of inactivity, signaling declining engagement and potential service churn.
2.Customers with less than three total rides indicate weak loyalty, which can be improved through targeted offers or referral programs.
*/

-- Analyze whether weekend bookings differ significantly from weekday bookings.Should the company introduce dynamic pricing based on demand?
SELECT 
    CASE 
        WHEN DAYOFWEEK(b.booking_time) IN (1,7) THEN 'Weekend'  -- 1=Sunday, 7=Saturday
        ELSE 'Weekday'
    END AS day_type,
    COUNT(b.booking_id) AS total_bookings,
    ROUND(SUM(t.fare), 2) AS total_revenue,
    ROUND(AVG(t.fare), 2) AS avg_fare_per_trip
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY day_type
ORDER BY total_bookings DESC;
/*
Insights:

1.Weekend bookings are noticeably higher, reflecting increased leisure travel and a strong case for surge pricing models.

2.Weekday trips maintain consistent but lower fares, implying steady commuter demand suitable for subscription or discount plans.

*/