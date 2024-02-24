Entities/tables needing to be done in main.sql

[ ] Company
    - Company name
    - Location: Address (Street, City, State, Zip Code)
    - Phone number

[ ] Clinic
    Clinic ID: unique identifier
    Location: Address (Street, City, State, Zip Code)
    Phone number

[ ] Patient
    Patient ID: unique identifier
    Personal Information: Full name, date of birth, gender, weight, identification
    Contact Information: Home address, phone number(s), email address
    Insurance Information: Health insurance details (policy number, group number)
    Emergency Contact Information
    Medical History: Current medications, dosage, allergies, past surgeries/medical
procedures, chronic conditions/illnesses
    Consent Forms: Signed forms for the clinic to provide care and share information
with other healthcare providers if necessary
    Prefered Pharmacy: pharmacy where prescriptions will go to
    Financial Information: Billing/payment information, co-payment or deductible

[ ] Employee:
    Employee ID: unique identifier
    Role: Admin | Doctor | Nurse | Receptionist
    Personal Information: Full name, date of birth, gender, SSN
    Contact Information: Home address, phone number, email address
    Emergency Contact Information
    Patients: list of patient uids, if row has role of doctor

[ ] Appointments
    Date: mm/dd/yyyy 24hr
    Patient: will contain which patient is scheduled for that appointment
    Clinic: the specific clinic location that the appointment is set up at
    Doctor: main doctor scheduled for appointment
    Confirmation: notification will be sent to patient to check in for appointment
    Status: an appointment can either be scheduled, past, in progress or canceled

[ ] Medications
    Name
    Contraindications
