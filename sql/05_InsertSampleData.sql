-- Role
INSERT INTO
    Role (RoleName)
VALUES
    ('Owner'),
    ('Receptionist'),
    ('Warden'),
    ('Accountant');

-- Hostel
INSERT INTO
    Hostel (HostelName, Address, OfficialPhone, Status)
VALUES
    (
        'City Boys Hostel',
        'Johar Town, Lahore',
        '0300-1111111',
        'Active'
    );

-- Student
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
    );

-- Employee
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
        1,
        'Active'
    ),
    (
        'Sara Malik',
        '35202-2222222-2',
        '0300-5552222',
        'reception',
        'hashed_password_2',
        2,
        'Active'
    ),
    (
        'Bilal Haider',
        '35202-3333333-3',
        '0300-5553333',
        'warden',
        'hashed_password_3',
        3,
        'Active'
    ),
    (
        'Ayesha Noor',
        '35202-4444444-4',
        '0300-5554444',
        'accountant',
        'hashed_password_4',
        4,
        'Active'
    );

-- Room
INSERT INTO
    Room (HostelID, RoomNumber, Floor, Capacity, Status)
VALUES
    (1, '101', 1, 2, 'Occupied'),
    (1, '102', 1, 3, 'Occupied'),
    (1, '201', 2, 4, 'Available');

-- Bed
INSERT INTO
    Bed (RoomID, BedNumber, Status)
VALUES
    -- Room 101
    (1, 1, 'Occupied'),
    (1, 2, 'Occupied'),
    -- Room 102
    (2, 1, 'Occupied'),
    (2, 2, 'Available'),
    (2, 3, 'Available'),
    -- Room 201
    (3, 1, 'Available'),
    (3, 2, 'Available'),
    (3, 3, 'Available'),
    (3, 4, 'Available');

--Admission
INSERT INTO
    Admission (StudentID, AdmissionDate, LeavingDate)
VALUES
    (1, '2026-07-01', NULL),
    (2, '2026-07-05', NULL),
    (3, '2026-07-10', NULL);

-- BedAllocation
INSERT INTO
    BedAllocation (AdmissionID, BedID, StartDate, EndDate)
VALUES
    (1, 1, '2026-07-01', NULL),
    (2, 2, '2026-07-05', NULL),
    (3, 3, '2026-07-10', NULL);

-- ElectricityBill
INSERT INTO
    ElectricityBill (RoomID, UnitsConsumed, Amount, DueDate, Status)
VALUES
    (1, 285.50, 8565.00, '2026-08-05', 'Pending'),
    (2, 190.00, 5700.00, '2026-08-05', 'Paid'),
    (3, 95.75, 2872.50, '2026-08-05', 'Pending');

-- LaundryItemType
INSERT INTO
    LaundryItemType (ItemName, CurrentPrice, Status)
VALUES
    ('Shirt', 80.00, 'Active'),
    ('Trouser', 100.00, 'Active'),
    ('Blanket', 250.00, 'Active'),
    ('Jacket', 200.00, 'Active'),
    ('Bedsheet', 150.00, 'Active');

-- LaundryTransaction
INSERT INTO
    LaundryTransaction (
        AdmissionID,
        LaundryDate,
        TotalAmount,
        PaymentStatus
    )
VALUES
    (1, '2026-07-15', 260.00, 'Paid'),
    (2, '2026-07-18', 450.00, 'Pending');

-- LaundryItem
INSERT INTO
    LaundryItem (LaundryID, ItemTypeID, Quantity, UnitPrice)
VALUES
    (1, 1, 2, 80.00),
    (1, 2, 1, 100.00),
    (2, 3, 1, 250.00),
    (2, 5, 1, 150.00),
    (2, 1, 1, 50.00);

-- MealUsage
INSERT INTO
    MealUsage (AdmissionID, MealDate, MealType, Price, Status)
VALUES
    (1, '2026-07-20', 'Breakfast', 250.00, 'Paid'),
    (1, '2026-07-20', 'Dinner', 400.00, 'Pending'),
    (2, '2026-07-20', 'Lunch', 350.00, 'Paid'),
    (3, '2026-07-21', 'Breakfast', 250.00, 'Pending');

-- ComplaintCategory
INSERT INTO
    ComplaintCategory (CategoryName)
VALUES
    ('Electricity'),
    ('Water'),
    ('Internet'),
    ('Cleaning'),
    ('Furniture');

-- Complaint
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
VALUES
    (
        1,
        3,
        'Internet is not working in Room 101.',
        'In Progress',
        '2026-07-18',
        NULL,
        3
    ),
    (
        2,
        2,
        'Water supply is interrupted.',
        'Resolved',
        '2026-07-16',
        '2026-07-17',
        3
    );

-- Visitor
INSERT INTO
    Visitor (
        AdmissionID,
        VisitorName,
        CNIC,
        Relationship,
        CheckIn,
        CheckOut
    )
VALUES
    (
        1,
        'Ahmed Khan',
        '35202-5555555-5',
        'Father',
        '2026-07-22 14:00:00',
        '2026-07-22 15:00:00'
    ),
    (
        2,
        'Ali Tariq',
        '35202-6666666-6',
        'Brother',
        '2026-07-23 16:30:00',
        '2026-07-23 17:15:00'
    );