-- Base roles
INSERT INTO
    Role (RoleName)
VALUES
    ('Owner'),
    ('Receptionist'),
    ('Warden'),
    ('Accountant');

-- Hostel records
INSERT INTO
    Hostel (HostelName, Address, OfficialPhone, Status)
VALUES
    (
        'City Boys Hostel',
        'Johar Town, Lahore',
        '0300-1111111',
        'Active'
    );

INSERT INTO
    Hostel (HostelName, Address, OfficialPhone, Status)
VALUES
    (
        'Girls Hostel',
        'Model Town, Lahore',
        '0300-2222222',
        'Active'
    );

INSERT INTO
    Hostel (HostelName, Address, OfficialPhone, Status)
VALUES
    (
        'Islamabad Executive Hostel',
        'G-10, Islamabad',
        '0300-3333333',
        'Active'
    );

-- Students
INSERT INTO
    Student (
        FullName,
        CNIC,
        Phone,
        Gender,
        DateOfBirth,
        Address,
        EmergencyContactName,
        EmergencyContactPhone,
        Status
    )
VALUES
    (
        'Ali Khan',
        '35202-1234567-1',
        '0301-1111111',
        'Male',
        '2003-05-10',
        'Lahore',
        'Ahmed Khan',
        '0301-9999999',
        'Active'
    ),
    (
        'Usman Tariq',
        '35202-7654321-8',
        '0302-2222222',
        'Male',
        '2002-11-18',
        'Faisalabad',
        'Tariq Mehmood',
        '0302-9999999',
        'Active'
    ),
    (
        'Hamza Iqbal',
        '35202-9876543-5',
        '0303-3333333',
        'Male',
        '2004-02-25',
        'Multan',
        'Iqbal Hussain',
        '0303-9999999',
        'Active'
    ),
    (
        'Ayesha Binte Ali',
        '35202-1111111-2',
        '0301-5555555',
        'Female',
        '2001-09-15',
        'Rawalpindi',
        'Farhan Ali',
        '0305-1234567',
        'Active'
    ),
    (
        'Maira Hassan',
        '35201-2222222-3',
        '0306-2222222',
        'Female',
        '2002-01-20',
        'Islamabad',
        'Hassan Shafiq',
        '0306-9999999',
        'Active'
    ),
    (
        'Noman Sheikh',
        '35203-3333333-4',
        '0307-3333333',
        'Male',
        '2001-06-08',
        'Karachi',
        'Sheikh Aslam',
        '0307-7777777',
        'Left'
    ),
    (
        'Sana Ahmed',
        '35201-4444444-5',
        '0308-4444444',
        'Female',
        '2003-12-02',
        'Peshawar',
        'Ahmed Raza',
        '0308-8888888',
        'Suspended'
    ),
    (
        'Zainab Farooq',
        '35204-5555555-6',
        '0309-5555555',
        'Female',
        '2002-08-12',
        'Multan',
        'Farooq Iqbal',
        '0309-6666666',
        'Active'
    ),
    (
        'Haris Mehmood',
        '35205-6666666-7',
        '0310-6666666',
        'Male',
        '2000-03-25',
        'Sialkot',
        'Mehmood Khan',
        '0310-7777777',
        'Active'
    ),
    (
        'Kiran Shah',
        '35206-7777777-8',
        '0311-7777777',
        'Female',
        '2004-11-05',
        'Hyderabad',
        'Shahzad Shah',
        '0311-8888888',
        'Active'
    ),
    (
        'Owais Qadir',
        '35207-8888888-9',
        '0312-8888888',
        'Male',
        '2001-07-14',
        'Quetta',
        'Qadir Hussain',
        '0312-9999999',
        'Active'
    );

-- Employees
INSERT INTO
    Employee (
        FullName,
        CNIC,
        Phone,
        Username,
        PasswordHash,
        RoleID,
        Status
    )
VALUES
    (
        'Sultan Ahmed',
        '35202-1111111-1',
        '0300-5551111',
        'owner',
        'hashed_password_1',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Owner'
        ),
        'Active'
    ),
    (
        'Sara Malik',
        '35202-2222222-2',
        '0300-5552222',
        'reception',
        'hashed_password_2',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Receptionist'
        ),
        'Active'
    ),
    (
        'Bilal Haider',
        '35202-3333333-3',
        '0300-5553333',
        'warden',
        'hashed_password_3',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Warden'
        ),
        'Active'
    ),
    (
        'Ayesha Noor',
        '35202-4444444-4',
        '0300-5554444',
        'accountant',
        'hashed_password_4',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Accountant'
        ),
        'Active'
    ),
    (
        'Hina Aslam',
        '35202-5555555-5',
        '0300-5555555',
        'frontdesk',
        'hashed_password_5',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Receptionist'
        ),
        'Active'
    ),
    (
        'Imran Khan',
        '35202-6666666-6',
        '0300-6666666',
        'security',
        'hashed_password_6',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Warden'
        ),
        'Active'
    ),
    (
        'Mubashir Ali',
        '35202-7777777-7',
        '0300-7777777',
        'cashier',
        'hashed_password_7',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Accountant'
        ),
        'Active'
    ),
    (
        'Nadia Qureshi',
        '35202-8888888-8',
        '0300-8888888',
        'assistant',
        'hashed_password_8',
        (
            SELECT
                RoleID
            FROM
                Role
            WHERE
                RoleName = 'Receptionist'
        ),
        'Inactive'
    );

-- Rooms and beds
INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '101',
    1,
    2,
    'Occupied'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '102',
    1,
    3,
    'Occupied'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '201',
    2,
    4,
    'Available'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '103',
    1,
    3,
    'Occupied'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '202',
    2,
    4,
    'Available'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '203',
    2,
    2,
    'Reserved'
FROM
    Hostel
WHERE
    HostelName = 'City Boys Hostel';

INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
SELECT
    HostelID,
    '101',
    1,
    2,
    'Occupied'
FROM
    Hostel
WHERE
    HostelName = 'Girls Hostel';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '101';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '101';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '102';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '102';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    3,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '102';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '201';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '201';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    3,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '201';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    4,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '201';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '103';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '103';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    3,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '103';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '202';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '202';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    3,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '202';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    4,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '202';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Reserved'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '203';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Reserved'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '203';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    1,
    'Occupied'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'Girls Hostel'
    )
    AND RoomNumber = '101';

INSERT INTO
    Bed (RoomID, BedNumber, Status)
SELECT
    RoomID,
    2,
    'Available'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'Girls Hostel'
    )
    AND RoomNumber = '101';

-- Admissions
INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-01',
    NULL
FROM
    Student
WHERE
    CNIC = '35202-1234567-1';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-05',
    NULL
FROM
    Student
WHERE
    CNIC = '35202-7654321-8';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-10',
    NULL
FROM
    Student
WHERE
    CNIC = '35202-9876543-5';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-12',
    NULL
FROM
    Student
WHERE
    CNIC = '35202-1111111-2';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-14',
    NULL
FROM
    Student
WHERE
    CNIC = '35201-2222222-3';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-16',
    '2026-08-01'
FROM
    Student
WHERE
    CNIC = '35203-3333333-4';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-18',
    NULL
FROM
    Student
WHERE
    CNIC = '35201-4444444-5';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-20',
    NULL
FROM
    Student
WHERE
    CNIC = '35204-5555555-6';

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-22',
    NULL
FROM
    Student
WHERE
    CNIC = '35205-6666666-7';

-- Bed allocations
INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-01',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '101'
    )
WHERE
    s.CNIC = '35202-1234567-1'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-05',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '101'
    )
WHERE
    s.CNIC = '35202-7654321-8'
    AND b.BedNumber = 2;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-10',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '102'
    )
WHERE
    s.CNIC = '35202-9876543-5'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-12',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '103'
    )
WHERE
    s.CNIC = '35202-1111111-2'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-14',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '103'
    )
WHERE
    s.CNIC = '35201-2222222-3'
    AND b.BedNumber = 2;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-16',
    '2026-08-01'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '203'
    )
WHERE
    s.CNIC = '35203-3333333-4'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-18',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'Girls Hostel'
            )
            AND RoomNumber = '101'
    )
WHERE
    s.CNIC = '35201-4444444-5'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-20',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '202'
    )
WHERE
    s.CNIC = '35204-5555555-6'
    AND b.BedNumber = 1;

INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
SELECT
    a.AdmissionID,
    b.BedID,
    '2026-07-22',
    NULL
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN Bed b ON b.RoomID = (
        SELECT
            RoomID
        FROM
            Room
        WHERE
            HostelID = (
                SELECT
                    HostelID
                FROM
                    Hostel
                WHERE
                    HostelName = 'City Boys Hostel'
            )
            AND RoomNumber = '202'
    )
WHERE
    s.CNIC = '35205-6666666-7'
    AND b.BedNumber = 2;

-- Electricity bills
INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    285.50,
    8565.00,
    '2026-08-05',
    'Pending'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '101';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    190.00,
    5700.00,
    '2026-08-05',
    'Paid'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '102';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    95.75,
    2872.50,
    '2026-08-05',
    'Pending'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '201';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    310.25,
    9307.50,
    '2026-08-10',
    'Pending'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '103';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    142.80,
    4284.00,
    '2026-08-10',
    'Pending'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '202';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    78.40,
    2352.00,
    '2026-08-10',
    'Paid'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'City Boys Hostel'
    )
    AND RoomNumber = '203';

INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
SELECT
    RoomID,
    115.60,
    3468.00,
    '2026-08-10',
    'Pending'
FROM
    Room
WHERE
    HostelID = (
        SELECT
            HostelID
        FROM
            Hostel
        WHERE
            HostelName = 'Girls Hostel'
    )
    AND RoomNumber = '101';

-- Laundry item types
INSERT INTO
    LaundryItemType (ItemName, CurrentPrice, Status)
VALUES
    ('Shirt', 80.00, 'Active'),
    ('Trouser', 100.00, 'Active'),
    ('Blanket', 250.00, 'Active'),
    ('Jacket', 200.00, 'Active'),
    ('Bedsheet', 150.00, 'Active'),
    ('Pillowcase', 70.00, 'Active'),
    ('Towel', 120.00, 'Active');

-- Laundry transactions and items
INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-15',
    260.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1234567-1';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-18',
    450.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-7654321-8';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-25',
    380.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1111111-2';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-26',
    200.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-2222222-3';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-27',
    450.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-4444444-5';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-28',
    300.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35204-5555555-6';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    2,
    80.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Shirt'
WHERE
    s.CNIC = '35202-1234567-1'
    AND lt.LaundryDate = '2026-07-15';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    100.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Trouser'
WHERE
    s.CNIC = '35202-1234567-1'
    AND lt.LaundryDate = '2026-07-15';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    250.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Blanket'
WHERE
    s.CNIC = '35202-7654321-8'
    AND lt.LaundryDate = '2026-07-18';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    150.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Bedsheet'
WHERE
    s.CNIC = '35202-7654321-8'
    AND lt.LaundryDate = '2026-07-18';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    3,
    80.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Shirt'
WHERE
    s.CNIC = '35202-1111111-2'
    AND lt.LaundryDate = '2026-07-25';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    200.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Jacket'
WHERE
    s.CNIC = '35202-1111111-2'
    AND lt.LaundryDate = '2026-07-25';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    2,
    100.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Trouser'
WHERE
    s.CNIC = '35201-2222222-3'
    AND lt.LaundryDate = '2026-07-26';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    250.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Blanket'
WHERE
    s.CNIC = '35201-4444444-5'
    AND lt.LaundryDate = '2026-07-27';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    2,
    150.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Bedsheet'
WHERE
    s.CNIC = '35204-5555555-6'
    AND lt.LaundryDate = '2026-07-28';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    80.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Shirt'
WHERE
    s.CNIC = '35204-5555555-6'
    AND lt.LaundryDate = '2026-07-28';

-- Meal usage
INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-20',
    'Breakfast',
    250.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1234567-1';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-20',
    'Dinner',
    400.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1234567-1';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-20',
    'Lunch',
    350.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-7654321-8';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-21',
    'Breakfast',
    250.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-9876543-5';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-24',
    'Breakfast',
    250.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1111111-2';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-24',
    'Lunch',
    350.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1111111-2';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-24',
    'Dinner',
    400.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-2222222-3';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-25',
    'Breakfast',
    250.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35203-3333333-4';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-25',
    'Lunch',
    350.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-4444444-5';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-26',
    'Dinner',
    400.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35204-5555555-6';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-26',
    'Breakfast',
    250.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35205-6666666-7';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-27',
    'Lunch',
    350.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35205-6666666-7';

-- Complaint categories
INSERT INTO
    ComplaintCategory (CategoryName)
VALUES
    ('Electricity'),
    ('Water'),
    ('Internet'),
    ('Cleaning'),
    ('Furniture'),
    ('Maintenance'),
    ('Noise');

INSERT INTO
    Student (
        FullName,
        CNIC,
        Phone,
        Gender,
        DateOfBirth,
        Address,
        EmergencyContactName,
        EmergencyContactPhone,
        Status
    )
VALUES
    (
        'Farah Jamil',
        '35208-9999999-0',
        '0313-9999999',
        'Female',
        '2002-05-06',
        'Islamabad',
        'Jamil Qureshi',
        '0313-1111111',
        'Active'
    );

INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
SELECT
    StudentID,
    '2026-07-29',
    NULL
FROM
    Student
WHERE
    CNIC = '35208-9999999-0';

INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
SELECT
    a.AdmissionID,
    '2026-07-29',
    'Lunch',
    350.00,
    'Paid'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35208-9999999-0';

INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
SELECT
    a.AdmissionID,
    '2026-07-29',
    220.00,
    'Pending'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35208-9999999-0';

INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
SELECT
    lt.LaundryID,
    lit.ItemTypeID,
    1,
    120.00
FROM
    LaundryTransaction lt
    JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN LaundryItemType lit ON lit.ItemName = 'Towel'
WHERE
    s.CNIC = '35208-9999999-0'
    AND lt.LaundryDate = '2026-07-29';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Requested a new mattress for the bed.',
    'Open',
    '2026-07-30',
    NULL,
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Furniture'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35208-9999999-0';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Naeem Jamil',
    '35208-8888888-8',
    'Father',
    '2026-07-30 16:00:00',
    '2026-07-30 16:45:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35208-9999999-0';

-- Complaints
INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Internet is not working in Room 101.',
    'In Progress',
    '2026-07-18',
    NULL,
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Internet'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35202-1234567-1';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Water supply is interrupted.',
    'Resolved',
    '2026-07-16',
    '2026-07-17',
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Water'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35202-7654321-8';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Room fan is not working properly.',
    'Open',
    '2026-07-24',
    NULL,
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Maintenance'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35202-1111111-2';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Loud music from neighboring room after midnight.',
    'In Progress',
    '2026-07-25',
    NULL,
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Noise'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35201-2222222-3';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Bathroom cleaning was delayed for two days.',
    'Resolved',
    '2026-07-19',
    '2026-07-20',
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Cleaning'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35203-3333333-4';

INSERT INTO
    Complaint (
        AdmissionID,
        CategoryID,
        Description,
        Status,
        CreatedDate,
        ResolvedDate,
        AssignedEmployeeID
    )
SELECT
    a.AdmissionID,
    cc.CategoryID,
    'Power outage affected the study desk lights.',
    'Closed',
    '2026-07-27',
    '2026-07-28',
    e.EmployeeID
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
    JOIN ComplaintCategory cc ON cc.CategoryName = 'Electricity'
    JOIN Employee e ON e.Username = 'warden'
WHERE
    s.CNIC = '35204-5555555-6';

-- Visitors
INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Ahmed Khan',
    '35202-5555555-5',
    'Father',
    '2026-07-22 14:00:00',
    '2026-07-22 15:00:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1234567-1';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Ali Tariq',
    '35202-6666666-6',
    'Brother',
    '2026-07-23 16:30:00',
    '2026-07-23 17:15:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-7654321-8';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Rashid Ali',
    '35202-9999999-9',
    'Uncle',
    '2026-07-25 13:00:00',
    '2026-07-25 14:00:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35202-1111111-2';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Sadia Hassan',
    '35201-8888888-8',
    'Sister',
    '2026-07-26 15:30:00',
    '2026-07-26 16:10:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-2222222-3';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Yasir Ahmed',
    '35201-7777777-7',
    'Brother',
    '2026-07-27 11:15:00',
    '2026-07-27 12:00:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35201-4444444-5';

INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
SELECT
    a.AdmissionID,
    'Muneeb Mehmood',
    '35205-5555555-5',
    'Father',
    '2026-07-28 17:00:00',
    '2026-07-28 17:45:00'
FROM
    Admission a
    JOIN Student s ON s.StudentID = a.StudentID
WHERE
    s.CNIC = '35205-6666666-7';