# Atölye Dosyaları — Konum, Okuma, Yazma

## Klasör

```
Kütüphane : 10_Kalite  (URL 01_Kalite)
driveId   : b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mhu8ziiBbA8RZ_p5dmEzxin
Klasör    : 97_On-Calisma-Kontrolsuz
itemId    : 01NQZXAHHDXF6JPC4PLBBJEXZUH6OSPWM6
Arşiv     : 97_On-Calisma-Kontrolsuz/99_Arsiv  (01NQZXAHDFJHP7SUXGFBB2JGQPXXT3YXVS)
```

**TAŞINDI (08.08.2026):** bu alan önce `80_Yönetim/09_Kalite-On-Calisma`
altındaydı. Kalite ekibinin o kütüphaneye erişimi sınırlı olduğu için onay
katmanı çalışmıyordu — alan `10_Kalite` altına alındı. Eski klasör silindi.

**KRİTİK:** bu klasör `10_Kalite` kütüphanesinin İÇİNDE ama **kontrollü
değildir**. Bir belgenin kontrollü olup olmadığını klasör konumu değil
**GOV.05 sicili** belirler. Buradaki dosyalar sicile kaydedilmez, doküman
kodu almaz. Klasördeki `00_OKUBENI_Bu-alan-kontrollu-degildir.md` bunu
beyan eder — silinmez, taşınmaz.

Bu, `10_Kalite` altındaki diğer klasörlerin hiçbirine yazma izni vermez.
Yalnız `97_On-Calisma-Kontrolsuz` yazılabilir.

## Üç dosya, üç rol

| Dosya | itemId | Rol | Skill yazar mı |
|---|---|---|---|
| `ADDPARK_Uygunsuzluk-Bulgu-Sicili.csv` | `01NQZXAHD22VFZ7BRK6RD3A7YOI4H3JKE7` | **Canlı bulgu sicili** (23 kolon) | **Evet** |
| `ADDPARK_Uygunsuzluk-Kapsam-Sicili.csv` | `01NQZXAHHHLMPDTZCA7VEYDAOXZBPYJPCP` | **Kapsam takibi** (10 kolon) | **Evet** |
| `ADDPARK_Uygunsuzluk-Tespit-Atolyesi_R02.xlsx` | — | Referans: şart matrisi, izin verilen değerler, kolon şeması, tavan hesabı | **Hayır** |

## NEDEN CSV — bu karar geri alınmaz

xlsx bu ortamda **geri okunamıyor**: `read_resource` bozuk çıktı veriyor ve
ikili dosya indirme aracı yok. xlsx'e yazmak, kalite ekibinin girdiği
KABUL/RED kararlarını körlemesine silmek demektir. Ayrıca yazma yalnız tam
dosyanın base64'ü ile mümkün (~43.000 karakter), her yazımda tekrarlanır.

GOV.05 sicilinde aynı sonuca varılmıştı: **siciller CSV'dir.**

## CSV biçimi

- Ayraç: **noktalı virgül `;`**
- Kodlama: UTF-8, **BOM korunur** (dosya `\ufeff` ile başlar)
- İçinde `;` veya `"` geçen alanlar çift tırnakla sarılır
- Başlık satırı değiştirilmez; kolon sırası R02 xlsx'in `03_Sicil-Semasi` sayfasındaki şemadır

## Okuma

`read_resource` ile doğrudan okunur — CSV metin olduğu için sorunsuz çalışır.
Yazmadan önce **daima okunur**; mevcut satırlar korunur.

## Yazma

`sharepoint_update_file` ile **tam içerik** gönderilir (mevcut satırlar +
yeni satırlar). Kısmi yazma yoktur.

1. Dosyayı oku, son `ON.YYYY-NNN` numarasını bul
2. Yeni satırları numaralandır — boşluk bırakma, numara tekrar kullanma
3. Onay tablosunu göster, "yazayım mı?" diye sor
4. Onay gelirse tam içeriği gönder
5. Sonuçtaki bayt boyutunu kontrol et — beklenenden küçükse yazma eksiktir

## Eşzamanlılık

Yazmadan hemen önce `lastModifiedDateTime` kontrol edilir. Okuma anındakinden
farklıysa **yazma yapılmaz**; dosya yeniden okunur, satırlar yeniden eklenir.
Kalite ekibinin girdiği Durum ve Not değerleri asla üzerine yazılmaz.

## Yazma sınırları

| Alan | İzin |
|---|---|
| Bulgu sicili CSV | Onay alındıysa YAZILIR |
| Kapsam sicili CSV | Onay alındıysa YAZILIR |
| R02 xlsx | **YAZILMAZ** — kalite ekibi düzenler |
| `Durum` kolonu | Yalnız yeni satırda `TASLAK`; Mod B'de `DEVREDİLDİ`. `KABUL` / `RED` / `İNCELENDİ` **asla** yazılmaz |
| `Kalite Ekibi Notu` | **Asla yazılmaz** |
| `DOF No` | Yalnız Mod B'de, devir sonrası |
| `10_Kalite` (tüm alt klasörler) | **YASAK** |
| GOV.05 ve DMS.PRS.01 CSV'leri | **YASAK** |
| Vaka sicili (MDR.FR.VS) | **YASAK** |

## Kapsam sicili kuralı

Bulgu sayısı ve kabul sayısı kapsam sicilinde **tutulmaz** — bulgu sicilinden
sayılır. İki yerde tutmak çift gerçek kaynağı yaratır.

Bir belge yalnız başka bir belgenin karşılanma testi için okunduysa `TARANDI`
işaretlenmez; `YENİDEN TARANACAK` yazılır ve Not'a neden okunduğu düşülür.
Kapsam yüzdesini yalancı şişirmek denetimde savunulamaz.

## Onay tablosu (yazmadan önce zorunlu gösterim)

| ON No | Hat | Belge | Şart | Sınıf | Kaynak | DÖF Türü | Aksiyon | Kanıt var mı |
|---|---|---|---|---|---|---|---|---|

Altına: "Bulgu siciline `{n}` satır yazayım mı?" Onay gelmezse hiçbir şey
yazılmaz, çıktı sohbette bırakılır.

## Tavan hesabı

Açık bulgu tavanı R02 xlsx'in `04_Tavan-Kontrolu` sayfasında elle hesaplanır
(CSV'ye formül konmaz). Skill KABUL sayısını bulgu sicilinden sayar ve
tavanla karşılaştırır; eşik aşıldıysa yeni KABUL önerisi vermez.

## Arşivleme

Şart matrisi sürümü değişirse R02 xlsx `99_Arsiv`'e kopyalanır, yeni sürüm
açılır. CSV siciller arşivlenmez — kapatılan satırlar `DEVREDİLDİ` durumuyla
kalır, silinmez.

## Erişim

Kalite ekibi `10_Kalite` kütüphanesine zaten erişiyor; onay katmanı bu
sayede çalışır. Ek izin işi gerekmez.
