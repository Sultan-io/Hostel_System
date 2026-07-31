-- Foreign Key Indexes
CREATE INDEX IDX_Room_HostelID ON Room (HostelID);
CREATE INDEX IDX_Bed_RoomID ON Bed (RoomID);
CREATE INDEX IDX_Employee_RoleID ON Employee (RoleID);
CREATE INDEX IDX_Admission_StudentID ON Admission (StudentID);
CREATE INDEX IDX_BedAllocation_AdmissionID ON BedAllocation (AdmissionID);
CREATE INDEX IDX_BedAllocation_BedID ON BedAllocation (BedID);
CREATE INDEX IDX_ElectricityBill_RoomID ON ElectricityBill (RoomID);
CREATE INDEX IDX_LaundryTransaction_AdmissionID ON LaundryTransaction (AdmissionID);
CREATE INDEX IDX_LaundryItem_LaundryID ON LaundryItem (LaundryID);
CREATE INDEX IDX_LaundryItem_ItemTypeID ON LaundryItem (ItemTypeID);
CREATE INDEX IDX_MealUsage_AdmissionID ON MealUsage (AdmissionID);
CREATE INDEX IDX_Complaint_AdmissionID ON Complaint (AdmissionID);
CREATE INDEX IDX_Complaint_CategoryID ON Complaint (CategoryID);
CREATE INDEX IDX_Complaint_AssignedEmployeeID ON Complaint (AssignedEmployeeID);
CREATE INDEX IDX_Visitor_AdmissionID ON Visitor (AdmissionID);

-- Search Indexes
CREATE INDEX IDX_Student_FullName
ON Student (FullName);
CREATE INDEX IDX_Student_Phone
ON Student (Phone);
CREATE INDEX IDX_Employee_FullName
ON Employee (FullName);
CREATE INDEX IDX_Employee_Phone
ON Employee (Phone);

-- Status Indexes
CREATE INDEX IDX_Bed_Status
ON Bed (Status);
CREATE INDEX IDX_Room_Status
ON Room (Status);
CREATE INDEX IDX_Student_Status
ON Student (Status);
CREATE INDEX IDX_Employee_Status
ON Employee (Status);
CREATE INDEX IDX_ElectricityBill_Status
ON ElectricityBill (Status);
CREATE INDEX IDX_LaundryTransaction_Status
ON LaundryTransaction (PaymentStatus);
CREATE INDEX IDX_MealUsage_Status
ON MealUsage (Status);
CREATE INDEX IDX_Complaint_Status
ON Complaint (Status);

-- Date Indexes
CREATE INDEX IDX_Admission_AdmissionDate
ON Admission (AdmissionDate);
CREATE INDEX IDX_BedAllocation_StartDate
ON BedAllocation (StartDate);
CREATE INDEX IDX_ElectricityBill_DueDate
ON ElectricityBill (DueDate);
CREATE INDEX IDX_LaundryTransaction_Date
ON LaundryTransaction (LaundryDate);
CREATE INDEX IDX_MealUsage_Date
ON MealUsage (MealDate);
CREATE INDEX IDX_Complaint_CreatedDate
ON Complaint (CreatedDate);
CREATE INDEX IDX_Visitor_CheckIn
ON Visitor (CheckIn);