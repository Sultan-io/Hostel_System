## Our goals are:

- Define every relationship between tables.
- Decide the cardinality (1:1, 1:N, M:N).
- Decide which table contains the foreign key.
- Decide the ON DELETE action.
- Decide the ON UPDATE action.
- Identify optional vs mandatory relationships.
- Record the business reasoning behind every relationship.

## Relationship 1 — Hostel → Room

### Cardinality

Hostel (1) -------- (Many) Room

## Relationship 2 Room → Bed

### Cardinality

Room (1) -------- (Many) Bed

## Relationship 3 Student → Admission

### Cardinality

Student (1) -------- (Many) Admission

## Relationship 4 Admission → BedAllocation

### Cardinality

Admission (1) -------- (Many) BedAllocation

## Relationship 5 Bed → BedAllocation

### Cardinality

Bed (1) -------- (Many) BedAllocation

## Relationship 6 Room → ElectricityBill

### Cardinality

Room (1) -------- (Many) ElectricityBill

## Relationship 7 Role → Employee

### Cardinality

Role (1) -------- (Many) Employee

## Relationship 8 Admission → LaundryTransaction

### Cardinality

Admission (1) -------- (Many) LaundryTransaction

## Relationship 9 LaundryTransaction → LaundryItem

### Cardinality

LaundryTransaction (1) -------- (Many) LaundryItem

## Relationship 10 LaundryItemType → LaundryItem

### Cardinality

LaundryItemType (1) -------- (Many) LaundryItem

## Relationship 11 Admission → MealUsage

### Cardinality

Admission (1) -------- (Many) MealUsage

## Relationship 12 ComplaintCategory → Complaint

### Cardinality

ComplaintCategory (1) -------- (Many) Complaint

## Relationship 13 Employee → Complaint

### Cardinality

Employee (1) -------- (Many) Complaint

## Relationship 14 Admission → Complaint

### Cardinality

Admission (1) -------- (Many) Complaint

## Relationship 15 Admission → Visitor

### Cardinality

Admission (1) -------- (Many) Visitor
