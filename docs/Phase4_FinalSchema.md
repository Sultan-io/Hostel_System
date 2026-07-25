# Hostel Management System Database Design
## Phase 4 Summary (Entities & Attributes)

### Project
Design a production-ready PostgreSQL database for a real hostel owner.

## Business Rules
- Multiple hostels (future expansion).
- Students rent **beds**, not rooms.
- Rooms have capacities (2/3/4 beds).
- Electricity is billed **per room**.
- Rent is monthly (due on the 1st), cash only, no partial payments.
- Laundry is optional and charged per use.
- Meals are optional and charged per meal.
- Students may transfer rooms and hostels.
- Visitors are recorded.
- Students may submit complaints.

## Final Tables

### Hostel
- HostelID
- HostelName
- Address
- OfficialPhone
- Status

### Room
- RoomID
- HostelID
- RoomNumber
- Floor
- Capacity
- Status

### Bed
- BedID
- RoomID
- BedNumber
- Status

### Student
- StudentID
- FullName
- CNIC
- Phone
- Gender
- DateOfBirth
- Address
- EmergencyContactName
- EmergencyContactPhone
- Status

### Role
- RoleID
- RoleName

### Employee
- EmployeeID
- FullName
- CNIC
- Phone
- Username
- PasswordHash
- RoleID
- Status

### Admission
- AdmissionID
- StudentID
- AdmissionDate
- LeavingDate

### BedAllocation
- AllocationID
- AdmissionID
- BedID
- StartDate
- EndDate

### ElectricityBill
- BillID
- RoomID
- UnitsConsumed
- Amount
- DueDate
- Status

### LaundryItemType
- ItemTypeID
- ItemName
- CurrentPrice
- Status

### LaundryTransaction
- LaundryID
- AdmissionID
- LaundryDate
- TotalAmount
- PaymentStatus

### LaundryItem
- LaundryItemID
- LaundryID
- ItemTypeID
- Quantity
- UnitPrice

### MealUsage
- MealID
- AdmissionID
- MealDate
- MealType
- Price
- Status

### ComplaintCategory
- CategoryID
- CategoryName

### Complaint
- ComplaintID
- AdmissionID
- CategoryID
- Description
- Status
- CreatedDate
- ResolvedDate
- AssignedEmployeeID

### Visitor
- VisitorID
- AdmissionID
- VisitorName
- CNIC
- Relationship
- CheckIn
- CheckOut

---

# Important Design Decisions

- No CreatedAt/UpdatedAt audit fields (except business dates where required).
- New hostel stay = new Admission record.
- Bed history stored in BedAllocation.
- Electricity billed per room.
- Laundry follows Header/Detail design:
  - LaundryTransaction
  - LaundryItem
  - LaundryItemType
- Meal records stored per meal consumed.
- Complaint uses Category instead of Title.
- Employee references Role via RoleID.
- Historical prices stored in LaundryItem.UnitPrice and MealUsage.Price.

# Phase 5 (Next Steps)

1. Define all relationships.
2. Decide cardinality (1:1, 1:N, M:N).
3. Add foreign keys.
4. Decide ON DELETE / ON UPDATE actions.
5. Define business constraints:
   - Unique student CNIC
   - Unique employee username
   - Unique room number within a hostel
   - Unique bed number within a room
   - One active admission per student
   - One active bed allocation per bed
   - CheckOut >= CheckIn
6. Draw the ER Diagram.
7. Implement the schema in PostgreSQL.
8. Add indexes.
9. Create sample data.
10. Build queries, reports, views, and stored procedures if needed.
