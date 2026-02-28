-- 1. retrive booking info along with customer_name and vehicle_name
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;


-- 2. find all vehicles that have never been booked
SELECT * FROM Vehicles v
WHERE NOT EXISTS (
    SELECT *
    FROM Bookings b
    WHERE b.vehicle_id = v.vehicle_id
);


-- 3. retrive all available vehicles of a specific type
SELECT * FROM vehicles
WHERE vehicle_type = 'car' AND availability_status = 'available';


-- 4. find total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings
SELECT
  v.vehicle_name,
  COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.vehicle_name
HAVING COUNT(b.booking_id) > 2;
