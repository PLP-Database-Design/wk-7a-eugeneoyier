✅ Question 1: Achieving 1NF (First Normal Form)
Goal: Eliminate repeating groups/multivalued attributes from the Products column.

Given Table:

OrderID | CustomerName | Products
101     | John Doe     | Laptop, Mouse
102     | Jane Smith   | Tablet, Keyboard, Mouse
103     | Emily Clark  | Phone
🔄 Transformed Table (1NF):
Each row should contain only one product per record.
-- Transform the ProductDetail table into 1NF
-- Assuming a temp table was created for demonstration
-- (Replace this with actual insert statements in a real database)

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
✅ Question 2: Achieving 2NF (Second Normal Form)
Goal: Remove partial dependencies—i.e., make sure all non-key columns depend on the entire primary key.

🧱 Step 1: Create Two Tables
Split the OrderDetails table into:

Orders table — stores data unique to the order (e.g., OrderID, CustomerName)

OrderItems table — stores each product in an order (e.g., OrderID, Product, Quantity)

-- Orders table (to store OrderID and CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- OrderItems table (separate table for product and quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
