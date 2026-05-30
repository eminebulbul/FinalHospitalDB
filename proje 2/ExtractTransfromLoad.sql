INSERT INTO clean_patients (formatted_name, contact_number, valid_birth_date, blood_type)
SELECT 
    -- TRANSFORM 1: İsimlerdeki başındaki/sonundaki boşlukları sil (TRIM) ve Baş harfleri büyük yap (INITCAP)
    INITCAP(TRIM(full_name)),
    
    -- TRANSFORM 2: Telefon numarası NULL veya boş ise 'Bilinmiyor' yaz, aksi halde numarayı al (COALESCE ve NULLIF)
    COALESCE(NULLIF(phone_number, ''), 'Bilinmiyor'),
    
    -- TRANSFORM 3: Doğum tarihi bugünden büyük (gelecekte) ise NULL yap (Mantıksız veriyi filtrele)
    CASE 
        WHEN birth_date > CURRENT_DATE THEN NULL 
        ELSE birth_date 
    END,
    
    blood_type
FROM raw_patients;