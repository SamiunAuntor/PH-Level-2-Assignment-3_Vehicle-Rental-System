# Vehicle Rental System

A database-driven vehicle rental management system designed to handle user accounts, vehicle inventory, and booking operations.

## Overview

This project implements a relational database system for managing vehicle rentals. The system supports multiple user roles (Admin and Customer), tracks vehicle availability, and manages booking lifecycle from creation to completion.

## Database Schema

The system consists of three core tables:

### Users
Stores user account information with role-based access control.
- **Primary Key**: `user_id` (SERIAL)
- **Fields**: `name` (varchar(100)), `email` (varchar(100), unique), `password` (varchar(255)), `phone` (varchar(20)), `role` (varchar(10), CHECK: 'admin' or 'customer'), `created_at` (timestamp)
- **Constraints**: Email must be unique, role must be either 'admin' or 'customer'

### Vehicles
Manages vehicle inventory and availability.
- **Primary Key**: `vehicle_id` (SERIAL)
- **Fields**: `vehicle_name` (varchar(100)), `vehicle_type` (varchar(10), CHECK: 'car', 'bike', or 'truck'), `model` (varchar(100)), `registration_number` (varchar(50), unique), `price_per_day` (int), `availability_status` (varchar(15), CHECK: 'available', 'rented', or 'maintenance')
- **Constraints**: Registration number must be unique, vehicle type and availability status are constrained by CHECK constraints

### Bookings
Tracks rental transactions and booking status.
- **Primary Key**: `booking_id` (SERIAL)
- **Foreign Keys**: 
  - `user_id` → Users (ON DELETE CASCADE)
  - `vehicle_id` → Vehicles (ON DELETE RESTRICT)
- **Fields**: `start_date` (DATE), `end_date` (DATE), `total_cost` (int), `booking_status` (varchar(10), CHECK: 'pending', 'confirmed', 'completed', or 'cancelled'), `created_at` (timestamp)
- **Constraints**: End date must be greater than start date, booking status is constrained by CHECK constraint

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

## Database Setup

The database is designed for PostgreSQL. To set up the database:

1. Create the database:
   ```sql
   CREATE DATABASE vehicle_rental_system;
   ```

2. Execute the DDL script to create tables with all constraints and relationships.

3. Insert sample data (optional) to test the queries.

## Requirements

- PostgreSQL database
- Database tables created according to the schema above
