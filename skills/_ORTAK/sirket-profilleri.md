# Şirket Profilleri — çok şirketli skill'lerin ortak referansı

Bu dosya her skill'in `references/` klasörüne kopyalanır (ya da oradan
atıf yapılır). Skill ilk adımda şirketi belirler, buradaki bloğu okur,
sonra tek akışı yürütür.

**Şirket nasıl belirlenir (sırayla):**
1. Kullanıcı açıkça söyledi mi ("Trabtech için…")
2. Belge kodunun öneki (TRB. / BTE. / EAR. / VIM. → o şirket; öneksiz
   GOV/PR/MDR/KEK → Addpark)
3. Çalışılan SharePoint sitesi
4. Hiçbiri yoksa **sor** — varsayma.

---

## Sicil modeli — iki tip

| Tip | Kim | Nasıl yazılır |
|---|---|---|
| **BÖLÜNMÜŞ** | Addpark | Önce `GOV.05_IDX_Sicil-Haritasi.md` okunur, ailenin hangi EK dosyasında olduğu belirlenir, satır o EK'e yazılır, EK'in revizyonu ilerletilir |
| **TEK DOSYA** | Trabtech · BTech · Earfit · Vimics | Tek master sicil CSV'si okunur, satır eklenir, dosya revizyonu ilerletilir (dosya adındaki R__ artar) |

Ortak kural: yazmadan önce sicilin o anki hali okunur (aynı gün başka
oturumun yazımını ezmemek için), yazımdan sonra satır sayısı ve boyut
kontrol edilir. Eski revizyon SİLİNMEZ, `99_Onceki-Surumler`'e kopyalanır.

---

## ADDPARK

- Site: `BTech-ADD` · Kalite kütüphanesi: `10_Kalite` · Kayıtlar: `11_Kalite-Kayitlari`
- Gelen kutusu: `99_Gelen-Kutusu`
- Sicil modeli: **BÖLÜNMÜŞ** — `10_Kalite/00_Yonetisim/01_Sicil-ve-Kayitlar/`
  - `GOV.05_IDX_Sicil-Haritasi.md` (hangi aile hangi EK'te)
  - EK1 GOV·DMS·PRJ·YON·REFERANS · EK2 QMS·PR·IS·ISG·DENETİM·PRS·AR ·
    EK3 MDR-TF·ETİKET · EK4 KVK·LGL · EK5 HR·EK · EK6 MK·ODO·URT·YAT·SAT ·
    EK7 BLG (belgelendirme/sertifika)
  - Tek dosyalı eski sicil (`GOV.05_EK1_Master_Dokuman_Sicili.csv`)
    17.09.2026'da SUPERSEDED → `99_Arsiv-Catal-ve-Yedek`. Kullanılmaz.
  - Dağıtım kaydı: `DMS.PRS.01-EK1`
- driveId (00_Yonetisim'in bulunduğu kütüphane):
  `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mi4XvuDFMuJTK-C69C9YN3_`
- Kod şeması: **öneksiz** (GOV.05, PR11, MDR.FR.018, KEK, OEK)
- Standartlar: MDR 2017/745 · ISO 13485 · ISO 14971 · AS9100D
- Özellik: PRRC rolü Kuntay'da; Class III kişiye özel implant kapsamı

## TRABTECH

- Site: `BTech-TRB`
- Sicil modeli: **TEK DOSYA** — `00_Yonetisim/01_Sicil-ve-Kayitlar/`
  - `TRB.05_Trabtech_Master_Dokuman_Sicili_R07.csv` (ana sicil)
  - `TRB.ACT.01_Acik_Isler_Sicili_R01.csv` (açık işler / YGG kararları —
    resmî KYS kaydı, Notion değil)
  - `TRB.05-EK-B_HUB_Grup_Belgeleri_Benimseme_Cetveli_R01.csv`
  - `TRB.MIG.01_..._R00.csv` (taşıma sicili) ·
    `TRB.KEK.DL_EK_Grup-Nusha-Eslemesi_Rev00.xlsx`
- driveId: `b!9CiUnWio3ECS_wTyczFrAuOF6TY95JFDmUyQwxpfmfC8TiSXtQ7sTKN4cLgZnqoW`
- Kod şeması: `TRB.` önekli
- Standart: ISO 13485 (KGS gözetim denetimi geçmişi var)

## BTECH

- Site: `BTech-BTE`
- Sicil modeli: **TEK DOSYA** — `00_Yonetisim/01_Sicil-ve-Kayitlar/`
  - `BTE.05_BTech_Master_Dokuman_Sicili_R03.csv`
  - `BTE.MIG.01` ve `BTE.MIG.02` taşıma sicilleri
  - Yeni kayıt ara dosyası örneği: `BTE.05_YENI-KAYIT_..._ISLENDI-R03.csv`
- driveId: `b!4OGJLdLHU02s0MAEsdiLUuOF6TY95JFDmUyQwxpfmfDeM3LcB0QMRa8Cz23dsiqY`
- Kod şeması: `BTE.` önekli (pazarlama: BTE.MK.*, satış: BTE.SAT.*)
- Standart: ISO 9001 · EYDEP (C→B yükseltme hedefi)
- Özellik: ticari/distribütörlük şirketi — kalite yükü hafif, ticari
  belge ağırlıklı

## EARFIT

- Site: `BTech-EAR`
- Sicil modeli: **TEK DOSYA** — `00_Yonetisim/01_Sicil-ve-Kayitlar/`
  - `EAR.05_Earfit_Master_Dokuman_Sicili_R03.csv`
  - `EAR.06_Proje-ve-Ticari-Kayit-Indeksi_R00.csv`
- driveId: `b!Sl3YgSfJG0mLvkucbci3auOF6TY95JFDmUyQwxpfmfDLyTayr8ZBSoMr_UGn3MNd`
- Kod şeması: `EAR.` önekli
- Standart: hafif kalite sistemi (tıbbi cihaz kapsamı yok; işitme
  koruma/IEM ürünleri)

## VIMICS

- Site: `BTech-VIM`
- Sicil modeli: **TEK DOSYA** — `00_Yonetisim/01_Sicil-ve-Kayitlar/`
  - `VIM.05_Vimics_Master_Dokuman_Sicili_R05.csv`
  - `VIM.IDX.01_Nerede-Ne-Var_Rev00.md` (konum haritası — önce bu okunur)
  - `KYS-ACT-01_VIMICS_Acik-Isler-Sicili_Rev00.xlsx` (açık işler)
    → KARAR 24.09.2026: **CSV'ye çevrilecek**, diğer şirketlerle aynı
    biçime gelecek. Çevrim yapılana kadar skill bu dosyaya yazmaz,
    kullanıcıyı uyarır.
  - `99_Onceki-Surumler/` alt klasörü mevcut
- driveId: `b!bAJVcXZJVU-YCxe9V1Wer-OF6TY95JFDmUyQwxpfmfCjNoDpBWxMRIljdZ6XFv0R`
- Kod şeması: `VIM.` önekli
- Standart: veteriner ürünler; tıbbi cihaz mevzuatı kapsamı dışında

## BTECH-HUB (grup)

- Site: `BTECH-HUB` — grup standartları, politikalar, ortak şablonlar
- Gelen kutusu: `09_Gelen-Kutusu` (grup seviyesi)
- Pazarlama merkezi: `04_PazarlamaMerkez/01_Politika-ve-Standartlar`
- Şirketler HUB belgelerini "benimseme çetvelesi" ile devralır
  (Trabtech'te TRB.05-EK-B)

---

## Doğrulanmamış / açık noktalar

- Dört şirketin gelen kutusu klasör adları (`99_Gelen-Kutusu`) tek tek
  doğrulanmadı — yerleştirme yapmadan önce listelenir.
- EAR ve VIM'de dağıtım kaydı muadili yok → KARAR 24.09.2026: **kurulacak**
  (Addpark'taki DMS.PRS.01-EK1 ile aynı kolon düzeninde, şirket önekiyle).
  Kurulana kadar `dokuman-yayinla` B7 adımında kaydı oluşturmayı önerir.
- VIM açık işler sicili CSV'ye çevrilecek (yukarıda).
- itemId'ler değişebilir; skill her oturumda klasörü listeleyerek
  doğrular, bu dosyadaki driveId'leri başlangıç noktası olarak kullanır.
