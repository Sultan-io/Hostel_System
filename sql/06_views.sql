/*View: vw_CurrentResidents
Description:
Displays students who are currently residing in the hostel,
along with their current bed, room, and hostel information.*/
CREATE
OR REPLACE VIEW vw_CurrentResidents AS
SELECT
    s.StudentID,
    s.FullName AS StudentName,
    s.CNIC,
    s.Phone AS StudentPhone,
    s.Gender,
    s.Status AS StudentStatus,
    a.AdmissionID,
    a.AdmissionDate,
    ba.AllocationID,
    ba.StartDate AS BedAllocationStart,
    b.BedID,
    b.BedNumber,
    r.RoomID,
    r.RoomNumber,
    r.Floor,
    h.HostelID,
    h.HostelName
FROM
    Admission a
    INNER JOIN Student s ON s.StudentID = a.StudentID
    INNER JOIN BedAllocation ba ON ba.AdmissionID = a.AdmissionID
    AND ba.EndDate IS NULL
    INNER JOIN Bed b ON b.BedID = ba.BedID
    INNER JOIN Room r ON r.RoomID = b.RoomID
    INNER JOIN Hostel h ON h.HostelID = r.HostelID
WHERE
    a.LeavingDate IS NULL;

/* View: vw_BedCurrentStatus
Description:
Shows the actual occupancy status of every bed by checking
active bed allocations instead of relying only on Bed.Status.*/
CREATE
OR REPLACE VIEW vw_BedCurrentStatus AS
SELECT
    b.BedID,
    b.BedNumber,
    r.RoomID,
    r.RoomNumber,
    h.HostelID,
    h.HostelName,
    CASE
        WHEN ba.AllocationID IS NULL THEN 'Available'
        ELSE 'Occupied'
    END AS DerivedStatus,
    b.Status AS RecordedStatus,
    ba.AdmissionID,
    s.StudentID,
    s.FullName AS OccupantName
FROM
    Bed b
    INNER JOIN Room r ON r.RoomID = b.RoomID
    INNER JOIN Hostel h ON h.HostelID = r.HostelID
    LEFT JOIN BedAllocation ba ON ba.BedID = b.BedID
    AND ba.EndDate IS NULL
    LEFT JOIN Admission a ON a.AdmissionID = ba.AdmissionID
    LEFT JOIN Student s ON s.StudentID = a.StudentID;

/*View: vw_VacantBeds
Description:
Displays all currently available beds.
Used during new student admissions.*/
CREATE
OR REPLACE VIEW vw_VacantBeds AS
SELECT
    BedID,
    BedNumber,
    RoomID,
    RoomNumber,
    HostelID,
    HostelName
FROM
    vw_BedCurrentStatus
WHERE
    DerivedStatus = 'Available';

/*View: vw_RoomOccupancy
Description:
Displays occupancy statistics for each room,
including capacity, occupied beds, and vacant beds.*/
CREATE
OR REPLACE VIEW vw_RoomOccupancy AS
SELECT
    r.RoomID,
    r.RoomNumber,
    r.Floor,
    h.HostelID,
    h.HostelName,
    r.Capacity,
    COUNT(bcs.BedID) FILTER (
        WHERE
            bcs.DerivedStatus = 'Occupied'
    ) AS BedsOccupied,
    r.Capacity - COUNT(bcs.BedID) FILTER (
        WHERE
            bcs.DerivedStatus = 'Occupied'
    ) AS BedsVacant
FROM
    Room r
    INNER JOIN Hostel h ON h.HostelID = r.HostelID
    LEFT JOIN vw_BedCurrentStatus bcs ON bcs.RoomID = r.RoomID
GROUP BY
    r.RoomID,
    r.RoomNumber,
    r.Floor,
    h.HostelID,
    h.HostelName,
    r.Capacity;

/*View: vw_HostelOccupancySummary
Description:
Displays hostel-level occupancy statistics including
total beds, occupied beds, vacant beds, and occupancy rate*/
CREATE
OR REPLACE VIEW vw_HostelOccupancySummary AS
SELECT
    h.HostelID,
    h.HostelName,
    COUNT(b.BedID) AS TotalBeds,
    COUNT(b.BedID) FILTER (
        WHERE
            bcs.DerivedStatus = 'Occupied'
    ) AS OccupiedBeds,
    COUNT(b.BedID) FILTER (
        WHERE
            bcs.DerivedStatus = 'Available'
    ) AS VacantBeds,
    ROUND(
        (
            COUNT(b.BedID) FILTER (
                WHERE
                    bcs.DerivedStatus = 'Occupied'
            ) * 100.0
        ) / NULLIF(COUNT(b.BedID), 0),
        2
    ) AS OccupancyRatePercentage
FROM
    Hostel h
    INNER JOIN Room r ON r.HostelID = h.HostelID
    INNER JOIN Bed b ON b.RoomID = r.RoomID
    LEFT JOIN vw_BedCurrentStatus bcs ON bcs.BedID = b.BedID
GROUP BY
    h.HostelID,
    h.HostelName;

/*View: vw_AdmissionHistory
Description:
Displays complete admission history of every student,
including current and past admissions.*/
CREATE
OR REPLACE VIEW vw_AdmissionHistory AS
SELECT
    s.StudentID,
    s.FullName AS StudentName,
    a.AdmissionID,
    a.AdmissionDate,
    a.LeavingDate,
    CASE
        WHEN a.LeavingDate IS NULL THEN 'Current'
        ELSE 'Past'
    END AS AdmissionStatus,
    (
        COALESCE(a.LeavingDate, CURRENT_DATE) - a.AdmissionDate
    ) AS StayDurationDays
FROM
    Admission a
    INNER JOIN Student s ON s.StudentID = a.StudentID
ORDER BY
    a.AdmissionDate DESC;

/*View: vw_ElectricityBillStatus
Description:
Displays electricity bills with room and hostel details.*/
CREATE
OR REPLACE VIEW vw_ElectricityBillStatus AS
SELECT
    eb.BillID,
    h.HostelID,
    h.HostelName,
    r.RoomID,
    r.RoomNumber,
    eb.UnitsConsumed,
    eb.Amount,
    eb.DueDate,
    eb.Status,
    CASE
        WHEN eb.Status = 'Pending'
        AND eb.DueDate < CURRENT_DATE THEN TRUE
        ELSE FALSE
    END AS IsOverdue
FROM
    ElectricityBill eb
    INNER JOIN Room r ON r.RoomID = eb.RoomID
    INNER JOIN Hostel h ON h.HostelID = r.HostelID;

/*View: vw_StudentLaundryLedger
Description:
Displays laundry transactions for each student.*/
CREATE
OR REPLACE VIEW vw_StudentLaundryLedger AS
SELECT
    s.StudentID,
    s.FullName AS StudentName,
    a.AdmissionID,
    lt.LaundryID,
    lt.LaundryDate,
    lt.TotalAmount,
    lt.PaymentStatus
FROM
    LaundryTransaction lt
    INNER JOIN Admission a ON a.AdmissionID = lt.AdmissionID
    INNER JOIN Student s ON s.StudentID = a.StudentID;

/*View: vw_StudentMealLedger
Description:
Displays meal usage records for each student.*/
CREATE
OR REPLACE VIEW vw_StudentMealLedger AS
SELECT
    s.StudentID,
    s.FullName AS StudentName,
    a.AdmissionID,
    mu.MealID,
    mu.MealDate,
    mu.MealType,
    mu.Price,
    mu.Status
FROM
    MealUsage mu
    INNER JOIN Admission a ON a.AdmissionID = mu.AdmissionID
    INNER JOIN Student s ON s.StudentID = a.StudentID;

/*View: vw_StudentOutstandingDues
Description:
Displays outstanding laundry and meal charges
for students currently residing in the hostel.*/
CREATE
OR REPLACE VIEW vw_StudentOutstandingDues AS
SELECT
    cr.StudentID,
    cr.StudentName,
    cr.HostelID,
    cr.HostelName,
    COALESCE(
        SUM(lt.TotalAmount) FILTER (
            WHERE
                lt.PaymentStatus = 'Pending'
        ),
        0
    ) AS LaundryPending,
    COALESCE(
        SUM(mu.Price) FILTER (
            WHERE
                mu.Status = 'Pending'
        ),
        0
    ) AS MealPending,
    COALESCE(
        SUM(lt.TotalAmount) FILTER (
            WHERE
                lt.PaymentStatus = 'Pending'
        ),
        0
    ) + COALESCE(
        SUM(mu.Price) FILTER (
            WHERE
                mu.Status = 'Pending'
        ),
        0
    ) AS TotalOutstanding
FROM
    vw_CurrentResidents cr
    LEFT JOIN LaundryTransaction lt ON lt.AdmissionID = cr.AdmissionID
    LEFT JOIN MealUsage mu ON mu.AdmissionID = cr.AdmissionID
GROUP BY
    cr.StudentID,
    cr.StudentName,
    cr.HostelID,
    cr.HostelName;

/*View: vw_MonthlyServiceRevenue
Description:
Displays monthly revenue collected from
laundry and meal services.*/
CREATE
OR REPLACE VIEW vw_MonthlyServiceRevenue AS
SELECT
    CAST(DATE_TRUNC ('month', ActivityDate) AS DATE) AS RevenueMonth,
    RevenueSource,
    SUM(Amount) AS TotalRevenue
FROM
    (
        SELECT
            LaundryDate AS ActivityDate,
            TotalAmount AS Amount,
            'Laundry' AS RevenueSource
        FROM
            LaundryTransaction
        WHERE
            PaymentStatus = 'Paid'
        UNION ALL
        SELECT
            MealDate,
            Price,
            'Meals'
        FROM
            MealUsage
        WHERE
            Status = 'Paid'
    ) RevenueData
GROUP BY
    DATE_TRUNC ('month', ActivityDate),
    RevenueSource
ORDER BY
    RevenueMonth DESC,
    RevenueSource;

/*View: vw_OpenComplaints
Description:
Displays all open and in-progress complaints with
student, room, hostel, category, and assigned employee.*/
CREATE
OR REPLACE VIEW vw_OpenComplaints AS
SELECT
    c.ComplaintID,
    s.StudentID,
    s.FullName AS StudentName,
    h.HostelID,
    h.HostelName,
    r.RoomNumber,
    cc.CategoryName,
    c.Description,
    c.Status,
    c.CreatedDate,
    (CURRENT_DATE - c.CreatedDate) AS DaysOpen,
    e.FullName AS AssignedTo
FROM
    Complaint c
    INNER JOIN Admission a ON a.AdmissionID = c.AdmissionID
    INNER JOIN Student s ON s.StudentID = a.StudentID
    INNER JOIN ComplaintCategory cc ON cc.CategoryID = c.CategoryID
    LEFT JOIN Employee e ON e.EmployeeID = c.AssignedEmployeeID
    LEFT JOIN BedAllocation ba ON ba.AdmissionID = a.AdmissionID
    AND ba.EndDate IS NULL
    LEFT JOIN Bed b ON b.BedID = ba.BedID
    LEFT JOIN Room r ON r.RoomID = b.RoomID
    LEFT JOIN Hostel h ON h.HostelID = r.HostelID
WHERE
    c.Status IN ('Open', 'In Progress');

/*View: vw_ActiveVisitors
Description:
Displays visitors currently inside the hostel.*/
CREATE
OR REPLACE VIEW vw_ActiveVisitors AS
SELECT
    v.VisitorID,
    v.VisitorName,
    v.CNIC,
    v.Relationship,
    v.CheckIn,
    s.StudentID,
    s.FullName AS VisitingStudent,
    h.HostelID,
    h.HostelName,
    r.RoomNumber
FROM
    Visitor v
    INNER JOIN Admission a ON a.AdmissionID = v.AdmissionID
    INNER JOIN Student s ON s.StudentID = a.StudentID
    LEFT JOIN BedAllocation ba ON ba.AdmissionID = a.AdmissionID
    AND ba.EndDate IS NULL
    LEFT JOIN Bed b ON b.BedID = ba.BedID
    LEFT JOIN Room r ON r.RoomID = b.RoomID
    LEFT JOIN Hostel h ON h.HostelID = r.HostelID
WHERE
    v.CheckOut IS NULL;

/*View: vw_VisitorLog
Description:
Displays complete visitor history along with
visit duration in minutes.*/
CREATE
OR REPLACE VIEW vw_VisitorLog AS
SELECT
    v.VisitorID,
    v.VisitorName,
    v.CNIC,
    v.Relationship,
    s.StudentID,
    s.FullName AS VisitingStudent,
    h.HostelID,
    h.HostelName,
    r.RoomNumber,
    v.CheckIn,
    v.CheckOut,
    CASE
        WHEN v.CheckOut IS NOT NULL THEN ROUND(
            EXTRACT(
                EPOCH
                FROM
                    (v.CheckOut - v.CheckIn)
            ) / 60.0,
            0
        )
        ELSE NULL
    END AS VisitDurationMinutes
FROM
    Visitor v
    INNER JOIN Admission a ON a.AdmissionID = v.AdmissionID
    INNER JOIN Student s ON s.StudentID = a.StudentID
    LEFT JOIN BedAllocation ba ON ba.AdmissionID = a.AdmissionID
    AND ba.EndDate IS NULL
    LEFT JOIN Bed b ON b.BedID = ba.BedID
    LEFT JOIN Room r ON r.RoomID = b.RoomID
    LEFT JOIN Hostel h ON h.HostelID = r.HostelID
ORDER BY
    v.CheckIn DESC;