# Skill Envanteri

| Skill | Alan | Durum | Sürüm | Not |
|---|---|---|---|---|
| addpark-research-no-internet | Addpark / araştırma | depoda | — | Varsayılan Addpark araştırma skill'i |
| addpark-research-with-internet | Addpark / araştırma | depoda | — | Ayrı kalacak, birleştirilmeyecek (karar) |
| derin-tara | Grup / araştırma | depoda | v2 | Para izi yöntemi dahil |
| dokuman-denetle | Addpark / kalite | depoda | v5 | Kontrol 0 belge türü triyajı dahil |
| gelen-kutusu-isle | Addpark / DMS | depoda | v2 | YAYIN-ADAYI tür sınıfı dahil |
| kasa-giris-cikis | Grup / finans | depoda | v1 | Notion Kasa |
| todo | Grup / görev | depoda | — | Notion Aksiyonlar, tek görev sistemi |
| uygunsuzluk | Addpark / kalite | depoda | — | Mod B DÖF üretimi dahil |
| dokuman-yayinla | Grup / DMS | depoda | v1.0 | 24.09.2026 baştan yazıldı; beş şirketli, Faz A/B |
| mdr-case-create | Addpark / MDR | **YAZILACAK** | — | Baştan yazılacak (ADR-008, sıra 4) |
| mail-tara | Grup / araştırma | **YAZILACAK** | — | Baştan yazılacak (ADR-008, sıra 3) |
| toplanti-isle | Grup / toplantı | **YAZILACAK** | — | Baştan yazılacak (ADR-008, sıra 2) |
| sosyal-uret | Grup / pazarlama | park | — | Strateji belgeleri bitince |
| operations:* (9) | Pazar yeri eklentisi | dışarıda | — | Anthropic eklentisi, depoya alınmaz |

## Faz 1 denetimi — 21.09.2026 (8 skill)
Kaynak: GOV.05_EK1 canlı okundu; hafızadan çıkarım yapılmadı.

KAPANDI:
- Eski tek dosyalı sicil adı (`GOV.05_EK1_Master_Dokuman_Sicili.csv`) üç skill'de kullanılıyordu; IDX + EK1–EK7 modeline çevrildi (17.09.2026'da arşive alınan nüsha "kullanılmaz" notuyla işaretlendi).
- `derin-tara` sicil kapsamı EK1–EK6 → IDX + EK1–EK7 (EK7 = BLG belgelendirme).
- Sekiz skill'e `version:` üst bilgisi eklendi (pack betiği bunu okur).
- `dokuman-denetle` adlandırma örneklerindeki `_FINAL` kalemleri LEGACY notuyla işaretlendi.

YANLIŞ ALARM (kontrol edildi, düzeltme gerekmedi):
- `gelen-kutusu-isle` sicil tablosu zaten EK7 ve IDX satırlarını taşıyor.
- `addpark-research-no-internet` içindeki Notion satırı, Notion'u "kalite kaydı değil" diye DIŞLAYAN kural — doğru davranış.

AÇIK:
- Depoda olmayan 4 skill (dokuman-yayinla, mdr-case-create, mail-tara, toplanti-isle) denetlenmedi; aynı bayatlıkları taşımaları olası.
- `capa-hazirla` / `kalite-dokuman-yaz` yeniden yazılacak mı? Muhtemelen gereksiz (uygunsuzluk Mod B) — karar açık.
- MK.01 Rev02 ve gizlilik seti G/İ/K/Ö denetimi henüz yapılmadı.
