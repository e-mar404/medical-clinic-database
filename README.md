# Update hosted db
- Either git clone this repo or download the sql files
- cd into the dir where the sql files are 
- run `mysql < setup.sql < setupTriggers.sql < setupProcedures.sql < setupEvents.sql < setupData.sql -h <host> -P <port> -u root -p` 
- input password when promted   

### note: 
- the port, host and password are pinned on the discord in '#checkpoint-3'

# Entities

- [x] Company EM
    - Name
    - Location: references an address
    - Phone number
    - Clinics: references a clinic

- [x] Clinic EM
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

- [x] Appointments: EM
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
    
- [x] Medical History:
    - Current Medications
    - Allergies
    - Weight
    - Past surgeries/medical procedures
    - Chronic conditions/illnesses
    - Patient ID: references a patient

- [X] Insurance Information:
    - Insurance Number
    - Group Number
    - Insurance Name
    - Patient ID
    
- [x] Consent Forms:
    - Patient ID: references a patient
    - Doctor ID: references a doctor
    - Clinics ID: references a clinic
    - Confirmation 

- [x] Preferred Pharmacy:
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

- [x] Medications 
    - Patient ID: references a patient
    - Doctor ID: references a doctor
    - Medication Name
    - Prescription Date

- [x] Address
    - Street Line 1
    - Street Line 2: optional
    - City
    - State
    - Zip Code
    - Super Key (all above)

# Enumeration:
 
- [x] Done by YR

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
