-- Table: Hostel
CREATE TABLE
    Hostel (
        HostelID BIGSERIAL PRIMARY KEY,
        HostelName VARCHAR(100) NOT NULL,
        Address TEXT NOT NULL,
        OfficialPhone VARCHAR(20) NOT NULL,
        Status active_status_enum NOT NULL DEFAULT 'Active'
    );

-- Table: Role
CREATE TABLE
    Role (
        RoleID BIGSERIAL PRIMARY KEY,
        RoleName VARCHAR(50) NOT NULL UNIQUE
    );

-- Table: Student
CREATE TABLE
    Student (
        StudentID BIGSERIAL PRIMARY KEY,
        FullName VARCHAR(100) NOT NULL,
        CNIC VARCHAR(15) NOT NULL UNIQUE,
        Phone VARCHAR(20) NOT NULL,
        Gender gender_enum NOT NULL,
        DateOfBirth DATE NOT NULL,
        Address TEXT NOT NULL,
        EmergencyContactName VARCHAR(100) NOT NULL,
        EmergencyContactPhone VARCHAR(20) NOT NULL,
        Status student_status_enum NOT NULL DEFAULT 'Active'
    );

-- Table: Employee
CREATE TABLE
    Employee (
        EmployeeID BIGSERIAL PRIMARY KEY,
        FullName VARCHAR(100) NOT NULL,
        CNIC VARCHAR(15) NOT NULL UNIQUE,
        Phone VARCHAR(20) NOT NULL,
        Username VARCHAR(50) NOT NULL UNIQUE,
        PasswordHash TEXT NOT NULL,
        RoleID BIGINT NOT NULL,
        Status employee_status_enum NOT NULL DEFAULT 'Active',
        CONSTRAINT FK_Employee_Role FOREIGN KEY (RoleID) REFERENCES Role (RoleID)
    );

-- Table: Room
CREATE TABLE
    Room (
        RoomID BIGSERIAL PRIMARY KEY,
        HostelID BIGINT NOT NULL,
        RoomNumber VARCHAR(10) NOT NULL,
        Floor INTEGER NOT NULL,
        Capacity SMALLINT NOT NULL,
        Status occupancy_status_enum NOT NULL DEFAULT 'Available',
        CONSTRAINT FK_Room_Hostel FOREIGN KEY (HostelID) REFERENCES Hostel (HostelID),
        CONSTRAINT UQ_Room_Hostel_RoomNumber UNIQUE (HostelID, RoomNumber),
        CONSTRAINT CHK_Room_Capacity CHECK (Capacity IN (2, 3, 4)),
        CONSTRAINT CHK_Room_Floor CHECK (Floor >= 0)
    );

-- Table: Bed
CREATE TABLE
    Bed (
        BedID BIGSERIAL PRIMARY KEY,
        RoomID BIGINT NOT NULL,
        BedNumber SMALLINT NOT NULL,
        Status occupancy_status_enum NOT NULL DEFAULT 'Available',
        CONSTRAINT FK_Bed_Room FOREIGN KEY (RoomID) REFERENCES Room (RoomID),
        CONSTRAINT UQ_Bed_Room_BedNumber UNIQUE (RoomID, BedNumber),
        CONSTRAINT CHK_Bed_Number CHECK (BedNumber > 0)
    );

-- Table: Admission
CREATE TABLE
    Admission (
        AdmissionID BIGSERIAL PRIMARY KEY,
        StudentID BIGINT NOT NULL,
        AdmissionDate DATE NOT NULL,
        LeavingDate DATE,
        CONSTRAINT FK_Admission_Student FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
        CONSTRAINT CHK_Admission_Dates CHECK (
            LeavingDate IS NULL
            OR LeavingDate >= AdmissionDate
        )
    );

-- Table: BedAllocation
CREATE TABLE
    BedAllocation (
        AllocationID BIGSERIAL PRIMARY KEY,
        AdmissionID BIGINT NOT NULL,
        BedID BIGINT NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE,
        CONSTRAINT FK_BedAllocation_Admission FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID),
        CONSTRAINT FK_BedAllocation_Bed FOREIGN KEY (BedID) REFERENCES Bed (BedID),
        CONSTRAINT CHK_BedAllocation_Dates CHECK (
            EndDate is NULL
            OR EndDate >= StartDate
        )
    );

-- Table: ElectricityBill
CREATE TABLE
    ElectricityBill (
        BillID BIGSERIAL PRIMARY KEY,
        RoomID BIGINT NOT NULL,
        UnitsConsumed NUMERIC(10, 2) NOT NULL,
        Amount NUMERIC(10, 2) NOT NULL,
        DueDate DATE NOT NULL,
        Status payment_status_enum NOT NULL DEFAULT 'Pending',
        CONSTRAINT FK_ElectricityBill_Room FOREIGN KEY (RoomID) REFERENCES Room (RoomID),
        CONSTRAINT CHK_ElectricityBill_Units CHECK (UnitsConsumed >= 0),
        CONSTRAINT CHK_ElectricityBill_Amount CHECK (Amount >= 0)
    );

-- Table: LaundryItemType
CREATE TABLE
    LaundryItemType (
        ItemTypeID BIGSERIAL PRIMARY KEY,
        ItemName VARCHAR(50) NOT NULL UNIQUE,
        CurrentPrice NUMERIC(10, 2) NOT NULL,
        Status active_status_enum NOT NULL DEFAULT 'Active',
        CONSTRAINT CHK_LaundryItemType_Price CHECK (CurrentPrice >= 0)
    );

-- Table: LaundryTransaction
CREATE TABLE
    LaundryTransaction (
        LaundryID BIGSERIAL PRIMARY KEY,
        AdmissionID BIGINT NOT NULL,
        LaundryDate DATE NOT NULL,
        TotalAmount NUMERIC(10, 2) NOT NULL DEFAULT 0,
        PaymentStatus payment_status_enum NOT NULL DEFAULT 'Pending',
        CONSTRAINT FK_LaundryTransaction_Admission FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID),
        CONSTRAINT CHK_LaundryTransaction_Total CHECK (TotalAmount >= 0)
    );

-- Table: LaundryItem
CREATE TABLE
    LaundryItem (
        LaundryItemID BIGSERIAL PRIMARY KEY,
        LaundryID BIGINT NOT NULL,
        ItemTypeID BIGINT NOT NULL,
        Quantity INTEGER NOT NULL,
        UnitPrice NUMERIC(10, 2) NOT NULL,
        CONSTRAINT FK_LaundryItem_Transaction FOREIGN KEY (LaundryID) REFERENCES LaundryTransaction (LaundryID),
        CONSTRAINT FK_LaundryItem_ItemType FOREIGN KEY (ItemTypeID) REFERENCES LaundryItemType (ItemTypeID),
        CONSTRAINT CHK_LaundryItem_Quantity CHECK (Quantity > 0),
        CONSTRAINT CHK_LaundryItem_UnitPrice CHECK (UnitPrice >= 0)
    );

-- Table: MealUsage
CREATE TABLE
    MealUsage (
        MealID BIGSERIAL PRIMARY KEY,
        AdmissionID BIGINT NOT NULL,
        MealDate DATE NOT NULL,
        MealType meal_type_enum NOT NULL,
        Price NUMERIC(10, 2) NOT NULL,
        Status payment_status_enum NOT NULL DEFAULT 'Pending',
        CONSTRAINT FK_MealUsage_Admission FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID),
        CONSTRAINT CHK_MealUsage_Price CHECK (Price >= 0)
    );

-- Table: ComplaintCategory
CREATE TABLE
    ComplaintCategory (
        CategoryID BIGSERIAL PRIMARY KEY,
        CategoryName VARCHAR(100) NOT NULL UNIQUE
    );

-- Table: Complaint
CREATE TABLE
    Complaint (
        ComplaintID BIGSERIAL PRIMARY KEY,
        AdmissionID BIGINT NOT NULL,
        CategoryID BIGINT NOT NULL,
        Description TEXT NOT NULL,
        Status complaint_status_enum NOT NULL DEFAULT 'Open',
        CreatedDate DATE NOT NULL,
        ResolvedDate DATE,
        AssignedEmployeeID BIGINT,
        CONSTRAINT FK_Complaint_Admission FOREIGN KEY (AdmissionID) REFERENCES Admission (AdmissionID),
        CONSTRAINT FK_Complaint_Category FOREIGN KEY (CategoryID) REFERENCES ComplaintCategory (CategoryID),
        CONSTRAINT FK_Complaint_Employee FOREIGN KEY (AssignedEmployeeID) REFERENCES Employee (EmployeeID),
        CONSTRAINT CHK_Complaint_Dates CHECK (
            ResolvedDate IS NULL
            OR ResolvedDate >= CreatedDate
        )
    );