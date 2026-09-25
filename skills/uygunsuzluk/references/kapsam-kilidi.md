# Kapsam Kilidi

## Tek kaynak
`https://btechinnovationas.sharepoint.com/sites/BTech-ADD`
Site GUID `8cf70cf4-b4cd-47a2-97c4-a88b0975690b`

Her sonucun `webUrl` alanı `/sites/BTech-ADD/` içermelidir. İçermiyorsa
sonuç atılır ve kullanıcıya "başka yerde benzeri var" diye bile
aktarılmaz.

## Kütüphane driveId'leri
Ortak önek: `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10m`

| Görünen ad | URL adı | driveId son parçası |
|---|---|---|
| 10_Kalite | 01_Kalite | `hu8ziiBbA8RZ_p5dmEzxin` |
| 21_Projeler-Aktif | 02_Projeler-Aktif | `h7wP1xLY6FTYSZ0yih7f-_` |
| 22_Projeler-Arsiv | 03_Projeler-Arsiv | `jvVqWuiANmRYsL-odyUEju` |
| 23_Proje-Mali | 04_Proje-Mali | `j4tmyG7CZzRIRSOcrdMV2Q` |
| 30_Uretim | 05_Uretim | `gzNLz0waooTZOIcsS_McQN` |
| 31_Satinalma-Tedarik | 06_Satinalma | `jB9NSgwh6DSams67faYMmT` |
| 40_Finans | 07_Finans | `jYIBhyY1CkS7HhgwwkGLzd` |
| 50_IK | 08_IK | `iu64ds9IIhRJa7bQoMbJf1` |
| 60_Pazarlama-Kurumsal | 09_Pazarlama | `gHaNr7LU1mQ51Da6s-pSLL` |
| 70_IT-Guvenlik | 10_IT | `g-Em0mgOYATLssm3J1cmYd` |
| 80_Yönetim | 11_Yonetim | `i2qq6zWcxARYd-nxd5tH_9` |
| 81_Hukuk | 12_Hukuk | `i-flqZc6txR4H0mE2bh_gQ` |
| 20_Proje-Basvurulari | 13_Basvurular | `iVCINtMDElTqdVXp5YTA0T` |
| 99_Gelen-Kutusu | — | `h04_RTqgeRTb1Xi_Ek00XL` |

**URL adı ≠ görünen ad.** Kullanıcıyla konuşurken görünen ad kullanılır.

## 10_Kalite alt klasörleri
`00_Yonetisim` · `01_KEK-OEK` · `02_Prosedurler` · `03_MDR` · `04_KVKK` ·
`05_Denetim` · `06_Egitim-Yetkinlik` · `07_Tedarikci-Kalite` ·
`08_Etiket-Sablonlari` · `09_ISG` · `10_Belgelendirme-ve-Sertifikalar` ·
`11_Arsiv_Gecmis-Belgelendirme` · **`97_On-Calisma-Kontrolsuz` (kontrolsüz, skill buraya yazar)** ·
`98_Taslaklar` · `99_Arsiv-Obsolete`

## Kapsam dışı — sonuç çıksa bile kullanılmaz
- `AddParkAS9100Ekip` sitesi (eski kalite belgeleri, devredildi)
- `KaliteBelgelendirme-*` siteleri
- `BTECHGROUP` sitesi (eski grup sitesi)
- `/sites/AddPark`, `/sites/Projects`, yedek siteler
- Kişisel OneDrive (kullanıcının özel çalışma alanı — hiç karıştırılmaz)
- Diğer şirket siteleri (BTE / TRB / VIM / EAR)

Gerekçe: **BTech-ADD, Addpark dokümanları için tek doğruluk kaynağıdır**
(29.07.2026 yönetim kararı).

## İnternet
Mod A ve Mod B çalışırken `web_search` / `web_fetch` kullanılmaz.
Mevzuat bilgisi yalnız `mevzuat-matrisi.md`'den alınır. Matriste
olmayan bir şart gerekiyorsa bulgu açılmaz; matrisin genişletilmesi
gerektiği kullanıcıya bildirilir.

## Yazma sınırları

| Konum | İzin |
|---|---|
| `10_Kalite/97_On-Calisma-Kontrolsuz/` bulgu ve kapsam sicili CSV'leri | Onay alındıysa YAZILIR |
| Aynı klasördeki R02 xlsx (referans dosyası) | **YAZILMAZ** |
| `/mnt/user-data/outputs/` | Serbest |
| `10_Kalite` — `97_On-Calisma-Kontrolsuz` DIŞINDAKİ tüm alt klasörler | **YASAK** |
| `GOV.05_EK1…EK7` sicil CSV'leri ve `GOV.05_IDX` | **YASAK** |
| `DMS.PRS.01_EK1_Dagitim_Kaydi.csv` | **YASAK** |
| Vaka sicili (MDR.FR.VS) | **YASAK** |
| Diğer tüm kütüphaneler | **YASAK** |
