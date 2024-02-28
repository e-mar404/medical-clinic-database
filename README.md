- [ ] is not implemented in `main.sql`
- [x] has been implemented in `main.sql`

# Entities

- [ ] Company
    - Name
    - Location: references the address table
    - Phone number

- [ ] Clinic
    - Clinic ID: unique identifier
    - Location: references the address table
    - Phone number

- [ ] Patient
    - Patient ID: unique identifier
    - First Name
    - Middle Name: optional
    - Last Name
    - Gender
    - Weight
    - Address: references address table
    - Phone Number
    - Email Address
    - Insurance Information: references insurance information table
    - Financial Information: references financial information table
    - Emergency Contact Information
    - Prefered Pharmacy: foreign key

- [ ] Medical Employee:
    - Employee ID: unique identifier
    - Role Enum of [Medical Roles](#medical-roles)
    - First Name
    - Middle Name
    - Last Name
    - Email
    - Patients

- [ ] Staff Employee:
    - Employee ID: unique identifier
    - Role: Enum of [Staff Roles](#staff-roles)
    - First Name
    - Middle Name
    - Last Name
    - Email

- [ ] Appointments:
    - Date
    - Patient ID
    - Clinics ID
    - Doctor ID
    - Confirmation: notification will be sent to patient to check in for appointment
    - Status: enum of [Status](#status)

- [ ] Medical History:
    - Current Medications:
    - Allergies:
    - Past surgeries/medical procedures
    - Chronic conditions/illnesses
    - Patient ID

- [ ] Insurance Information:
    - Insurance Number
    - Group Number
    - Insurance Name
    - Patient ID

- [ ] Consent Forms:
    - Patient ID
    - Employee ID (PCP)
    - Clinic ID
    - Status

- [ ] Preferred Pharmacy:
    - Pharmacy ID: unique identifier
    - Name
    - Address: refernces address table
    - Phone number

- [ ] Financial Information:
    - Patient ID
    - Card Number: primary key
    - CVV
    - Expiration Date
    - Zip Code
    - Name on Card

- [ ] Medications 
    - Doctor Id
    - Patient Id
    - Medication Name
    - Prescription Date

- [ ] Address
    - Street Line 1
    - Street Line 2: optional
    - City
    - State
    - Zip Code
    - Super Key (all above)

# Enumeration:

## Medical Roles:
- Doctor
- Nurse

## Staff Roles:
- Receptionist
- Admin

## Status:
- Scheduled
- In Progress
- Past
- Canceled

# Constraints:

- [ ] See what constraints we need to add
- [ ] ON DELETE
- [ ] ON UPDATE
