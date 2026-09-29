INSERT INTO customers (customer_name, segment, country, signup_date) VALUES
('Northstar Studio','SMB','Singapore','2025-01-15'),
('Bright Retail','Enterprise','Singapore','2025-02-10'),
('Maple Works','SMB','Canada','2025-03-05'),
('Pixel House','Consumer','Australia','2025-04-18'),
('Orbit Labs','Enterprise','United Kingdom','2025-05-22'),
('Greenfield Co','SMB','Singapore','2025-06-12'),
('Nova Creative','Consumer','Malaysia','2025-07-08'),
('Summit Systems','Enterprise','Australia','2025-08-14');

INSERT INTO products (product_name, category, unit_price, unit_cost) VALUES
('Starter CRM','Software',120.00,30.00),
('Sales Pro','Software',240.00,55.00),
('Analytics Plus','Analytics',180.00,45.00),
('Team Workspace','Collaboration',90.00,20.00),
('Support Premium','Services',150.00,60.00),
('Data Connector','Analytics',130.00,35.00);

INSERT INTO salespeople (salesperson_name, region, team) VALUES
('Aisha Tan','APAC','Growth'),
('Daniel Lim','APAC','Enterprise'),
('Sophie Martin','EMEA','Enterprise'),
('Noah Williams','ANZ','Growth');

INSERT INTO orders (customer_id, salesperson_id, order_date, status) VALUES
(1,1,'2026-01-08','Completed'),
(2,2,'2026-01-19','Completed'),
(3,1,'2026-02-06','Completed'),
(4,4,'2026-02-21','Completed'),
(5,3,'2026-03-04','Completed'),
(6,1,'2026-03-17','Completed'),
(1,1,'2026-04-09','Completed'),
(7,1,'2026-04-25','Returned'),
(8,4,'2026-05-11','Completed'),
(2,2,'2026-05-23','Completed'),
(3,1,'2026-06-07','Completed'),
(5,3,'2026-06-18','Cancelled'),
(6,2,'2026-07-05','Completed'),
(8,4,'2026-07-22','Completed'),
(1,1,'2026-08-03','Completed'),
(2,2,'2026-08-20','Completed');

INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount_pct) VALUES
(1,1,3,120,0),(1,4,2,90,5),
(2,2,8,240,10),(2,3,5,180,10),
(3,1,2,120,0),(3,6,2,130,0),
(4,4,1,90,0),(4,5,1,150,0),
(5,2,6,240,8),(5,6,4,130,5),
(6,3,3,180,0),(6,4,4,90,5),
(7,2,2,240,0),(7,3,2,180,0),
(8,1,1,120,0),
(9,2,5,240,5),(9,5,3,150,0),
(10,3,7,180,12),(10,6,5,130,10),
(11,1,4,120,0),(11,4,3,90,0),
(12,2,3,240,0),
(13,3,4,180,5),(13,5,2,150,0),
(14,2,4,240,5),(14,6,4,130,0),
(15,1,5,120,0),(15,3,3,180,5),
(16,2,7,240,10),(16,5,4,150,5);
