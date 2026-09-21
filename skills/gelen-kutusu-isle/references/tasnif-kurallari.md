# Tasnif Kuralları

## İçerik → hedef

| İçerik | Hedef |
|---|---|
| Prosedür, talimat, form, kalite kaydı, MDR belgesi | 10_Kalite |
| Proje başvurusu, öneri, hakem yazışması, ret/kabul yazısı | 20_Proje-Basvurulari |
| Yürüyen proje belgesi | 21_Projeler-Aktif/{proje kodu}/{alt klasör} |
| Kapanmış proje belgesi | 22_Projeler-Arsiv/{proje kodu}/ |
| AGY, harcama, YMM raporu, transfer ödeme | 23_Proje-Mali/{proje kodu}/ |
| Üretim kaydı, kalifikasyon, kalibrasyon, muayene | 30_Uretim |
| Teklif, sipariş, tedarikçi, ithalat | 31_Satinalma-Tedarik |
| Mali tablo, bütçe, banka, vergi, fatura | 40_Finans |
| Özlük, bordro, iş sözleşmesi, izin, eğitim kaydı | 50_IK |
| Marka, web, sosyal medya, sunum, pazar raporu | 60_Pazarlama-Kurumsal |
| IT envanteri, yedekleme kaydı, erişim matrisi | 70_IT-Guvenlik |
| YK kararı, yönetici raporu, organizasyon, yatırımcı, strateji | 80_Yonetim |
| Sözleşme, NDA, dava, mevzuat, patent, KVKK hukuki | 81_Hukuk |

## Sınır çizgileri — en çok karışan yerler

**Prosedür mü kayıt mı?**
Kontrollü belge (prosedür, talimat, şablon) → 10_Kalite.
O prosedürün uygulanmasından doğan kayıt → ilgili operasyon kütüphanesi.
Örnek: IS_05 Yedekleme Prosedürü 10_Kalite'de; yedekleme testi kaydı
70_IT-Guvenlik'te.

**Tedarikçi hangi kütüphanede?**
Kalifikasyon kaydı 10_Kalite/07_Tedarikci-Kalite. Teklif, sipariş, ticari
yazışma 31_Satinalma-Tedarik. Aynı tedarikçi için iki yerde dosya olması
normaldir.

**Şirket mali mi proje mali mi?**
Bir TÜBİTAK/KOSGEB projesine ait harcama, AGY, hakediş → 23_Proje-Mali.
Şirket geneli bilanço, vergi, banka → 40_Finans.

**Eğitim kaydı nerede?**
Kalite sistemi yetkinlik dosyaları (PRRC, QMR yetkinlik kanıtı) →
10_Kalite/06_Egitim-Yetkinlik. Genel personel eğitimleri → 50_IK/04.

**Pazarlama mı yönetim mi?**
Marka, kampanya, içerik → 60_Pazarlama. Performans takibi, KPI, maliyet
ve fiyatlama araçları → 80_Yonetim/03_Strateji-ve-Is-Plani.

## Gizlilik testi

Aşağıdakilerden biri varsa belge 80_Yonetim veya 81_Hukuk dışına çıkmaz:

- Başlıkta veya altbilgide "GİZLİ", "Yalnızca Üst Yönetim", "Confidential"
- Kasa pozisyonu, borç servisi, nakit akışı
- Kişi bazlı maaş veya ücret bilgisi
- Yatırımcı görüşme detayı, değerleme
- Savunma projesi teknik detayı (ASELSAN, SSB, TUSAŞ, MBJ silah sanayi)

Gerçek örnek: `S2_Addpark_Yonetici_Raporu` pazarlama dosyalarıyla birlikte
gelmişti; içinde kasa pozisyonu ve savunma pipeline'ı vardı, 80_Yonetim'e
ayrıldı.

## Sürüm testi

Hedefte aynı belgenin eski sürümü varsa:

1. Eski sürüm hedefin `99_Arsiv` klasörüne taşınır
2. Yeni sürüm ana klasöre konur
3. İki sürüm **asla** aynı klasörde durmaz

Sürüm karşılaştırması ad benzerliğiyle değil, belge kodu veya konu
eşleşmesiyle yapılır. `Rev01` ve `v3` aynı belgenin farklı serileri olabilir.

## Adlandırma standardı (DMS.STD.02)

Format: `{Bağlam}_{YYYYMMDD}_{Konu-Tireli}_{R00}.uzantı`

Kurallar:
- Türkçe karakter yok (ç→c, ğ→g, ı→i, ö→o, ş→s, ü→u)
- Boşluk yok, ayraç tire
- Nokta yalnız uzantıda
- Parantez, virgül, tırnak yok
- İndirme kopyası ekleri temizlenir: `(1)`, `(2)`, `(3)`
- SharePoint yasak karakterleri: `" * : < > ? / \ |`

**Dokunulmazlar:** TÜBİTAK PRODİS çıktıları (`3230550_2024_2_rev0_AGY300.pdf`),
KOSGEB ve AB kurum çıktıları. Denetimde bu adla aranır; değiştirmek
izlenebilirliği kırar.

Belge kodu olan belgeler kodla başlar: `MDR.FR.024_...`, `OEK_...`,
`ORG.SEM.01_...`

## Durum öneki — (F) / (D) / (A)

**Kontrollü belgeler önek ALMAZ.** Kodu, revizyonu ve GOV.05 sicil kaydı
olan belge durumunu sicilden alır; ada önek koymak üçüncü bir doğruluk
kaynağı yaratır ve "belge kodla başlar" kuralını bozar.
(DMS.STD.02 Rev02, karar 29.07.2026.)

Önek yalnız **sicili olmayan çalışma dosyaları** içindir — pazarlama
kolleksiyonu, brifing, ham teslim:

| Önek | Anlam |
|---|---|
| `(F)_` | Final, kullanıma hazır |
| `(D)_` | Taslak / üzerinde çalışılıyor |
| `(A)_` | Arşiv, geçerliliğini yitirmiş |

Parantezli biçim geçerlidir; `F_` / `D_` / `A_` biçimi **kullanılmaz**
(DMS.STD.03 bu yüzden yürürlükten kaldırıldı, DMS.STD.02 Rev01'e alındı).

Önek yalnız dosya adının **başında** bulunur, ortada veya sonda değil.
Yürürlükten kalkan kontrollü sürüm önek değil `_SUPERSEDED-by-{yeni}`
eki alır ve `99_Arsiv`'e gider.

## DMS.RPT — konum istisnası

`DMS.RPT.*` kodlu doküman sistemi raporları normalde `10_Kalite/00_Yonetisim`
ailesine girer. **Ancak yönetici raporu niteliğindeyse** hedef
`80_Yönetim/02_Yonetim-Raporlari/01_Guncel`'dir.

Ayırt etme: rapor yönetime sunuluyorsa, karar/öneri içeriyorsa ve dönemsel
bir özetse → yönetim raporudur. Prosedür/standart tanımlıyorsa → yönetişim.

## İLKE: kod ailesi konumu belirlemez

Hedef klasörü belgenin **kod ailesi** değil, **içerik hassasiyeti**
belirler. Kalite kodlu bir belge gizli müşteri verisi taşıyorsa kalite
kütüphanesine konmaz. Kod bir ipucu, kural değildir.

## Proje kodu çözümleme

Belge bir projeye aitse doğru proje klasörünü bulmak gerekir. Proje
kodu formatı: `AP{revYY}{MM}{DD}{NNNN}`

`revYY` = yılın son iki hanesi ters çevrilmiş (2023 → 32, 2021 → 12).
Tarih = destek başlangıç tarihi.

Belgede TÜBİTAK proje numarası varsa (`3230550` gibi) klasör adının
sonunda o numara yazar — aramada bununla bul.

## Belirsizlik davranışı

Şu durumlarda `02_Karar-Bekleyen`'e al:

- İki kütüphane de makul
- Hangi projeye ait olduğu anlaşılmıyor
- Aynı adla farklı içerikli belge zaten var
- Gizlilik sınıfı belirsiz
- Ham medya (NAS kurulmadı)

`02_Karar-Bekleyen` içine dosyayla aynı adda bir `.md` notu bırak:
neyin belirsiz olduğu ve hangi bilginin gerektiği tek cümleyle yazılı olsun.
