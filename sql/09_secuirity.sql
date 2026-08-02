CREATE ROLE hostel_owner NOLOGIN;

CREATE ROLE receptionist NOLOGIN;

CREATE ROLE accountant NOLOGIN;

CREATE ROLE warden NOLOGIN;

REVOKE ALL ON SCHEMA public FROM PUBLIC;

REVOKE ALL ON DATABASE "HostelManagementSystem" FROM PUBLIC;

GRANT USAGE ON SCHEMA public TO hostel_owner, receptionist, accountant, warden;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO hostel_owner;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO hostel_owner;

GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO hostel_owner;

GRANT SELECT, INSERT, UPDATE ON
Hostel, Room, Bed, Student, Admission, BedAllocation, Visitor
TO receptionist;

GRANT
SELECT, INSERT, UPDATE ON
ElectricityBill, LaundryTransaction, LaundryItem, LaundryItemType, MealUsage
TO accountant;

GRANT
SELECT, UPDATE ON
Complaint, Room, Bed, Admission
TO warden;

GRANT
SELECT ON vw_RoomOccupancy, vw_HostelOccupancySummary, vw_AdmissionHistory
TO receptionist, accountant, warden;

GRANT
EXECUTE ON FUNCTION FN_GET_HOSTEL_OCCUPANCY(INT)
TO receptionist, warden;

GRANT
EXECUTE ON FUNCTION FN_CALCULATE_LAUNDRY_TOTAL(INT)
TO accountant;

GRANT
EXECUTE ON FUNCTION FN_GET_STUDENT_ELECTRICITY_DUE(INT)
TO accountant;

ALTER DEFAULT PRIVILEGES
IN SCHEMA public

GRANT
SELECT ON TABLES
TO receptionist, accountant, warden;