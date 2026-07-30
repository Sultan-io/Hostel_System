-- Student ENUMs
CREATE TYPE gender_enum as ENUM
(
    'Male', 'Female'
);
COMMENT ON TYPE gender_enum IS
'Stores the gender of a student';
CREATE TYPE student_status_enum as ENUM
(
    'Active', 'Left', 'Suspended'
);
COMMENT ON student_status_enum IS 
'Represents the current admission status of a student.';

--Employee ENUMs
CREATE TYPE employee_status_enum AS ENUM
(
    'Active', 'Inactive'
);
COMMENT ON TYPE employee_status_enum IS
'Represents whether an employee is currently working.';

-- Room and Bed ENUMs
CREATE TYPE occupancy_status_enum AS ENUM
(
    'Available', 'Occupied', 'Maintenance', 'Reserved'
);
COMMENT ON TYPE occupancy_status_enum IS
'Represents the occupancy status of rooms and beds.';

-- Payment ENUMs
CREATE TYPE payment_status_enum AS ENUM
(
    'Pending','Paid'
);
COMMENT ON payment_status_enum IS
'Represents the payment status for electricity, meals and laundry.';

--Meal ENUMs
CREATE TYPE meal_type_enum AS ENUM
(
    'Breakfast', 'Lunch', 'Dinner'
);
COMMENT ON meal_type_enum IS
'Represents the type of meal served.';

-- Complaint ENUMs
CREATE TYPE complaint_status_enum AS ENUM
(
    'Open', 'In Progress', 'Resolved', 'Closed'
);
COMMENT ON TYPE complaint_status_enum IS
'Represents the lifecycle of a complaint.';

--Lookup table ENUMs
CREATE TYPE active_status_enum AS ENUM
(
    'Active', 'Inactive'
);
COMMENT ON TYPE active_status_enum IS
'Represents whether a lookup table record is active.';