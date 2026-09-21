# Aksiyonlar Veritabanı — Teknik Referans

## Koordinatlar

| | |
|---|---|
| Veritabanı | `Aksiyonlar` (Founder Dashboard altında) |
| Database URL | `https://app.notion.com/p/a6e5d40eddd04180814e11ff4d27f58d` |
| Database ID | `a6e5d40eddd04180814e11ff4d27f58d` |
| Data source | `collection://6bf8bf3a-764b-47b6-bbbb-eb76ca2ceecc` |
| Üst sayfa | Founder Dashboard `31d454a5-e8e9-80d5-8abc-c31b1cf02aa9` |
| Kullanım rehberi | `00. Notion Kullanım Rehberi` `39c454a5-e8e9-810a-984f-fb67d367acf5` |
| Meetings data source | `collection://31d454a5-e8e9-80e4-aad5-000bfc8e2cf7` |

## Görünümler

| Görünüm | Ne için |
|---|---|
| Açık İşler (termine göre) | Varsayılan gözden geçirme kaynağı |
| Claude Yapabilir | Vadesi gelince yapılacak işler |
| Takvim | Termin takvimi |
| Arşiv (tamamlananlar) | Kapanan işler, Tamamlanma tarihine göre |
| Doğrulanmayı Bekleyen | `Doğrulanmadı` işaretli kayıtlar — `view://3b0454a5-e8e9-81a7-885c-000c1e67662f` |

## Şema ve yazım biçimleri

Sayfa oluştururken `properties` içinde kullanılacak **tam adlar**:

| Alan | Tip | Yazım |
|---|---|---|
| `Aksiyon` | title | düz metin |
| `Durum` | select | `Açık` · `Devam` · `Tamamlandı` |
| `Öncelik` | select | `Kritik` · `Yüksek` · `Orta` · `Düşük` |
| `Sorumlu` | select | `Kuntay` · `Ekip` · `Diğer` |
| `Alan` | select | `Addpark` · `BTech` · `Trabtech` · `Vimics` · `Earfit` · `Grup` · `Kişisel` |
| `Kaynak` | select | `Sohbet` · `Toplantı` · `Belge` · `Mevzuat` · `To Do göçü` · `Diğer` |
| `Termin` | date | `date:Termin:start` = `YYYY-MM-DD`, `date:Termin:is_datetime` = `0` |
| `Tamamlanma` | date | `date:Tamamlanma:start` = `YYYY-MM-DD` |
| `Claude Yapabilir` | checkbox | `__YES__` / `__NO__` |
| `Doğrulanmadı` | checkbox | `__YES__` / `__NO__` — Claude bir alanı sormadan türettiyse `__YES__` |
| `Sonraki Aksiyon` | text | düz metin |
| `Bekleyen Kim` | text | düz metin |
| `Not` | text | düz metin |
| `Toplantı` | relation | Meetings sayfa URL dizisi |
| `Tamamla` | button | **YAZILAMAZ.** UI butonu, API'den set edilmez ve SQL'de sorgulanamaz |

Saat gerekiyorsa `date:Termin:is_datetime` = `1` ve start ISO datetime.
Varsayılan gün bazlıdır.

## SQL sorgulama tuzakları

Bunlar deneyle doğrulandı — uyulmazsa 400 döner.

1. **Tarih alanları kendi adıyla sorgulanamaz.** `"Termin"` diye seçmek
   `no such column` verir. Genişletilmiş adı kullan:
   `"date:Termin:start"`, `"date:Termin:end"`, `"date:Termin:is_datetime"`.
2. **`AS` takma adı kabul edilmiyor.** `SELECT "date:Termin:start" AS Termin`
   → "query could not be parsed safely". Takma ad kullanma.
3. **`IS NOT` yerine `!=` kullan.** `WHERE "Durum" IS NOT 'Tamamlandı'`
   parse edilemiyor; `WHERE "Durum" != 'Tamamlandı'` çalışıyor.
4. **Checkbox karşılaştırması metindir:** `WHERE "Claude Yapabilir" = '__YES__'`.
5. Tablo adı data source URL'sidir ve çift tırnak içinde yazılır.

### Çalışan örnek — açık işler

```sql
SELECT "Aksiyon", "Durum", "Öncelik", "Alan", "date:Termin:start",
       "Sonraki Aksiyon", "Claude Yapabilir", "Doğrulanmadı",
       "Bekleyen Kim", url
FROM "collection://6bf8bf3a-764b-47b6-bbbb-eb76ca2ceecc"
WHERE "Durum" != 'Tamamlandı'
ORDER BY "date:Termin:start" ASC
LIMIT 100
```

## Örnek: yeni görev (yaz-önce protokolü)

```
parent: {"data_source_id": "6bf8bf3a-764b-47b6-bbbb-eb76ca2ceecc"}
properties:
  "Aksiyon": "MDR.FR.005 dosya adı ile belge içi revizyon çelişkisini kapat"
  "Durum": "Açık"
  "Öncelik": "Yüksek"
  "Sorumlu": "Kuntay"
  "Alan": "Addpark"
  "Kaynak": "Sohbet"
  "Sonraki Aksiyon": "Dosyayı aç, belge içi Rev:01 ise dosya adını Rev01 olarak düzelt"
  "Claude Yapabilir": "__YES__"
  "Doğrulanmadı": "__YES__"
  "date:Termin:start": "2026-08-09"
  "date:Termin:is_datetime": 0
```

`Doğrulanmadı` burada `__YES__` çünkü termin kullanıcıdan gelmedi,
"sinyal yok → bugün + 7" kuralıyla türetildi.

## Örnek: doğrulama sonrası işaret kaldırma

```
"Doğrulanmadı": "__NO__"
```

Tüm türetilmiş alanlar kullanıcı tarafından onaylandığında yapılır.

## Örnek: kapatma

`notion-update-page` ile:

```
"Durum": "Tamamlandı"
"date:Tamamlanma:start": "<bugün>"
"date:Tamamlanma:is_datetime": 0
```

Bugünün tarihini sistemden al — tahmin etme.

## Notion hatırlatıcısı

Termin alanındaki tarihe Notion'un kendi hatırlatıcısı bağlanabilir
(tarih alanında "Remind" seçeneği). Bu **kullanıcının telefonuna
bildirim** gönderir ve Claude'dan bağımsız çalışır. Kritik terminlerde
kullanıcıya bunu kurmasını hatırlat — Claude'un günlük süpürmesi
çalışmazsa tek uyarı mekanizması budur.

## Toplantı bağlantısı

Görev bir toplantıdan çıktıysa `Toplantı` ilişkisini doldur.
Bu bağ, "bu iş nereden çıktı" sorusunun cevabıdır — kurulabiliyorsa kurulur.

## Bilinen veri kalitesi sorunu (02.08.2026)

Veritabanında 14 açık kayıt var; **13'ünde Termin, Alan ve Sonraki Aksiyon
boş** ve çoğu `;` ile ayrılmış birden fazla iş içeriyor. Bunlar sistem
kurulmadan önceki toplu içe aktarımdan kalma. Kullanıcı temizliği
onaylayana kadar bunlara dokunma; gözden geçirmede ayrı blokta göster.

## Sistem kuralı çelişkisi (tarihsel not)

`00. Notion Kullanım Rehberi` v1.0'da "Notion görev sistemi değildir,
görevler Microsoft To Do'da tutulur" yazıyordu. Bu kural 01.08.2026'da
kaldırıldı; Aksiyonlar veritabanı tek görev sistemi oldu. Rehberde eski
ifadeye rastlarsan güncellenmemiş bir bölümdür — kullanıcıya bildir.
