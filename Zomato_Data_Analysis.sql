show databases;

create database Zomato_Data_Analysis;

use Zomato_Data_Analysis;

-- 1. Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);
INSERT INTO Users (user_id, name, email, phone, address) VALUES
(1, 'Aryan Mehta', 'aryan.mehta@example.com', '9876543210', 'Mumbai'),
(2, 'Sneha Kapoor', 'sneha.kapoor@example.com', '9876501234', 'Delhi'),
(3, 'Raj Verma', 'raj.verma@example.com', '9823456789', 'Bangalore'),
(4, 'Aisha Khan', 'aisha.khan@example.com', '9812345678', 'Hyderabad'),
(5, 'Karan Patel', 'karan.patel@example.com', '9834567890', 'Ahmedabad'),
(6, 'Neha Sharma', 'neha.sharma@example.com', '9845678901', 'Chennai'),
(7, 'Rohan Das', 'rohan.das@example.com', '9856789012', 'Kolkata'),
(8, 'Pooja Singh', 'pooja.singh@example.com', '9867890123', 'Pune'),
(9, 'Vikram Rao', 'vikram.rao@example.com', '9878901234', 'Mumbai'),
(10, 'Meera Iyer', 'meera.iyer@example.com', '9889012345', 'Chennai'),
(11, 'Aditya Joshi', 'aditya.joshi@example.com', '9890123456', 'Delhi'),
(12, 'Divya Nair', 'divya.nair@example.com', '9801234567', 'Bangalore'),
(13, 'Ankit Tiwari', 'ankit.tiwari@example.com', '9812345671', 'Lucknow'),
(14, 'Simran Kaur', 'simran.kaur@example.com', '9823456781', 'Amritsar'),
(15, 'Yash Malhotra', 'yash.malhotra@example.com', '9834567891', 'Jaipur'),
(16, 'Ritika Jain', 'ritika.jain@example.com', '9845678902', 'Indore'),
(17, 'Siddharth Roy', 'siddharth.roy@example.com', '9856789013', 'Nagpur'),
(18, 'Tanvi Bhatia', 'tanvi.bhatia@example.com', '9867890124', 'Surat'),
(19, 'Nikhil Menon', 'nikhil.menon@example.com', '9878901235', 'Cochin'),
(20, 'Aarav Thakur', 'aarav.thakur@example.com', '9889012346', 'Noida');


-- 2. Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    cuisine VARCHAR(100),
    rating FLOAT
);
INSERT INTO Restaurants (restaurant_id, name, location, cuisine, rating) VALUES
(1, 'Spice Garden', 'Mumbai', 'Indian', 4.5),
(2, 'Dragon Bowl', 'Delhi', 'Chinese', 4.2),
(3, 'Bella Italia', 'Bangalore', 'Italian', 4.7),
(4, 'Sushi Zen', 'Hyderabad', 'Japanese', 4.3),
(5, 'Burger Hub', 'Chennai', 'American', 4.1),
(6, 'Punjab Grill', 'Delhi', 'North Indian', 4.6),
(7, 'The Dosa House', 'Chennai', 'South Indian', 4.4),
(8, 'Biryani Express', 'Hyderabad', 'Indian', 4.0),
(9, 'Pizza Point', 'Pune', 'Italian', 4.1),
(10, 'Wok & Roll', 'Kolkata', 'Chinese', 4.3),
(11, 'Tandoori Nights', 'Ahmedabad', 'Mughlai', 4.2),
(12, 'Noodle Town', 'Mumbai', 'Thai', 3.9),
(13, 'Grill Station', 'Nagpur', 'American', 4.0),
(14, 'Chaat Bazaar', 'Lucknow', 'Street Food', 4.5),
(15, 'Ocean Catch', 'Cochin', 'Seafood', 4.6),
(16, 'Rajasthan Rasoi', 'Jaipur', 'Rajasthani', 4.2),
(17, 'Urban Dhaba', 'Indore', 'Indian', 4.1),
(18, 'Saffron Lounge', 'Surat', 'North Indian', 4.4),
(19, 'Mama Mia', 'Delhi', 'Continental', 4.3),
(20, 'Green Bowl', 'Bangalore', 'Healthy Food', 4.0);


-- 3. MenuItems Table
CREATE TABLE MenuItems (
    item_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(6, 2),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO MenuItems (item_id, restaurant_id, item_name, price) VALUES
(1, 1, 'Butter Chicken', 299.00),
(2, 1, 'Paneer Tikka', 250.00),
(3, 2, 'Veg Hakka Noodles', 180.00),
(4, 2, 'Chicken Manchurian', 210.00),
(5, 3, 'Margherita Pizza', 320.00),
(6, 3, 'Pasta Alfredo', 310.00),
(7, 4, 'Sushi Platter', 450.00),
(8, 4, 'Miso Soup', 150.00),
(9, 5, 'Cheeseburger', 220.00),
(10, 5, 'French Fries', 120.00),
(11, 6, 'Dal Makhani', 240.00),
(12, 6, 'Tandoori Roti', 30.00),
(13, 7, 'Masala Dosa', 100.00),
(14, 7, 'Idli Vada', 80.00),
(15, 8, 'Hyderabadi Biryani', 290.00),
(16, 9, 'Pepperoni Pizza', 340.00),
(17, 10, 'Chicken Chow Mein', 210.00),
(18, 11, 'Mutton Kebab', 300.00),
(19, 12, 'Pad Thai', 270.00),
(20, 13, 'BBQ Chicken Wings', 250.00);


-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATE,
    total_amount DECIMAL(8, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO Orders (order_id, user_id, restaurant_id, order_date, total_amount) VALUES
(1, 1, 1, '2025-05-01', 549.00),
(2, 2, 2, '2025-05-01', 390.00),
(3, 3, 3, '2025-05-02', 630.00),
(4, 4, 4, '2025-05-02', 600.00),
(5, 5, 5, '2025-05-03', 340.00),
(6, 6, 6, '2025-05-03', 270.00),
(7, 7, 7, '2025-05-03', 180.00),
(8, 8, 8, '2025-05-04', 290.00),
(9, 9, 9, '2025-05-04', 340.00),
(10, 10, 10, '2025-05-04', 210.00),
(11, 11, 11, '2025-05-05', 300.00),
(12, 12, 12, '2025-05-05', 270.00),
(13, 13, 13, '2025-05-06', 250.00),
(14, 14, 14, '2025-05-06', 200.00),
(15, 15, 15, '2025-05-07', 480.00),
(16, 16, 16, '2025-05-07', 340.00),
(17, 17, 17, '2025-05-08', 210.00),
(18, 18, 18, '2025-05-08', 300.00),
(19, 19, 19, '2025-05-09', 430.00),
(20, 20, 20, '2025-05-10', 400.00);


-- 5. OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);
INSERT INTO OrderItems (order_item_id, order_id, item_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 2, 4, 1),
(5, 3, 5, 1),
(6, 3, 6, 1),
(7, 4, 7, 2),
(8, 4, 8, 1),
(9, 5, 9, 1),
(10, 5, 10, 1),
(11, 6, 11, 1),
(12, 6, 12, 2),
(13, 7, 13, 2),
(14, 8, 15, 1),
(15, 9, 16, 1),
(16, 10, 17, 1),
(17, 11, 18, 1),
(18, 12, 19, 1),
(19, 13, 20, 1),
(20, 14, 14, 2);


-- 6. Ratings Table
CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    rating_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO Ratings (rating_id, user_id, restaurant_id, rating, review, rating_date) VALUES
(1, 1, 1, 5, 'Amazing food and quick service!', '2025-05-01'),
(2, 2, 2, 4, 'Great Chinese flavors, will order again.', '2025-05-01'),
(3, 3, 3, 5, 'Authentic Italian pizza!', '2025-05-02'),
(4, 4, 4, 4, 'Sushi was fresh and delicious.', '2025-05-02'),
(5, 5, 5, 3, 'Burger was decent, fries were cold.', '2025-05-03'),
(6, 6, 6, 5, 'North Indian cuisine at its best!', '2025-05-03'),
(7, 7, 7, 4, 'Loved the dosa, good sambhar.', '2025-05-03'),
(8, 8, 8, 5, 'Best biryani in town!', '2025-05-04'),
(9, 9, 9, 4, 'Pizza was good, crust was crispy.', '2025-05-04'),
(10, 10, 10, 3, 'Noodles were okay, nothing special.', '2025-05-04'),
(11, 11, 11, 4, 'Tasty kebabs and well-cooked meat.', '2025-05-05'),
(12, 12, 12, 3, 'Thai food was flavorful but oily.', '2025-05-05'),
(13, 13, 13, 4, 'Good BBQ and spicy wings.', '2025-05-06'),
(14, 14, 14, 5, 'Street food vibes, absolutely loved it!', '2025-05-06'),
(15, 15, 15, 5, 'Seafood was fresh and tasty.', '2025-05-07'),
(16, 16, 16, 4, 'Rajasthani thali was filling and delicious.', '2025-05-07'),
(17, 17, 17, 3, 'Okay experience, slow service.', '2025-05-08'),
(18, 18, 18, 4, 'Nice ambiance and good food.', '2025-05-08'),
(19, 19, 19, 5, 'Amazing continental food!', '2025-05-09'),
(20, 20, 20, 4, 'Healthy and tasty, would recommend.', '2025-05-10');


-- List all the users from the database.

select * from users;




-- Select the names and ratings of all restaurants.

select name, rating from restaurants;



-- Display the name and price of all menu items.           

select  item_name, price from MenuItems; 


-- Find all restaurants that serve 'Indian' cuisine.

select name,location from restaurants where cuisine="Indian";


-- List all users who live in 'Delhi'.

select * from users where address="Delhi";


-- Find menu items that cost more than ₹250.

select item_name from MenuItems where price>= 250;



-- Get all orders placed by user with user_id = 2. 

select * from orders where user_id=2;


-- List all restaurants ordered by their rating (highest to lowest).

 select * from restaurants order by rating desc limit 10;
 


--  Select the menu items and sort them by price in descending order.

select item_name, price from MenuItems order by price desc;



-- Find the average price of menu items in each restaurant.
select restaurant_id, avg(price) as average_price
from MenuItems
group by restaurant_id;



-- Which restaurant has received the highest number of ratings?
select restaurant_id, COUNT(*) as num_ratings from Ratings
group by restaurant_id
order by num_ratings desc
limit 1;

-- List all the items ordered in order ID 5 along with quantity and price.
select mi.item_name, oi.quantity, mi.price
from OrderItems oi
join MenuItems mi on oi.item_id = mi.item_id
where oi.order_id = 5;




 





