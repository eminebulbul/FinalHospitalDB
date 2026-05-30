-- PROJE 5: Veri Kalitesi ve Süreç Raporlaması
-- Veri temizleme sürecinin başarısını ölçen Analitik Rapor (View)

CREATE OR REPLACE VIEW etl_quality_report AS
SELECT
    (SELECT COUNT(*) FROM raw_patients) AS total_raw_data_received,
    (SELECT COUNT(*) FROM clean_patients) AS total_successfully_loaded,
    (SELECT COUNT(*) FROM clean_patients WHERE contact_number = 'Bilinmiyor') AS missing_phone_alerts,
    (SELECT COUNT(*) FROM clean_patients WHERE valid_birth_date IS NULL) AS invalid_date_alerts;

