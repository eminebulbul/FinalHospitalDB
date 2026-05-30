INSERT INTO raw_patients (full_name, phone_number, birth_date, blood_type) VALUES
('eMiNe bülBül', NULL, '2002-07-27', 'A+'),       -- İsim formatı bozuk, Telefon eksik
('ahmet YILMAZ', '0532 123 4567', '2030-01-01', 'B-'), -- Doğum tarihi mantıksız (Gelecekte)
('   Ayşe Demir   ', '05559998877', '1995-05-15', '0+'), -- İsimde gereksiz boşluklar var
('mehmet kaya', '', '1980-11-20', 'AB+');         -- Telefon numarası boş (Empty string)