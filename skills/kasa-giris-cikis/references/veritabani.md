# Kasa veritabanı — koordinatlar ve yazım biçimleri

## Kimlikler
- Veritabanı: `https://app.notion.com/p/79a9e8dce5d14b149e2200e70ece3927` (Founder Dashboard altında)
- Data source: `collection://b536d5e3-bc90-4df8-a7a5-0875f6689341`
- Görünümler: "Güncel Bakiye (Net TL)" `view://3d1454a5-e8e9-8117-bdec-000cc560d5a9` (sayı kartı, sum Net TL) · "Para Birimine Göre Toplam" `view://3d1454a5-e8e9-817e-81c6-000c3cea3795`
- Kuruluş: 04.09.2026. İlk kayıt: Earfit'ten 548.000 TRY giriş (04.09.2026).

## Alanlar ve yazım biçimi (notion-create-pages / update-page)
| Alan | Tip | Değer |
|---|---|---|
| İşlem | title | "Earfit'ten kasaya giriş" gibi kısa cümle |
| date:Tarih:start | date | "YYYY-MM-DD"; `date:Tarih:is_datetime` = 0 |
| Yön | select | "Giriş" \| "Çıkış" |
| Karşı Taraf | text | kimden geldi / nereye gitti |
| Kategori | select | Tahsilat · Ödeme · Maaş · Grup içi transfer · Kredi · Vergi/SGK · Diğer |
| Şirket | select | BTech · Addpark · Trabtech · Earfit · Vimics · Kişisel · Diğer |
| Tutar | number | pozitif, orijinal para biriminde |
| Para Birimi | select | TRY · USD · EUR · CNY |
| Kur | number | 1 birim = ? TL; TRY için 1 |
| TL Karşılığı | formula | Tutar × Kur (yazılamaz) |
| Net TL | formula | Giriş ise +, Çıkış ise − (yazılamaz) |
| Belge | text | dekont / fatura no |
| Not | text | kaynak, varsayım, kur kaynağı, iptal işareti |
| Kayıt Zamanı | created_time | otomatik |

## Örnek yazım
```json
{"parent":{"type":"data_source_id","data_source_id":"b536d5e3-bc90-4df8-a7a5-0875f6689341"},
 "pages":[{"properties":{"İşlem":"Formlabs'a ödeme","date:Tarih:start":"2026-09-10","date:Tarih:is_datetime":0,
 "Yön":"Çıkış","Karşı Taraf":"Formlabs","Kategori":"Ödeme","Şirket":"BTech",
 "Tutar":12000,"Para Birimi":"EUR","Kur":48.35,"Not":"Kur: TCMB 10.09.2026 EUR satış"}}]}
```

## Sorgu (notion-query-data-sources, SQL)
- Tarih `"date:Tarih:start"` ile sorgulanır; formül sütunları sorgulanamaz.
- Bakiye: `SELECT SUM(CASE WHEN "Yön"='Giriş' THEN "Tutar"*"Kur" ELSE -"Tutar"*"Kur" END) FROM "collection://b536d5e3-bc90-4df8-a7a5-0875f6689341"`
- Para birimi kırılımı: aynı ifade `GROUP BY "Para Birimi"`.
- `AS` takma adı ve `IS NOT` güvenilmez; `!=` kullan (todo skill'inden alınan ders).

## Yeni seçenek gerekirse
Select seçeneği eklemek için `notion-update-data-source`; önce mevcut listeyi oku, sonra ekle. Kullanıcıya bildir.
