CREATE TABLE clean_patients (
    patient_id SERIAL PRIMARY KEY,
    formatted_name VARCHAR(100),
    contact_number VARCHAR(20),
    valid_birth_date DATE,
    blood_type VARCHAR(5)
);