# Vehicle Rental System

A database-driven vehicle rental management system designed to handle user accounts, vehicle inventory, and booking operations.

## Overview

This project implements a relational database system for managing vehicle rentals. The system supports multiple user roles (Admin and Customer), tracks vehicle availability, and manages booking lifecycle from creation to completion.

## Database Schema

The system consists of three core tables:

### Users
Stores user account information with role-based access control.
- **Primary Key**: `user_id`
- **Fields**: `name`, `email` (unique), `password`, `phone_number`, `role` (Admin/Customer)

### Vehicles
Manages vehicle inventory and availability.
- **Primary Key**: `vehicle_id`
- **Fields**: `vehicle_name`, `vehicle_type` (car/bike/truck), `model`, `registration_number` (unique), `rental_price_per_day`, `availability_status` (available/rented/maintenance)

### Bookings
Tracks rental transactions and booking status.
- **Primary Key**: `booking_id`
- **Foreign Keys**: `user_id` → Users, `vehicle_id` → Vehicles
- **Fields**: `start_date`, `end_date`, `booking_status` (pending/confirmed/completed/cancelled), `total_cost`

## Relationships

- **Users → Bookings**: One-to-Many (one user can have multiple bookings)
- **Vehicles → Bookings**: One-to-Many (one vehicle can have multiple bookings)
- **Bookings**: Connects one user to one vehicle per booking

## SQL Queries

The `queries.sql` file contains four essential queries demonstrating different SQL concepts:

1. **JOIN Query**: Retrieves booking information along with customer name and vehicle name using INNER JOIN
2. **EXISTS Query**: Finds all vehicles that have never been booked using NOT EXISTS
3. **WHERE Query**: Retrieves all available vehicles of a specific type (e.g., cars)
4. **GROUP BY/HAVING Query**: Finds the total number of bookings for each vehicle and displays only those vehicles that have more than 2 bookings

See `queries.sql` for complete query implementations.

## Usage

Execute the queries in `queries.sql` against your database to:
- View booking information with related user and vehicle data
- Identify unbooked vehicles in inventory
- Filter vehicles by type and availability
- Analyze booking statistics per vehicle

## Requirements

- SQL-compatible database (MySQL, PostgreSQL, SQL Server, etc.)
- Database tables created according to the schema above
