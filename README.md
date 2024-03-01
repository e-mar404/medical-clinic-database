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

- [ ] Patient
    - Patient ID: unique identifier
    - First Name
    - Middle Name: optional
    - Last Name
    - Gender
    - Weight
    - Insurance Information: references insurance information 
    - Financial Information: references financial information
    - Patient Contact Information: references contact information
    - Emergency Contact Information: references contact information 
    - Prefered Pharmacy: references a pharmacy 

- [ ] Medical Employee:
    - Employee ID: unique identifier
    - Role Enum of [Medical Roles](#medical-roles)
    - First Name
    - Middle Name
    - Last Name
    - Email 
    - Patients: references 1-M patient(s)

- [ ] Staff Employee:
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

- [ ] Contact Information:
    - Address: references address table
    - Phone Number
    - Email
    
- [ ] Medical History:
    - Current Medications
    - Allergies
    - Past surgeries/medical procedures
    - Chronic conditions/illnesses
    - Patient ID: references a patient

- [ ] Insurance Information:
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

- [ ] Financial Information:
    - Patient ID
    - Card Number: primary key
    - CVV
    - Expiration Date
    - Zip Code
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
