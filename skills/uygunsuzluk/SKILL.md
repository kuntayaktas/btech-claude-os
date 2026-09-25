---
name: uygunsuzluk
description: ADDPARK'ın yürürlükteki kalite dokümanlarını MDR 2017/745, ISO 13485, ISO 14971 ve ilgili standartların şartlarına karşı tarar, uygunsuzluk adaylarını kanıtıyla birlikte tespit eder, bulgu siciline yazmadan önce onay ister; kalite ekibi KABUL ettikten sonra aynı skill PR13.FR02 (8D) Düzeltici Faaliyet Formu taslağını üretir. Kullanıcı "uygunsuzluk tara", "uygunsuzluk var mı", "bu belgeyi denetle", "MDR'a uygun mu", "şarta karşı kontrol et", "bulgu çıkar", "NC tara", "denetime hazır mı", "atölyeye yaz", "kabul edilenleri DÖF'e çevir", "DÖF aç", "8D formu hazırla" dediğinde MUTLAKA bu skill'i kullan. Girdi bir veya birkaç belge kodu/adıdır (PR14, MDR.FR.022, KEK.UM gibi). Yalnız ADDPARK / BTech-ADD ortamı için geçerlidir. Yayın öncesi taslak kontrolü BU SKILL DEĞİL `dokuman-denetle`'dir.
version: 1.0
---

# ADDPARK Uygunsuzluk Tespiti ve DÖF

Bu skill'in işi: **yürürlükteki bir belgenin, bağlayıcı bir şartı
karşılayıp karşılamadığını kanıta dayalı olarak söylemek** — ve
karşılamıyorsa bunu kalite ekibinin değerlendirebileceği bir aday
bulguya dönüştürmek.

Bu bir denetim aracıdır. Ürettiği her satır ileride bir DÖF'ün
dayanağı olabilir. **Kanıtsız bulgu, yanlış bulgudan daha zararlıdır** —
kalite ekibinin güvenini bir kez kaybederse atölye ölür.

## Bu skill NE DEĞİLDİR

| Değil | Doğru yer |
|---|---|
| Yayın öncesi taslak kontrolü | `dokuman-denetle` |
| Resmi DÖF sicili tutmak | PR13.FR03 DÖF Takip Formu (kalite ekibi) |
| Belgeye kod/revizyon verme, sicile yazma | `dokuman-yayinla` |
| Gelen kutusu tasnifi | `gelen-kutusu-isle` |
| Hasta vakası dosyası | `mdr-case-create` |
| Serbest araştırma | `addpark-research-no-internet` |

Okuma gerektiğinde `addpark-research-no-internet` kurallarını uygula
(kapsam kilidi, uydurma yok, belge içi bilgi esas). Ayrı skill olarak
çağırma — kurallarını içeride uygula.

## Beş mutlak kural

**1. KAPSAM: yalnız BTech-ADD.**
`references/kapsam-kilidi.md`. Başka site, OneDrive, internet yok.
Mevzuat metni gerekiyorsa `references/mevzuat-matrisi.md` kullanılır —
matris donmuştur, her çalıştırmada yeniden yorumlanmaz.

**2. ŞART MERKEZLİ, BELGE MERKEZLİ DEĞİL.**
Değerlendirme birimi belge değil **şart**tır. "Bu belgede X yazmıyor"
bulgu değildir. Bulgu ancak şart **sistemin hiçbir yerinde**
karşılanmıyorsa açılır. Bu kuralın uygulaması U3 kapısıdır ve
atlanamaz.

**3. KANITSIZ BULGU YOK.**
Her bulgu belgeden birebir alıntı veya bölüm atfı taşır. Kanıt alanı
boşsa satır üretilmez. "Muhtemelen eksik", "görünüşe göre" ifadeleri
yasaktır.

**4. DOĞRULANMAMIŞ ŞARTTAN BULGU ÇIKMAZ.**
`mevzuat-matrisi.md`'de `Doğrulama = DOĞRULANDI` olmayan satır üzerinden
bulgu açılamaz. `ÜRÜN BAZLI` işaretli şartlarda önce uygulanabilirlik
kullanıcıya sorulur.

**5. KİŞİSEL VERİ YAZILMAZ.**
Atölye kontrolsüz bir alanda durur. Hasta adı, hekim adı, müşteri kişi
adı ve benzeri kişisel veri atölyeye de, taslak DÖF'e de yazılmaz.
Vaka atfı yalnız vaka kodu (AP...) ile yapılır.

**6. ONAYSIZ YAZMA YOK.**
Bulgu siciline satır eklemeden önce tam onay tablosu gösterilir ve
"yazayım mı?" diye sorulur. `10_Kalite`'ye, GOV.05'e, vaka
siciline, sicil CSV'lerine **hiçbir koşulda** yazılmaz.

---

## Mod A — Tespit (U0 → U5)

### U0 — Kapsam ve girdi kilidi
Belge kodları alınır. Belge BTech-ADD dışındaysa dur. Belge
bulunamazsa uydurma — tam tarama yap, yine yoksa "belge yok" bulgusu
aç (hayalet kayıt kontrolü: GOV.05'te var mı?).

### U1 — Belge künyesi ve yürürlük
Şunlar **belgenin içinden** okunur, dosya adından değil:
kod · başlık · revizyon · tarih · onay durumu.
Sonra GOV.05 sicil satırıyla karşılaştırılır. Üçü (sicil / dosya adı /
belge içi) ayrışıyorsa bu **kendi başına bir bulgudur** ve kaydedilir.

Revizyon kökeni kuralı geçerlidir: legacy ISO 13485 belgesi → temel
çizgi v07; MDR süreciyle doğan belge → temel çizgi v00. Belirsizse
kullanıcıya sorulur, tahmin edilmez.

### U2 — Şart eşlemesi
`references/mevzuat-matrisi.md` açılır. Belgenin konusuna göre ilgili
SM kodları seçilir. **Matristen seçilir, belgeden türetilmez** —
belgenin bahsetmediği şart da o belgenin sorumluluğunda olabilir.

Eşleme belge ailesine göre başlangıç noktası alır:

| Belge ailesi | Tipik şart kümesi |
|---|---|
| PR (prosedür) | ISO 13485 ilgili maddesi + varsa MDR karşılığı |
| MDR.FR (teknik dosya formu) | MDR Ek XIII, Ek I, Md. 61/83-92, ISO 14971 |
| KEK / OEK | ISO 13485 §4-§8 bütünü, AS9100D karşılıkları |
| LBL (etiket) | MDR Ek I Böl. III §23, SM-006, SM-033 |
| KVK | KVKK / GDPR + ISO 13485 §4.2.5 |
| GOV / DMS | ISO 13485 §4.2, MDR Md. 10(5) |

### U3 — Karşılanma testi (yalancı pozitif freni)
Her şart için sırayla:
1. **Belgenin kendisinde** karşılanıyor mu? → Evet ise bulgu yok.
2. **Sistemin başka bir belgesinde** karşılanıyor mu? Sicil + hedefli
   arama + gerekirse tam tarama. → Evet ise bulgu yok, ancak "atıf
   zinciri kopuk mu" ayrı olarak değerlendirilir.
3. **Hiçbir yerde yok** → bulgu açılır.

Aranan yerlerin listesi bulguya yazılır. Arama yapılmadan 3. adıma
geçilemez.

### U4 — Bulgu kaydı
Format ve zorunlu alanlar: `references/bulgu-formati.md`
Sınıflandırma ve aksiyon tipi: `references/siniflandirma-ve-esikler.md`

### U5 — Onay ve yazma
Tam tablo gösterilir → "Atölyeye yazayım mı?" → onay gelirse
`references/atolye-dosyasi.md` yordamıyla yazılır. Onay gelmezse
hiçbir şey yazılmaz, çıktı sohbette kalır.

**Yazıldıktan sonra skill durur.** Kabul kararı kalite ekibinindir,
skill'in değil.

Her bulgu satırı, bulgu sicilinin 23 kolonundan zorunlu olanları taşır —
özellikle `Sicil Hattı` (Endüstriyel / Medikal), `Kaynak (PR13.FR02)`
ve `DÖF Türü`. Bu üçü boşsa satır PR13.FR02'ye devredilemez.

---

## Mod B — DÖF taslağı (PR13.FR02, 8D)

Tetiklenme: "kabul edilenleri DÖF'e çevir", "DÖF aç", "CAPA taslağı hazırla".

**Yürürlükteki form PR13.FR02 Düzeltici Faaliyet Formu'dur (8D).**
PR13-F01 ayrı bir form olarak üretilmez; onun getirdiği MDR kapıları
PR13.FR02'nin içine "MDR Ön Değerlendirme" bloğu olarak girer.

**Ön koşul — atlanamaz:** bulgu sicili CSV'si okunur, yalnız `Durum = KABUL`
satırları işlenir. `TASLAK` veya `İNCELENDİ` satırından DÖF üretilmez.
Skill satırın durumunu kendisi değiştirmez.

### 8D iskeleti — atölyeden gelen ve skill'in dolduracağı alanlar

| Bölüm | Kaynak |
|---|---|
| Üst blok — Kaynak kutusu | Bulgu sicili `Kaynak (PR13.FR02)` kolonu |
| Üst blok — Parça No / Vaka | Vaka kodu (AP...). **Hasta adı yazılmaz** |
| **D1** Uygunsuzluğun Tanımı | Bulgu sicili `Tespit (TR)` + `Finding (EN)` + `Kanit` |
| **MDR Ön Değerlendirme** (D1–D2 arası, yeni blok) | G1 saha etkisi · G2 trend (PR16: aynı cihaz ailesi + aynı hata modu, 6 ayda 3 olay) · G3 ürün/lot etkisi · G4 containment. Bulgu sicili `Urun-Vaka Etkisi` kolonu bu bloğun girdisidir. Cevaplanmadan devam edilmez, tahmin edilmez |
| **D2** Takımın Oluşturulması | Kullanıcıya sorulur; skill isim uydurmaz |
| **D3** Geçici Faaliyetler ve Acil Önlemler (24 saat) | G4 containment çıktısı. Ismarlama cihazda **yeniden işleme yok** (PR14 §3) — cihaz elden çıkarılır, vaka yeniden üretilir |
| **D4** Kök Neden | **Ishikawa** (Ortam · Makina · Metot · İnsan · Malzeme) **+ 5 Whys**. Katmanlı anlatım (doğrudan/sistem/katkı eden) kullanılmaz — form Ishikawa istiyor |
| **D5** Kalıcı Aksiyonlar | Her satır sorumlu ve planlanan tarih taşır; boş bırakılmaz, kullanıcıya sorulur |
| **D6** Kalıcı Aksiyonların Uygulanması | Uygulama notu |
| **D7** Hata Tekrarını Önleyici Aksiyonlar | Bulgu sicili `DOF Turu = Önleyici` ise zorunlu doldurulur |
| **D8** Kapanış | Kabul / Ret / Yeni DF + **QMR onayı**. Skill kapatmaz, yalnız bloğu hazırlar |

### Numaralandırma
Biçim **`PR13.FR02.NNN`** — her iki sicil hattı için aynı. Hat ayrımı
atölyedeki `Sicil Hattı` kolonundan ve PR13.FR03'ün ilgili sayfasından
gelir, koddan değil. Eski kayıtlar (Medikal sayfadaki `PR13.FR03.NN`)
olduğu gibi bırakılır, geriye dönük düzeltilmez.

**Numarayı skill atamaz** — taslakta `PR13.FR02.XXX` bırakılır. Gerçek
numara PR13.FR03 DÖF Takip Formu'ndaki son sıradan devam eder ve kalite
ekibi verir.

### DÖF mü DKK mı düzeltme mi
`references/siniflandirma-ve-esikler.md`. Yalnız doküman metni
değişecekse DKK yeter, DÖF açılmaz. DKK açılıyorsa DÖF o satırı DKK'ya
devreder ve kapanışı DKK'dan izler.

### Çıktı ve devir
Taslak `/mnt/user-data/outputs/`'a düşer, SharePoint'e yazılmaz.
Bulgu sicilindeki satırın `DÖF No` kolonuna hangi kayda gittiği, `Durum`
kolonuna `DEVREDİLDİ` yazılır — bu yazma da onaya tabidir.
PR13.FR03 DÖF Takip Formu'na satır **skill tarafından eklenmez**;
kalite ekibi ekler.

## Dil ve ton

Çift dilli (TR/EN). Diplomatik, sistemi kırılgan göstermeyen dil:
"iyileştirme fırsatı", "güçlendirme alanı". Kaçınılacak: "yapmadık",
"eksik bırakılmış", "hiç düşünülmemiş". Bulgunun sınıfı (Kritik/Major/
Minor) yumuşatılmaz — yumuşatılan anlatımdır, tespit değil.

Onaylanmış kuruluşun adı belgelerde geçmez; "onaylanmış kuruluş /
Notified Body" yazılır.

## Bilinmesi gereken sistem gerçekleri

- GOV.05 sicili geride kalabilir ve hayalet kayıt taşır — indeks, kanıt değil.
- `read_resource` xlsx'i düzgün okumaz ve ikili indirme aracı yok. Bu yüzden
  **canlı veri CSV'de tutulur**, xlsx yalnız referanstır: `references/atolye-dosyasi.md`.
- ADDPARK'ta ısmarlama cihazda **yeniden işleme yoktur** (PR14 §3);
  cihaz elden çıkarılır, vaka yeniden üretilir. Containment önerileri
  bunu varsayar.
- Yürürlükteki DÖF formu PR13.FR02 (8D), sicili PR13.FR03 (iki sayfa: Endüstriyel / Medikal). PR13.FR03'ün 53 kaydının tamamı "Düzeltici" — "Önleyici" hiç kullanılmamış.
- Ürün risk dosyası MDR.FR.018, KYS proses riski PR17-F01 — karıştırılmaz.
- Dış laboratuvar kanıtları EVD kod ailesinde ve MDR.FR.EVD-REG
  sicilinde; biyouyumluluk bulgularında oraya bakılır.
