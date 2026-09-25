# Arama Stratejisi

## ONCE OKU: arama korlugu

Bu sitede arama bazi kutuphaneleri hic dondurmuyor (dogrulanmis:
`20_Proje-Basvurulari` tamami, `10_Kalite/00_Yonetisim` tamami).
Katman siralamasi bu yuzden degisti: **listeleme, aramanin alternatifi
degil on kosuludur.** Ayrinti: `kapsam-ve-kaynaklar.md` bolum 0.

## Dört katman — sırayla, atlamadan

### Katman 0 — Sicil (her zaman ilk)

`10_Kalite/00_Yonetisim/01_Sicil-ve-Kayitlar/` altındaki **EK1–EK7 CSV
dosyaları ve `GOV.05_IDX_Sicil-Haritasi.md`**

- Tek dosyalı eski sicil (`GOV.05_EK1_Master_Dokuman_Sicili.csv`)
  17.09.2026'da SUPERSEDED olarak `99_Arsiv-Catal-ve-Yedek`'e alındı —
  **aranmaz, okunmaz.**
- Hangi ailenin hangi EK dosyasında olduğu **IDX'ten okunur**; satır
  yazmadan önce IDX her zaman okunur.
- EK1 GOV·DMS·PRJ·YON·REFERANS · EK2 QMS·PR·IS·ISG·DENETİM·PRS·AR ·
  EK3 MDR-TF·ETİKET · EK4 KVK·LGL · EK5 HR·EK · EK6 MK·ODO·URT·YAT·SAT ·
  EK7 BLG (belgelendirme/sertifikalar)

- ~250 kayıt, ayraç `;`, BOM'lu UTF-8, 12 kolon:
  `Kod · Başlık · Aile · Sahip · Revizyon · Durum · Kütüphane · Klasör · Gizlilik · İmza Katmanı · Sonraki G.G. · Not`
- Not kolonu kısa kod taşır: `[GG:12ay]` `[Rev07-dz]` `[yeni]`
  `[konum?]` `[klasor?]` `[DokNo-farkli: X]` `[BELGE YOK]`
- `[konum?]` / `[klasor?]` etiketli satırların konumu **doğrulanmamıştır** —
  bu satırları kaynak göstermeden önce dosyayı fiilen bul.

Sicil ne için kullanılır: belgenin **var olup olmadığını, kodunu, ailesini
ve nerede aranacağını** öğrenmek.
Sicil ne için kullanılmaz: içerik iddiası, revizyon kesinliği.

### Katman 1 — İçerik araması

`sharepoint_search` ile anahtar terim ara. Türkçe sorgularda hem Türkçe
hem İngilizce ve hem belge kodu varyantlarını dene:
`FAI` / `ilk ürün muayenesi` / `PR33` / `AS9102`

Her sonuçta `webUrl` kontrolü zorunlu (bkz. kapsam kuralı).

### Katman 2 — Klasör listeleme (ATLANAMAZ)

Arama sonuc dondurse BILE hedef kutuphane listelenir. Arama bos dondugunde
listeleme zorunludur; arama sonuc dondugunde de sonucun tam olup olmadigi
listelemeyle dogrulanir. Boş kütüphaneler ve yeni yüklenmiş dosyalar aramada gecikmeli
görünebilir; listeleme kesindir.

**"Belge yok" sonucuna yalniz listelemeyle varilir, aramayla degil.**
**Kutuphane kokundeki `_KLASOR-REHBERI.md` once okunur** — kapsam, klasor
listesi, sorumlu sicil ve bilinen bulgular oradadir.

### Katman 3 — Belge içi okuma

`read_resource` ile dosyayı aç ve iddiayı **belgenin içinden** teyit et.

| Format | Durum |
|---|---|
| .csv | Güvenilir, Türkçe karakterler dahil |
| .docx | Güvenilir |
| .md / .txt | Güvenilir |
| .pdf | Genelde okunur; taranmış PDF'te metin çıkmayabilir |
| **.xlsx** | **Çıktı bozuk/karışık gelir — veri okunmaz** |

xlsx'te: "bu dosya araçla güvenilir okunamıyor, içeriğine dayalı iddia
üretemem; dosyayı yüklerseniz okurum" de. Bozuk çıktıyı yorumlama.

## Revizyon doğrulama zinciri

ADDPARK kuralı: **belge içi bilgi esastır.** Öncelik sırası:

1. Belge içindeki başlık/altbilgi revizyonu (`Rev: 07`) — **esas**
2. Dosya adındaki revizyon (`_Rev07_FINAL`) — ikincil kanıt
3. Sicildeki revizyon — indeks, en zayıf

Üçü uyuşmuyorsa üçünü de göster ve 1'i esas al. Bilinen açık çelişki
örneği: dosya adı `Rev02_FINAL`, belge içi `Rev: 01` → belge içi geçerli,
dosya adı hatalı.

## Yürürlük testi

Bir belgenin yürürlükte olduğunu söylemeden önce:

- Adında `_SUPERSEDED`, `(A)_`, `TASLAK`, `DRAFT` var mı
- `99_Arsiv`, `11_Arsiv_Gecmis`, `99_Arsiv-Obsolete` klasöründe mi
- Sicilde `Durum` kolonu ne diyor (YAYIN / TASLAK / ARŞİV)
- Aynı kodun daha yüksek revizyonu başka klasörde duruyor mu

Bu dördü tutarsızsa "yürürlük belirsiz" de ve tutarsızlığı göster.

## Hayalet kayıt kontrolü

Sicilde "YAYIN" görünüp fiilen var olmayan belge örneği yaşandı
(PR29, PR30, PR32). Bu yüzden bir belgenin varlığını **yalnız sicile
dayanarak** bildirme. Sicil satırı varsa ama dosya bulunamıyorsa çıktıda
şöyle yaz:

> `[BULUNAMADI]` PR29 — sicilde kayıtlı (Durum: TASLAK) ancak
> 10_Kalite/02_Prosedurler listelemesinde dosya yok. Sicil kaydı ile
> fiili durum uyuşmuyor.

## Kaç arama yeterli

| Soru | Beklenen çaba |
|---|---|
| Tek belge var mı / revizyonu ne | Sicil + 1 arama + 1 listeleme |
| Bir prosedür ne diyor | Sicil + dosya bul + belge içi oku |
| Bir konuda elde ne var | 3-6 arama (terim varyantları) + ilgili klasör listelemeleri |
| İki belge çelişiyor mu | Her iki belgeyi de içinden oku, ilgili bölümleri karşılaştır |
| Bir standardın tüm karşılıkları | Aile bazlı tam listeleme + sicil çapraz kontrol |

Yetersiz aramayla "bulunamadı" demek, uydurmakla aynı ağırlıkta hatadır.
Aramayı bıraktığın noktayı çıktıda yaz.

## Katman 4 — Tam tarama (zorunlu eskalasyon)

Sicil boş + 3 terim varyantı boş + beklenen kütüphane listelemesi boş
ise **tam taramaya geçilir**. Tüm kütüphaneler klasör klasör taranır.

Bu adım opsiyonel değildir: "sicilde yok" ile "sistemde yok" farklı
şeylerdir ve sicilde kayıtlı olmayan çok sayıda belge mevcuttur.

Protokol, öncelik sırası, iki aşamalı yürütme (ad taraması → aday açma)
ve kapsam raporlaması: `tam-tarama.md`

## Çok belgeli sorular

3'ten fazla belge okunacaksa önce kullanıcıya **plan** sun:
hangi belgeleri okuyacağını listele, onay al, sonra oku. Bu, yanlış
kümede derinleşmeyi önler.
