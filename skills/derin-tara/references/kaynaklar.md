# Kaynak Envanteri

## ÖNCE OKU — SharePoint'te en sık yapılan hata

**Kütüphane ile klasör aynı şey değildir.** Bir SharePoint sitesi birden
çok belge kütüphanesi içerir; her kütüphanenin kendi `driveId`'si vardır.
Bir kütüphanenin içindeki klasör, başka bir kütüphaneyle aynı adı
taşıyabilir.

BTech-ADD'de bunun canlı örneği var:

| Ad | Nerede | İçinde ne var |
|---|---|---|
| `00_Yonetisim` | **Ayrı kütüphane** | **Siciller, dağıtım kaydı** |
| `00_Yonetisim` | `01_Kalite` kütüphanesi içinde **klasör** | GOV prosedürleri, eski nüshalar |

12.09.2026'da bu karışıklık yüzünden ADDPARK sicili "yok" sanıldı. Sicil
ayrı kütüphanedeydi ve gayet güncel çalışıyordu.

**Kural:** bir kütüphanede bulamamak, sitede olmadığı anlamına gelmez.
Rapora "yok" yazılmaz; "şu kütüphanelerde arandı, bulunamadı" yazılır.

## Arama sırası — dosya ararken

1. **Adıyla ara**, konumla değil. `sharepoint_search` tüm kütüphaneleri tarar.
2. Sonuç gelirse **`webUrl`'den kütüphane adını oku** — yol oradadır.
3. Sonuç gelmezse arama terimini değiştir; komşu belgeyi ara. Aynı
   klasördeki bir başka dosya bulunursa konum ortaya çıkar.
4. Kütüphane envanteri çıkmadan "yok" sonucuna varma.

**Tuzak:** `driveId` kütüphaneye özeldir ve dosya taşınınca değişir;
`itemId` ise korunur. Eski bir `driveId` ile sorgulama `NOT_FOUND` döner
— bu "dosya silinmiş" demek DEĞİLDİR, "bu kütüphanede değil" demektir.

---

## SharePoint — BTech-ADD (ADDPARK, kontrollü alan)

Site: `https://btechinnovationas.sharepoint.com/sites/BTech-ADD`
driveId öneki: `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10m`

| Kütüphane | driveId son eki | İçerik |
|---|---|---|
| **00_Yonetisim** | `i4XvuDFMuJTK-C69C9YN3_` | **SİCİLLER · dağıtım kaydı · izin modeli** |
| 01_Kalite | `hu8ziiBbA8RZ_p5dmEzxin` | Prosedürler, MDR, KVKK, denetim |
| 11_KaliteKayitlari | `ixJnX42CWeT6KowzQHB6aA` | Kalite kayıtları, kanıt, izlenebilirlik |
| 99_GelenKutusu | `h04_RTqgeRTb1Xi_Ek00XL` | Gelen kutusu |

### 00_Yonetisim / 01_Sicil-ve-Kayitlar — sicil evi
Klasör itemId: `01NQZXAHCAKSRG3NJDIFD3BTE3GH2SMQFX`

| Dosya | Kapsam |
|---|---|
| `GOV.05_EK1_Sicil_Yonetisim-DMS-Referans.csv` | GOV · DMS · PRJ · REFERANS · YON |
| `GOV.05_EK2_Sicil_QMS-Prosedurler-BT-Denetim.csv` | QMS · PR · IS · DENETIM |
| `GOV.05_EK3_Sicil_MDR-Teknik-Dosya-ve-Etiket.csv` | MDR-TF · ETİKET |
| `GOV.05_EK4_Sicil_KVKK-ve-Hukuk.csv` | KVK · LGL |
| `GOV.05_EK5_Sicil_IK-ve-Idari.csv` | HR · EK |
| `GOV.05_EK6_Sicil_Pazarlama-IT-Uretim.csv` | MK · ODO · URT |
| `GOV.05_EK7_Sicil_Belgelendirme.csv` | Belgelendirme |
| `GOV.05_IDX_Sicil-Haritasi.md` | **Yeni satır yazmadan ÖNCE okunur** |
| `DMS.PRS.01_EK1_Dagitim_Kaydi.csv` | Gelen kutusu dağıtım kaydı |
| `DMS.IDX.02_Kutuphane-ve-Klasor-Haritasi.csv` | Kütüphane haritası |
| `PRJ.01_EK1/EK2` · `PRJ.TDG.01_EK1` | Proje, NAS, test devri sicilleri |

**Yerleşik desen — ana sicili bozmadan ekleme:**
`GOV.05_EKn_EKLENECEK-SATIRLAR_{tarih}_{konu}.csv` ·
`GOV.05_EKn_GUNCELLEME_{tarih}_{konu}.csv` ·
`DMS.PRS.01_EK1_Dagitim_Kaydi_EKLE_{tarih}_{konu}.csv`
Birleştirilince dosya adına `_ISLENDI` eklenir. Yedekler
`GOV.05_EKn_YEDEK_{tarih}_{sebep}.csv` olarak tutulur.

**Açık bulgu (12.09.2026):** `01_Kalite/00_Yonetisim` klasöründe
`GOV.05_EK6_CATALLANMA-NUSHASI_2026-08-20_SILMEYIN_BIRLESTIRILECEK.csv`
duruyor. Asıl EK6 yeni kütüphanede ve günceldir; bu büyük olasılıkla
kütüphane taşınmasının artığıdır. Karar verilmedi.

---

## Grup sicil mimarisi (Eylül 2026)

Her şirketin kendi master sicili var; hepsi `00_Yonetisim/01_Sicil-ve-Kayitlar`
deseninde:

| Şirket | Sicil | Site |
|---|---|---|
| Grup | `GRP.05` | `/sites/BTECH-HUB/00_GrupYonetisim/01_DMS-Standartlari` |
| BTech | `BTE.05` | `/sites/BTech-BTE` |
| Trabtech | `TRB.05` | `/sites/BTech-TRB` |
| Earfit | `EAR.05` | `/sites/BTech-EAR` |
| Vimics | `VIM.05` | `/sites/BTech-VIM` |
| **ADDPARK** | **`GOV.05_EK1…EK7`** | `/sites/BTech-ADD` |

ADDPARK kod olarak `GOV.05` ailesini sürdürüyor; diğerleri `{ŞİRKET}.05`
kodlamasına geçti. Konum deseni aynı. Çatı belgeler: `GOV.10` (grup DMS
çatı prosedürü), `TRB.GOV.10` (Trabtech uygulaması).

---

## Kapsam dışı SharePoint siteleri

`/sites/Projects` · `/sites/BTECHGROUP` · `/sites/ProjeYnetimi-*` ve
diğer şirket siteleri. Bilgi var ama ADDPARK kontrollü alanı değildir.
Bulgular `[KAPSAM DIŞI SITE]` etiketiyle raporlanır.

## Posta

Kutu listesi ve erişim durumu: `mail-tara/references/kutular.md`

## Notion

Aksiyonlar veritabanı: `collection://6bf8bf3a-764b-47b6-bbbb-eb76ca2ceecc`
Founder Dashboard: `31d454a5-e8e9-80d5-8abc-c31b1cf02aa9`
Toplantılar: `collection://31d454a5-e8e9-80e4-aad5-000bfc8e2cf7`

## Odoo

MCP bağlantısı: `btechgroup.odoo.com` · Odoo 18.0 · beş şirket

**Tuzak:** `search_records` varsayılan alan seçimi özel modül alanlarını
DÖNDÜRMEZ. `btech_contact_sequence_code` ve
`btech_project_sequence_code` alanları `fields` parametresinde adıyla
istenmezse boş görünür. 12.09.2026'da bu yüzden "kontak kodu
üretilmiyor" sonucuna varıldı — oysa 8.786 kayıtta doluydu.
**Kural:** bir alanın boş olduğunu iddia etmeden önce `get_fields` ile
modelin tam alan listesi alınır.

`ir.model.access` MCP erişimine kapalıdır; yetki testleri sistemden
doğrulanamaz, erişim hakları dökümü istenir.

---

## Bilinen tuzaklar

- **Kütüphane ≠ klasör.** Yukarıdaki uyarı bölümüne bakın.
- **SharePoint araması kapsam dışına taşar.** Sonuçlar kişisel OneDrive'a
  ve diğer sitelere sızar; `webUrl` içinde `/sites/BTech-ADD/` geçmeyenler
  elenmelidir.
- **URL segmenti klasörün görünen adından farklı olabilir.** Klasör
  yeniden adlandırıldığında SharePoint URL'yi değiştirmez. `webUrl`'de
  `01_Kalite` görünmesi klasör adının `10_Kalite` olmadığı anlamına
  gelmez. Belgede yazan ad esastır.
- **Taranmış PDF okunamaz.** Metin katmanı yoksa `read_resource` boş
  döner. Rapora `[OKUNAMADI: taranmış PDF]` yazılır, "belge boş" denmez.
- **Büyük CSV/xlsx bağlamı doldurur.** 200.000 karakteri aşan dosyalar
  kırpılır; `grep` ile hedefli okuma tercih edilir.
- **Aynı belgenin birden çok kopyası olabilir.** Kontrollü nüsha, gelen
  kutusu kopyası, OneDrive taslağı, çatallanma nüshası. Hangisinin esas
  olduğu sicilden belirlenir.
