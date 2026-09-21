# Kapsam ve Kaynaklar

## 0. ARAMA KORLUGU — HER OTURUMDA ONCE BU (09.08.2026)

**Bu sitede `sharepoint_search` ve `sharepoint_folder_search` bazi kutuphaneleri
HIC dondurmuyor.** Arac hata vermez, sessizce bos doner.

Dogrulanmis kor noktalar (09.08.2026):
- `20_Proje-Basvurulari` (/13_ProjeBasvurulari) — TAMAMI
- `10_Kalite/00_Yonetisim` — sicil ve yonetisim dosyalarinin TAMAMI

Sifir sonuc veren gercek testler: `AP6204130001` · `AP6205110001` ·
`PRJ.01_EK1_Proje_ve_Basvuru_Sicili` · `Proje-Kunyesi-ve-Kaynak-Isaretcisi` ·
folder_search `Proje-Basvurulari` · folder_search `02_Sunulan-Bekleyen` ·
folder_search `00_Yonetisim`. Hepsi fiilen VAR.

### Kural
**"Arama bos dondu" ASLA "belge yok" demek degildir.** Bu skill'de
"bulunamadi" cikti bloku, YALNIZ dogrudan klasor listelemesi yapildiktan
sonra yazilabilir. Arama teyit araci degil, hizlandirma aracidir.

### Zorunlu ilk adim — konum haritasi
`10_Kalite/00_Yonetisim/IDX.01_Kutuphane-ve-Klasor-Haritasi.csv`
16 kutuphanenin nav adi, drive adi, URL yolu, driveId, sorumlu sicili ve
aramada gorunup gorunmedigi burada. Kutuphane hedeflemeden once okunur.

### Zorunlu yontem — listeleme once
1. `drive:///sites/8cf70cf4-b4cd-47a2-97c4-a88b0975690b` -> kutuphane + driveId listesi
2. `file:///{driveId}/root` -> kok klasorler
3. Her kutuphanenin kokunde `_KLASOR-REHBERI.md` — kapsam, klasor listesi,
   sorumlu sicil, bilinen bulgular. Kutuphaneye girmeden once okunur.
4. Arama yalniz hizlandirma icin; sonucu listelemeyle dogrulanir

### Hangi sicil hangi soruya bakar — KARISTIRMA
| Soru | Sicil |
|---|---|
| Belge var mi / revizyon / konum | `GOV.05_IDX` oku -> dogru `GOV.05_EK{n}` |
| **Proje veya basvuru** | **`PRJ.01_EK1_Proje_ve_Basvuru_Sicili.csv`** |
| NAS'a birakilan proje verisi | `PRJ.01_EK2_NAS_Aktarim_Sicili.csv` |
| Kutuphane nerede / driveId | `IDX.01_Kutuphane-ve-Klasor-Haritasi.csv` |
| Gelen kutusu tasnif izi | `DMS.PRS.01_EK1_Dagitim_Kaydi.csv` |

GOV.05'te proje ARANMAZ, PRJ.01'de belge ARANMAZ. GOV.05 tek dosya degil,
alti CSV'dir (EK1...EK6) + IDX haritasi.

## 1. Kapsam İÇİ — tek konum

Site: `https://btechinnovationas.sharepoint.com/sites/BTech-ADD`
Site GUID: `8cf70cf4-b4cd-47a2-97c4-a88b0975690b`

Bu site, ADDPARK dokümanları için **tek doğruluk kaynağıdır**
(yönetim kararı, 29.07.2026). En güncel her şey buradadır.

## 2. Kapsam DIŞI — sonuç çıksa bile kullanılmaz

| Konum | Neden kapsam dışı |
|---|---|
| İnternet (web_search / web_fetch) | Bu skill kapalı devredir |
| `/sites/BTECHGROUP` | Eski grup sitesi, kuşak karışık |
| `/sites/AddParkAS9100Ekip` | Eski kalite kopyaları, yürürlükte değil |
| `/sites/AddPark` | Ayrı eski site |
| `KaliteBelgelendirme-*` siteleri | Silinmesi kararlaştırılmış kopyalar |
| Kişisel OneDrive (herhangi bir kullanıcının) | Kullanıcının özel çalışma alanı — **hiç karıştırılmaz** |
| Gmail / Drive / Notion / diğer bağlayıcılar | Kalite kaydı değil |
| Kendi genel bilgim (MDR/ISO/AS9100 metinleri) | Belge değil; ancak ayrı "Kapsam dışı not" bloğunda etiketli kullanılabilir |

**Kontrol yöntemi:** her arama sonucunun `webUrl` alanına bak.
`/sites/BTech-ADD/` geçmiyorsa sonucu ele.

Kullanıcı açıkça "diğer siteye de bak" veya "internete bak" derse:
bunun bu skill'in dışına çıkmak olduğunu tek cümleyle söyle, sonra
istediğini yap. Sessizce kapsam genişletme.

## 3. Kütüphane haritası

Kütüphaneler 2026 Temmuz'da onluk blok sistemine yeniden adlandırıldı.
**SharePoint URL'i yeniden adlandırmayla değişmez** — görünen ad ile URL
farklıdır. Cevapta daima **görünen ad** kullanılır.

Ortak driveId öneki: `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10m`

| Görünen ad | URL | driveId son eki |
|---|---|---|
| 10_Kalite | /01_Kalite | `hu8ziiBbA8RZ_p5dmEzxin` |
| 20_Proje-Basvurulari | /13_ProjeBasvurulari | `iVCINtMDElTqdVXp5YTA0T` |
| 21_Projeler-Aktif | /02_ProjelerAktif | `h7wP1xLY6FTYSZ0yih7f-_` |
| 22_Projeler-Arsiv | /03_ProjelerArsiv | `jvVqWuiANmRYsL-odyUEju` |
| 23_Proje-Mali | /04_ProjeMali | `j4tmyG7CZzRIRSOcrdMV2Q` |
| 11_Kalite-Kayitlari | /11_KaliteKayitlari | `ixJnX42CWeT6KowzQHB6aA` |
| 30_Uretim | /05_Uretim | `gzNLz0waooTZOIcsS_McQN` |
| 31_Satinalma-Tedarik | /06_SatinalmaTedarik | `jB9NSgwh6DSams67faYMmT` |
| 40_Finans | /07_Finans | `jYIBhyY1CkS7HhgwwkGLzd` |
| 50_IK | /08_IK | `iu64ds9IIhRJa7bQoMbJf1` |
| 60_Pazarlama-Kurumsal | /09_PazarlamaKurumsal | `gHaNr7LU1mQ51Da6s-pSLL` |
| 70_IT-Guvenlik | /10_ITGuvenlik | `g-Em0mgOYATLssm3J1cmYd` |
| 80_Yonetim | /11_Yonetim | `i2qq6zWcxARYd-nxd5tH_9` |
| 81_Hukuk | /12_Hukuk | `i-flqZc6txR4H0mE2bh_gQ` |
| 99_Gelen-Kutusu | /99_GelenKutusu | `h04_RTqgeRTb1Xi_Ek00XL` |

Bir driveId çalışmazsa: `drive:///sites/8cf70cf4-b4cd-47a2-97c4-a88b0975690b`
cagirilir, canli liste doner. `folder_search` ile driveId bulma yontemi
ARTIK GECERSIZ — bu sitede folder_search calismiyor.

## 4. Hangi soru hangi kütüphaneye bakar

| Soru tipi | İlk bakılacak yer |
|---|---|
| Belge var mı / revizyonu ne / nerede | `10_Kalite/00_Yonetisim/` -> once `GOV.05_IDX_Sicil-Haritasi.md`, sonra ilgili `GOV.05_EK{n}` |
| Prosedür ne diyor | 10_Kalite/02_Prosedurler |
| Kalite el kitabı, politika | 10_Kalite/01_KEK-OEK |
| MDR teknik dosya, CER, GSPR, risk | 10_Kalite/03_MDR (`_Ortak-Teknik-Dosya`, `Formlar-FR`, `Urun-Dosyalari/{CRA,HPV,CMF,TMJ,DEN,SPN,SHL,TLS,KNE}`) |
| KVKK | 10_Kalite/04_KVKK |
| Denetim, DÖF, uygunsuzluk kaydı | 10_Kalite/05_Denetim |
| Etiket şablonu | 10_Kalite/08_Etiket-Sablonlari |
| Proses parametresi, üretim kaydı, toz/sarf, kalibrasyon | 30_Uretim |
| Proje (aktif/arşiv), başvuru, sözleşme eki | **PRJ.01_EK1 sicili** + 21_/22_Projeler, 20_Proje-Basvurulari (arama KOR, listeleyerek git) |
| Proje bütçesi, harcama | 23_Proje-Mali |
| Marka kılavuzu, sunum, web içerik | 60_Pazarlama-Kurumsal/01_Marka-Kimlik vd. |
| Özlük, bordro, görev tanımı, İK politikası | 50_IK (kısıtlı — gizlilik testi uygula) |
| Yönetim raporu, YGG, karar | 80_Yonetim |
| Sözleşme, NDA, hukuki yazışma | 81_Hukuk |
| DMS, sicil, doküman standardı, GOV ailesi | 10_Kalite/00_Yonetisim |

## 5. SharePoint'te OLMAYAN veriler

Bunlar mimari gereği başka yerdedir. "Bulunamadı" demeden önce bunu
bilmek gerekir; cevapta eksiklik olarak değil, konum bilgisi olarak yazılır.

| Veri | Gerçek yeri |
|---|---|
| Hasta verisi, DICOM, hasta CAD'i | NAS + Odoo (SharePoint'e hiç konmaz) |
| Sipariş, mal kabul, cari, fatura, stok, izlenebilirlik | Odoo (ana kayıt) |
| Tedarikçi performansı, bakım-arıza, toz sarf kaydı | Odoo |
| Askeri gizlilik dereceli proje teknik içeriği | NAS |
| Ham deney/test verisi | NAS |

SharePoint bunların yalnızca **dönemsel dışa aktarımlarını** ve belge
kaynaklarını (sözleşme, sertifika, prosedür, plan) tutar.

## 6. Gizlilik freni

50_IK ve 81_Hukuk içeriği ile "GİZLİ / Yalnızca Üst Yönetim /
Confidential" ibareli belgeler: içerik özetlenmez, kişi bazlı ücret,
özlük ve sağlık verisi çıktıya yazılmaz. Belgenin **varlığı ve konumu**
bildirilir, içeriği için kullanıcının açık talebi beklenir.
