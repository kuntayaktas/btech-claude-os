# Adlandırma Standardı (DMS.STD.02)

## Genel biçim

    {Bağlam}_{Tarih}_{Konu}_{Sürüm}.uzantı

Kod taşıyan kontrollü belgeler kodla başlar:

    {KOD}_{ADDPARK}_{Konu}_{Rev}_{Durum}.uzantı

Desen 1 örnekleri:
- `OEK_ADDPARK_Organizasyon_El_Kitabi_Rev08_FINAL.pdf`
- `PR04_ADDPARK_Personel_Kaynagi_Idaresi_Rev07_FINAL.pdf`
- `MDR_FR_024_ADDPARK_Kalite_Anlasmasi_Rev01_FINAL.docx`
- `ORG.SEM.02_ADDPARK-Organizasyon-Semasi-2026_R00.md`
- `3230550_20240916_Polimer-Yuzey-Puruzluluk-Testi_R00.docx`

Desen 2 örnekleri:
- `DMS.STD.02_Dosya-Adlandirma-Standardi_Rev02.docx`
- `ODO.SPC.01_...._Rev01.docx`
- `DMS.PRS.01_Gelen-Kutusu-Isleyis-Proseduru_R02.md`

**Denetçi ne yapar:** belgenin ailesindeki **mevcut yayınlanmış emsalin**
desenine uyulup uyulmadığını kontrol eder; deseni tek başına bulgu yazmaz,
iki desenin varlığını çelişki olarak raporlar. Yeni bir aile açılıyorsa
(örn. LGL) desen kullanıcıya sorulur.

## Karakter kuralları

| Kural | Neden |
|---|---|
| Türkçe karakter yok | Kanıtlı bozulma: "Ümmühan" → `U_mmu_han` |
| Boşluk yok, ayraç tire veya alt çizgi | URL kodlaması |
| Nokta yalnız uzantıda | Uzantı belirsizliği |
| Parantez, virgül, tırnak yok | Senkronizasyon hatası |
| Yasak: `" * : < > ? / \ \|` | SharePoint reddeder |
| Tam yol 400 karakteri aşmamalı | Senkronizasyon kırılır |

İndirme kopyası ekleri temizlenir: `(1)`, `(2)`, `dosya 1.docx`

## Sürüm gösterimi

Kalite sisteminde iki seri kullanılıyor ve **karıştırılmamalı**:

- `Rev00`, `Rev01`, `Rev07` — kontrollü kalite belgeleri
- `R00`, `R01` — DMS ve organizasyon belgeleri

Bir belge ailesi içinde tek seri kullanılır. Yeni belge oluştururken
o ailenin mevcut serisine bak.

`v1`, `v2`, `v3` gibi gayri resmî sürümler kontrollü belgede kullanılmaz.

## Dokunulmazlar

Resmî kurum çıktılarının adı **değiştirilmez**:

- TÜBİTAK PRODİS: `3230550_2024_2_rev0_AGY300.pdf`
- KOSGEB, AB, TİTCK çıktıları
- Noter, mahkeme, resmî kurum yazıları

Gerekçe: denetimde belge bu adla aranır. Değiştirmek izlenebilirliği kırar
ve kurum karşısında savunulamaz.

## Tarih biçimi

ISO: `YYYYMMDD` veya `YYYY-MM-DD`

Karışık kullanım en sık rastlanan hatadır. Aynı klasörde dört farklı
biçim görülmüştür: `2021-01-30_`, `201012_`, `29.06.2020`, `_2020-07-13`

Tarih, belgenin **düzenlenme** tarihidir.

## Klasör adlandırma

Proje klasörleri: `AP{revYY}{MM}{DD}{NNNN}_{Kisa-Ad}_{ProjeNo}`

`revYY` = yılın son iki hanesi ters çevrilmiş (2018→81, 2021→12, 2023→32)
Tarih = destek başlangıç tarihi (destek karar yazısındaki, öteleme varsa
öteleme sonrası)

Arşiv projelerinde koddan sonra `_ARS_` eklenir.

## Kontrol listesi

Yayın öncesi:

- [ ] Türkçe karakter yok
- [ ] Boşluk yok
- [ ] İndirme kopyası eki yok
- [ ] Sürüm serisi aile ile tutarlı
- [ ] Kod benzersiz (aynı kod+revizyon başka belgede yok)
- [ ] Resmî kurum çıktısıysa ada dokunulmamış
- [ ] Tarih ISO biçiminde
- [ ] Desen, ailenin yayınlanmış emsaliyle aynı (Desen 1 / Desen 2)
