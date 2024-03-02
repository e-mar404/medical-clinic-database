- [ ] is not implemented in `main.sql`
- [x] has been implemented in `main.sql`

# Entities

- [ ] Company
    - Name
    - Location: references an address
    - Phone number
    - Clinics: references a clinic

- [ ] Clinic
    - Clinic ID: unique identifier
    - Location: references an address 
    - Phone number
    - Company: references a company

- [X] Patient
    - Patient ID: unique identifier
    - First Name
    - Middle Name: optional
    - Last Name
    - Gender
    - <del>Weight</del>

- [X] Medical Employee:
    - Employee ID: unique identifier
    - Role Enum of [Medical Roles](#medical-roles)
    - First Name
    - Middle Name
    - Last Name
    - Email 
    - Patients: references 1-M patient(s) *NOT IMPLEMENTED*

- [X] Staff Employee:
    - Employee ID: unique identifier
    - Role: Enum of [Staff Roles](#staff-roles)
    - First Name
    - Middle Name
    - Last Name
    - Email

- [ ] Appointments:
    - Date
    - Patient ID: references a patient
    - Doctor ID: references a doctor
    - Clinics ID: references a clinic
    - Confirmation
    - Status: enum of [Status](#status)

- [X] Contact Information:
    - Address: references address table
    - Phone Number
    - Email
    - Patient ID: references a patient
    
- [ ] Medical History:
    - Current Medications
    - Allergies
    - Past surgeries/medical procedures
    - Chronic conditions/illnesses
    - Patient ID: references a patient

- [X] Insurance Information:
    - Insurance Number
    - Group Number
    - Insurance Name
    - Patient ID
    
- [ ] Consent Forms:
    - Patient ID: references a patient
    - Doctor ID: references a doctor
    - Clinics ID: references a clinic
    - Confirmation 

- [ ] Preferred Pharmacy:
    - Pharmacy ID: unique identifier
    - Name
    - Address: refernces an address
    - Phone number

- [X] Financial Information:
    - Patient ID
    - Card Number: <del>primary key</del> *multiple patients may use the same card*
    - CVV
    - Expiration Date
    - <del>Zip Code</del>
    - Name on Card

- [ ] Medications 
    - Patient ID: references a patient
    - Doctor ID: references a doctor
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
- [ ] Constraint on PatientFinancialInformation where only non-expired cards can be added.
