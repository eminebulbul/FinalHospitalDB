#!/bin/bash
# PROJE 7: Gelişmiş Veritabanı Yedekleme, Denetim ve Otomasyon Çalışması

# Yedeklerin ve logların kaydedileceği klasör
BACKUP_DIR="/Users/bulbul/Desktop/otomasyon"
LOG_FILE="$BACKUP_DIR/backup_audit.log"

# Dosya isimlerinin sonuna eklenecek dinamik tarih ve saat damgası
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="hospital_full_$DATE.tar"

echo "----------------------------------------" >> $LOG_FILE
echo "Yedekleme İşlemi Başladı: $DATE" >> $LOG_FILE

# PostgreSQL pg_dump ile yedek alma işlemi (VERİTABANI ADI 'hospital' OLARAK DÜZELTİLDİ)
/opt/homebrew/bin/pg_dump -U postgres -F c -d hospital -f "$BACKUP_DIR/$FILE_NAME"

# Denetim Mekanizması: İşlem başarılı oldu mu?
if [ $? -eq 0 ]; then
    echo "DURUM: BAŞARILI. Yedek Dosyası: $FILE_NAME" >> $LOG_FILE
    # Mac Masaüstü Bildirimi (Başarılı)
    osascript -e 'display notification "Yedekleme başarılı. Log dosyası güncellendi." with title "PostgreSQL Otomasyon"'
else
    echo "DURUM: BAŞARISIZ! Sistem yöneticisinin acil müdahalesi gerekiyor." >> $LOG_FILE
    # Mac Masaüstü Bildirimi (Kritik Hata)
    osascript -e 'display notification "KRİTİK HATA: Yedek alınamadı!" with title "PostgreSQL ALERT"'
fi

echo "İşlem Bitişi: $(date +"%Y-%m-%d_%H-%M-%S")" >> $LOG_FILE
