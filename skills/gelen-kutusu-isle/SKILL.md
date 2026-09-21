---
name: gelen-kutusu-isle
description: BTech-ADD SharePoint sitesindeki 99_Gelen-Kutusu kütüphanesine bırakılan dosyaları tasnif eder, doğru kütüphane ve klasörü belirler, kullanıcıdan onay aldıktan sonra kopyalar ve dağıtım kaydını tutar. Kullanıcı "gelen kutusunu işle", "gelen kutusuna dosya bıraktım", "şu dosyaları yerine koy", "bunları tasnifle", "dosyaları dağıt" gibi bir şey söylediğinde MUTLAKA bu skill'i kullan. Ayrıca kullanıcı bir dosyanın nereye gitmesi gerektiğini sorduğunda da kullan — tasnif kuralları burada tanımlıdır. Kapsam tasnif ve yerleştirmedir; doküman kodu verme, revizyon atama ve GOV.05 siciline kaydetme BU SKILL'İN İŞİ DEĞİLDİR — dokuman-yayinla'ya devredilir. Ayrıca `dokuman-yayinla` Faz A'dan gelen, kodu ve revizyonu üzerinde yazılı YAYIN ADAYI belgeleri de bu skill yerleştirir ve ardından dokuman-yayinla Faz B'ye devreder. Sadece BTech-ADD (Addpark) sitesi için geçerlidir.
---

# Gelen Kutusu İşleme

99_Gelen-Kutusu bir depo değil, bir **kuyruktur**. Amaç: hiçbir belgenin
"sonra bakarım" diye kişisel alanda kalmaması ve hiçbir belgenin tahminle
yanlış yere konmaması.

Yanlış yere konan belge, kaybolmuş belgedir. Emin değilsen sor.

## Akış — ÖNCE İŞLE, SONRA TEK ONAY, EN SON YAZ

Bu sıra 02.08.2026'da bilinçli olarak değiştirildi. Eski akış dosya
başına soru soruyordu ve on dosyalık bir parti on kesintiye yol açıyordu.

**Faz 1 — İşle (yazma yok).**
1. `99_Gelen-Kutusu/00_Yeni` içeriğini listele
2. Parti oluştur: **en fazla 5 dosya**. Fazlası varsa ilk beşi al, kalanı
   sıradaki partiye bırak ve kullanıcıya kaç dosya kaldığını söyle
3. Her dosya için adına, içeriğine ve gerekiyorsa ilk sayfalarına bak
4. **Tür sınıfını** belirle (aşağıdaki tablo)
5. Üç zorunlu kontrolü uygula
6. Hedef kütüphane ve klasörü belirle — `references/tasnif-kurallari.md`
7. Yeni adı hesapla

**Faz 2 — Tek onay kapısı.**
8. Partinin tamamı için **tek tablo** sun ve onay al. Dosya başına soru
   sorulmaz. Faz 1'de hiçbir kalıcı yazma yapılmamış olmalıdır

**Faz 3 — Yaz.**
9. Onaylananları hedefe kopyala
10. Kaynağı `01_Islenmis` altına taşı
11. İtiraz edilen veya belirsiz olanları `02_Karar-Bekleyen`'e taşı, neyi
    sorduğunu yaz
12. Dağıtım kaydı CSV'sine satır ekle

## Tür sınıfları

Tasnif kararı önce türden geçer:

| Sınıf | Ne | Hedef mantığı |
|---|---|---|
| **YAYIN-ADAYI** | `dokuman-yayinla` Faz A çıktısı: antetli, kodu ve revizyonu belgenin üzerinde yazılı, henüz GOV.05'te KAYITLI DEĞİL | Belgenin kendi ilan ettiği hedef. Ad **değiştirilmez**. Yerleştirildikten sonra kullanıcıya "`dokuman-yayinla` Faz B çalıştır" denir — sicil satırı orada yazılır |
| **İÇ-KONTROLLÜ** | Kodu, revizyonu ve sicil kaydı olan ADDPARK belgesi (PR, MDR.FR, KEK, GOV…) | Kod ailesinin kütüphanesi. Yeni kod/revizyon **verilmez** — gerekiyorsa `dokuman-yayinla`'ya devredilir |
| **TEKNİK-YAYIN** | Kontrollü teknik makale / beyaz kâğıt (MK.YAY, MKT.WP) — müşteri ve iş ortağı paylaşımına açık | `60_Pazarlama-Kurumsal/12_Teknik-Yayinlar`. Kaynak dosya ve üretim aracı aynı klasörün `_Kaynak` alt klasörüne; sicil satırı **EK6**'ya |
| **İÇ-TASLAK** | ADDPARK üretimi ama henüz kontrollü değil | `98_Taslaklar` veya ilgili çalışma klasörü. `(D)` öneki alabilir |
| **DIŞ-RESMÎ** | Kurum/müşteri/tedarikçi çıktısı (TÜBİTAK, KOSGEB, sertifika, laboratuvar raporu, MSDS) | Adı **değiştirilmez**. Tür kararı belirsizse **kullanıcı satır bazında verir** — skill karar vermez |
| **HAM-VERİ** | Ölçüm çıktısı, fotoğraf, log, CAD türevi | Proje veya üretim klasörü; hassassa NAS'a yönlendirilir |

Sınıf belirlenemiyorsa `02_Karar-Bekleyen`.

## Bu skill NE YAPMAZ

| Yapmaz | Doğru yer |
|---|---|
| Doküman kodu verme, revizyon atama | `dokuman-yayinla` |
| GOV.05 Master Sicil'e kayıt | `dokuman-yayinla` |
| Belge içeriğini denetleme, düzeltme | `dokuman-denetle` |
| Uygunsuzluk açma | `uygunsuzluk` |
| Vaka dosyası üretme | `mdr-case-create` |

Gelen kutusundaki bir belge yayına hazırsa: tasnif edilir, yerine konur
ve kullanıcıya "`dokuman-denetle` → `dokuman-yayinla` çalıştırılmalı"
denir. Bu skill kod vermez.

## YAYIN ZİNCİRİ — dokuman-yayinla ile birlikte çalışma

Binary kontrollü belgeler (docx, pdf, xlsx, pptx) connector üzerinden
yüklenemez: tek yol mesaj içinde base64 ve 90 KB'lık bir docx bile ~120 bin
karakter demektir. Bu yüzden dosyayı SharePoint'e sokan adım **gelen
kutusudur**. Zincir:

```
dokuman-denetle          bulgular temizlenir
   ↓
dokuman-yayinla FAZ A    kod · revizyon · antet · hedef · dosya adı
                         (hiçbir yazma yok, sicil temiz kalır)
   ↓
KULLANICI                iki dosyayı 99_Gelen-Kutusu/00_Yeni içine bırakır
   ↓
gelen-kutusu-isle        tür = YAYIN-ADAYI → ilan edilen hedefe kopyalar,
                         kaynağı 01_Islenmis'e taşır, dağıtım kaydını yazar
   ↓
dokuman-yayinla FAZ B    dosyanın hedefte olduğunu DOĞRULAR, önceki sürümü
                         arşivler, GOV.05_EK{n} satırını ve EK1 revizyonunu yazar
```

**YAYIN-ADAYI belgede bu skill:**
- Adı **değiştirmez** — ad `dokuman-yayinla`'da kurala göre hesaplanmıştır
- `(D)` veya başka durum öneki **eklemez** — kontrollü belge önek almaz
- Hedefi belgenin kapağındaki koddan ve kullanıcının Faz A'da onayladığı
  hedeften alır; kendi başına yeni hedef seçmez
- Kopyalama sonrası kullanıcıya **"dokuman-yayinla Faz B çalıştırılmalı,
  belge henüz sicilde kayıtlı değil"** der. Bu cümle atlanamaz: atlanırsa
  belge kütüphanede durur ama kontrollü sayılmaz
- **GOV.05'e dokunmaz.** Dağıtım kaydı (`DMS.PRS.01-EK1`) ayrı bir kayıttır
  ve o yazılır

Metin belgeleri (`.md`, `.csv`, `.txt`) bu zincire girmez —
`dokuman-yayinla` onları doğrudan hedefe yazar.

## Kütüphane kimlikleri

Bu sitede kütüphanelerin **görünen adı ile URL'i farklıdır** (yeniden
adlandırma URL'i değiştirmez). Arama ve klasör işlemleri için driveId
gerekir; tam liste `references/kutuphane-haritasi.md` dosyasındadır.

Boş bir kütüphanenin driveId'si aramayla bulunamaz — içinde en az bir
klasör olmalıdır. Böyle bir durumda kullanıcıdan klasör açmasını iste.

## Onay kapısı — tek, atlanmaz

Parti için tek tablo:

| # | Dosya | Tür | Hedef kütüphane / klasör | Yeni ad | Gerekçe |
|---|---|---|---|---|---|

Altına: "Bu {n} dosyayı yerleştireyim mi?"

Kullanıcı onaylamadan hiçbir şey kopyalanmaz. Bir satıra itiraz gelirse
o dosya `02_Karar-Bekleyen`'e gider, diğerleri işlenir. Kısmi onay
normaldir; her şeyin onaylanmasını bekleme.

## Klasör açmadan önce rehberi oku

Hedef kütüphanelerin kökünde `_KLASOR-REHBERI-*.md` dosyası olabilir ve
numaralandırma şemasını tanımlar. **Yeni klasör açmadan önce okunur.**

Gerçek vaka: `11_Kalite-Kayitlari` altına `12_Kanit-EVD` açıldı; kütüphanede
zaten `12_Olcme-ve-Iyilestirme` vardı ve rehberde `09_Test-ve-Validasyon`
"test sonuçları" için tanımlıydı. Hem numara hem kavram çakıştı. Rehber
okunsaydı ikisi de olmazdı.

Boş numaralar bilinçli olabilir — 05 numarası İK kayıtları 50_IK'da
tutulduğu için boştur, doldurulmaz.

## Taranmış belge uyarısı

Dış laboratuvar raporları çoğunlukla taranmış PDF'tir ve **SharePoint
içerik aramasında görünmez**. "Aramada çıkmadı" belgenin olmadığı
anlamına gelmez.

Bir belgeyi ararken önce `sharepoint_folder_search` ile klasör adına bak,
sonra `read_resource` ile klasörü listele. İçerik araması son çaredir.

## Üç zorunlu kontrol

Tasnif kararından önce sırayla uygula. Detay: `references/tasnif-kurallari.md`

**1. Gizlilik testi.** Belgede "GİZLİ", "Yalnızca Üst Yönetim",
"Confidential" ibaresi veya kasa/borç/kişi bazlı maaş/yatırımcı görüşmesi/
savunma teknik detayı varsa 80_Yonetim veya 81_Hukuk dışına çıkmaz.

**2. Sürüm testi.** Aynı belgenin daha eski sürümü hedefte varsa, eski
sürüm hedefin `99_Arsiv` klasörüne taşınır. İki sürüm asla aynı klasörde
durmaz.

**3a. Kod–içerik eşleşme testi.** Kanıt dosyalarında dosyanın gerçekten
o kanıt olduğu **açılarak** doğrulanır. Gerçek vaka: `EVD.MECH.001` kodu
altında ERA laboratuvar raporu yerine ADDPARK'ın kendi raporunun kopyası
duruyordu; sicil doğru, dosya yanlıştı. Kod atamadan önce ilk sayfaya bak.

**3. Adlandırma testi.** DMS.STD.02'ye uygunluk. Resmî kurum çıktılarının
(TÜBİTAK PRODİS, KOSGEB, AB) adı **değiştirilmez** — denetimde o adla
aranır. Diğerleri standarda çekilir.

## Kişisel veri

Belgede özlük, bordro, sağlık, kimlik veya adli sicil verisi varsa hedef
yalnızca 50_IK'dır ve kısıtlı klasörlerdendir. Proje klasörlerinde
personel özgeçmişi bulunabilir (TÜBİTAK eki olarak) — bu normaldir, ama
gelen kutusundan proje klasörüne yeni CV konulmaz.

## Belirsizlik

Şunlardan biri varsa `02_Karar-Bekleyen`'e al ve sor:

- İki kütüphane de makul görünüyor
- Belgenin hangi projeye ait olduğu anlaşılmıyor
- Aynı adla farklı içerikli bir belge zaten var
- Gizlilik sınıfı belirsiz

Tahmin etme. Bir cümlelik soru sor.

## Sicil ve kayıt dosyalarının KONUMU — tek doğru yer

**En sık yapılan hata budur.** Sicil ve kayıt dosyaları `10_Kalite/00_Yonetisim`
klasöründe **ARANMAZ**. Oradaki nüshalar 26.08.2026 taşımasından kalan
çatallanma kopyalarıdır ve `_CATALLANMA-NUSHASI` / `_BIRLESTIRILDI` ekleri taşır.
Onlara yazmak sicili ikiye böler.

Gerçek konum **site seviyesi `00_Yonetisim` kütüphanesi / `01_Sicil-ve-Kayitlar`**:

```
driveId  : b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mi4XvuDFMuJTK-C69C9YN3_
klasör   : 01_Sicil-ve-Kayitlar
itemId   : 01NQZXAHCAKSRG3NJDIFD3BTE3GH2SMQFX
```

| Dosya | itemId | Ne için |
|---|---|---|
| `DMS.PRS.01_EK1_Dagitim_Kaydi.csv` | `01NQZXAHFNDYBJKWYFEVBLQZQ2YC5ALC6Z` | **Bu skill'in yazdığı kayıt** (Cilt 2, açık) |
| `GOV.05_EK1_Sicil_Yonetisim-DMS-Referans.csv` | `01NQZXAHA6EKX5E6RCFVBLDRO3GNUZJIW5` | GOV·DMS·PRJ·YON·REFERANS |
| `GOV.05_EK2_Sicil_QMS-Prosedurler-BT-Denetim.csv` | `01NQZXAHDEN7MHBG64ARDYJ5CWUW7NQMWP` | QMS·PR·IS·ISG·DENETİM |
| `GOV.05_EK3_Sicil_MDR-Teknik-Dosya-ve-Etiket.csv` | `01NQZXAHHKR7IKKD66FFH24OD6C2OA5VPU` | MDR-TF·ETİKET |
| `GOV.05_EK4_Sicil_KVKK-ve-Hukuk.csv` | `01NQZXAHGIOHHIY3YWGZCLGXUNMFLUWAQG` | KVK·LGL |
| `GOV.05_EK5_Sicil_IK-ve-Idari.csv` | `01NQZXAHEXHEQHQ5M3X5FL2UUKJ3PIRHEA` | HR·EK |
| `GOV.05_EK6_Sicil_Pazarlama-IT-Uretim.csv` | `01NQZXAHHP2FS4JCPGTJCKQXO4N6BFRWCN` | MK·ODO·URT·YAT·SAT |
| `GOV.05_EK7_Sicil_Belgelendirme.csv` | `01NQZXAHDKAUURAJLYN5DKULWXC4NELEBN` | BLG |
| `GOV.05_IDX_Sicil-Haritasi.md` | `01NQZXAHDOOG6AG5IL4VA2NREFOSZUHFKA` | Aile→EK eşlemesi, kolon şeması |

**itemId değişebilir.** Kullanıcı dosyayı yeniden yüklerse yeni itemId alır.
Yazmadan önce klasörü `read_resource` ile listele ve dosyayı adıyla doğrula.

**Bu kütüphane aramada çıkmaz** (izin kalıtımı kırık). `sharepoint_search`
boş dönerse dosya yok demek değildir — klasörü doğrudan listele.

## Dağıtım kaydı — CSV

```
Dosya : DMS.PRS.01_EK1_Dagitim_Kaydi.csv   (yukarıdaki tabloda)
Biçim : ayraç `;` · UTF-8 · BOM korunur · Python csv QUOTE_MINIMAL
```

Kolonlar: `Dosya · Tarih · Hedef Kutuphane · Hedef Klasor · Gizlilik (G/İ/K/Ö) ·
Gerekce · Surum testi · Dogrulandi · Tur · Bag`

Prosedürün kendisi (`DMS.PRS.01`) `10_Kalite/02_Prosedurler`'dedir. Kayıt bir
markdown bölümü değil, CSV dosyasıdır; `read_resource` ile okunur,
`sharepoint_upload_file` ile `conflictBehavior: replace` ve **tam içerik**
olarak yazılır.

### Yazma kuralı — çatallanma yasağı

1. **Önce oku.** Mevcut sürüm okunmadan yazılmaz (R05 regresyon dersi)
2. **Tam içerik yaz.** Kısmi yazma yoktur; dosya baştan sona gönderilir
3. **BOM korunur**, ayraç `;`, tırnaklama QUOTE_MINIMAL
4. **Uydu dosya açma.** `_EKLE_`, `_YEDEK_`, `_YENI-KAYIT_` gibi yan dosyalar
   sicili böler. Sicil klasöründe hâlihazırda 13 böyle dosya var, çoğaltma
5. **itemId değişmemeli.** Yazma sonrası dönen itemId farklıysa yeni dosya
   oluşmuştur — bu bir çatallanmadır, derhal bildir

**`Dogrulandi` = Evet yalnızca hedef dosya boyutu kaynakla karşılaştırıldıysa
yazılır.** Karşılaştırılmadıysa Hayır.

`Tur` kolonuna yukarıdaki tür sınıfı yazılır.

## Teknik kısıtlar

- **Kütüphaneler arası `sharepoint_move_item` çalışmaz** (Graph desteklemiyor).
  Kopyala, sonra kaynağı taşı/sil. Aynı kütüphane içinde taşıma çalışır
- **30 MB üzeri veya çok alt klasörlü kopyalarda Graph 504 verir** ve işlem
  yarıda kalabilir. Hedef boyutunu kaynakla **mutlaka** karşılaştır
- Boş bir kütüphanenin driveId'si aramayla bulunamaz; içinde en az bir
  klasör olmalı
- `read_resource` xlsx'i bozuk okur — xlsx içeriğine göre tasnif kararı
  verilmez, dosya adı ve bağlamı kullanılır veya kullanıcıya sorulur

## Yayın hedefi olmayan konumlar

Gelen kutusundan buraya dosya konmaz:

- `10_Kalite/00_Yonetisim` — sicil ve kayıt dosyalarının **çatallanma nüshaları**
  buradadır; gelen kutusundan buraya dosya konmaz, buradaki sicillere yazılmaz
- `10_Kalite/97_On-Calisma-Kontrolsuz` — uygunsuzluk atölyesi, yalnız
  `uygunsuzluk` skill'i yazar
- `10_Kalite/99_Arsiv-Obsolete` — yalnız süperse edilen sürümler
- Kişisel OneDrive · BTech-ADD dışındaki siteler

## Temizlik

`01_Islenmis` 30 gün sonra boşaltılır. Kullanıcıya hatırlat, kendin silme.
