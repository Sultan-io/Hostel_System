# Hostel Management System

A practical PostgreSQL-based database project for managing hostel operations such as student admissions, room and bed allocation, electricity billing, laundry, meals, complaints, and visitor tracking.

This project is designed to be useful for:
- academic database assignments and labs
- practical SQL learning
- demonstration of relational database design
- portfolio projects showing schema design, constraints, views, functions, and triggers

## Project Purpose

The Hostel Management System helps hostel owners and staff manage day-to-day operations in a structured way. Instead of relying on spreadsheets or paper records, the system stores information in a relational database so that data remains consistent and searchable.

The core business areas covered by this project are:
- hostel and room management
- student admissions and bed assignments
- electricity and payment tracking
- laundry services
- meal usage
- complaint handling
- visitor records

## Key Distinctions of This Project

This project is more than a simple CRUD example. It demonstrates several real database concepts:
- normalized relational design
- use of PostgreSQL enums and constraints
- foreign key relationships between business entities
- indexes for faster queries
- views for reporting and analytics
- stored functions for reusable logic
- triggers for enforcing business rules

## Main Features

### Core modules
- Manage multiple hostels
- Track rooms and beds with occupancy status
- Register students and their emergency contacts
- Record student admissions and bed allocations
- Handle electricity bills per room
- Manage laundry transactions and itemized laundry records
- Track meal usage by student and date
- Record complaints with categories and assigned employees
- Track visitor check-ins and check-outs

### Database features included
- Primary keys and foreign keys
- Unique constraints and check constraints
- PostgreSQL enums for controlled values
- Derived reporting views
- Business-rule triggers
- Reusable helper functions

## Technology Stack

- Database: PostgreSQL
- Scripting: SQL
- Containerization: Docker + Docker Compose
- Version control: Git/GitHub

## Project Structure

```text
.
├── docs/
│   ├── FinalSchema.md
│   └── Realation_among_tables.md
├── diagrams/
├── sql/
│   ├── 01_CreateDatabase.sql
│   ├── 02_CreateEnums.sql
│   ├── 03_CreateTables.sql
│   ├── 04_index.sql
│   ├── 05_InsertSampleData.sql
│   ├── 06_views.sql
│   ├── 07_Functions.sql
│   └── 08_triggers.sql
├── docker-compose.yml
├── docker/
│   └── postgres/
│       └── Dockerfile
└── README.md
```

## Database Design Overview

The database is organized around the main hostel management entities:
- Hostel
- Role
- Student
- Employee
- Room
- Bed
- Admission
- BedAllocation
- ElectricityBill
- LaundryItemType
- LaundryTransaction
- LaundryItem
- MealUsage
- ComplaintCategory
- Complaint
- Visitor

This design supports both operational use and reporting use cases.

## How to Run the Project

You can use this project in two ways:
1. Local PostgreSQL installation
2. Docker-based setup

Both methods are explained below.

---

## Method 1: Local PostgreSQL Setup

### Prerequisites

Install PostgreSQL on your machine.

Recommended:
- PostgreSQL 18
- pgAdmin or any SQL client
- psql command-line tool

### Steps

1. Create the database

Run the SQL in [sql/01_CreateDatabase.sql](sql/01_CreateDatabase.sql):

```bash
psql -U postgres -f sql/01_CreateDatabase.sql
```

2. Create the schema and tables

Run the following files in order:

```bash
psql -U postgres -d HostelManagementSystem -f sql/02_CreateEnums.sql
psql -U postgres -d HostelManagementSystem -f sql/03_CreateTables.sql
psql -U postgres -d HostelManagementSystem -f sql/04_index.sql
```

3. Load sample data

```bash
psql -U postgres -d HostelManagementSystem -f sql/05_InsertSampleData.sql
```

4. Create views, functions, and triggers

```bash
psql -U postgres -d HostelManagementSystem -f sql/06_views.sql
psql -U postgres -d HostelManagementSystem -f sql/07_Functions.sql
psql -U postgres -d HostelManagementSystem -f sql/08_triggers.sql
```

### Local setup notes

- If your PostgreSQL user is not `postgres`, replace it with your own username.
- If PostgreSQL is running on a different port, adjust the connection command accordingly.
- You may need to create the database first and then connect to it.

---

## Method 2: Docker Setup (Recommended)

Docker makes setup much easier because you do not need to manually install PostgreSQL on your machine.

### Prerequisites

Install:
- Docker Desktop
- Docker Compose

### Steps

1. Open a terminal in the project root.

2. Start the PostgreSQL container:

```bash
docker compose up -d
```

3. Verify that the container is running:

```bash
docker ps
```

4. The database will be created automatically with:
- database name: `HostelManagementSystem`
- username: `postgres`
- password: `postgres`

5. To load the SQL scripts into the database, run:

```bash
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/02_CreateEnums.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/03_CreateTables.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/04_index.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/05_InsertSampleData.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/06_views.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/07_Functions.sql
docker exec -it hostel-postgres psql -U postgres -d HostelManagementSystem -f /docker-entrypoint-initdb.d/sql/08_triggers.sql
```

### Docker notes

- The database data is stored in a Docker volume so it persists between restarts.
- To stop the container:

```bash
docker compose down
```

- To remove the container and its data volume:

```bash
docker compose down -v
```

---

## Suggested Example Queries

Once the database is running, you can try queries such as:

### See all current residents
```sql
SELECT * FROM vw_CurrentResidents;
```

### See vacant beds
```sql
SELECT * FROM vw_VacantBeds;
```

### Get hostel occupancy summary
```sql
SELECT * FROM vw_HostelOccupancySummary;
```

### Check current bed for a student
```sql
SELECT * FROM FN_GET_CURRENT_BED(1);
```

## Why This Project Is Good for Learning

This project gives hands-on experience with:
- database normalization
- schema design
- SQL scripting
- business rule enforcement
- reporting with views
- stored procedures and functions
- trigger-based validation

## Future Improvements

Possible future enhancements include:
- adding a web app frontend
- adding user authentication and roles in an application layer
- creating reports in a dashboard
- integrating payment modules
- adding REST APIs on top of the database

## Conclusion

The Hostel Management System is a strong example of a real-world relational database project that can be used for learning, teaching, and demonstration. It is structured to be easy to understand while still showing professional database design practices.

