# Bulgu Formatı

## Kod
`ON.{YYYY}-{NNN}` — "ÖN çalışma". Örnek: `ON.2026-001`

Bu kod **DÖF kodu değildir** ve öyle davranılmaz. Kalite ekibi kabul
edince PR13.FR02 formu açılır ve gerçek numara (`PR13.FR02.NNN`)
`DÖF No` kolonuna yazılır. Numara bulgu sicilindeki son satırdan devam eder — yeniden
kullanılmaz, boşluk bırakılmaz.

## Zorunlu alanlar (23 kolon)

Kolon sırası `ADDPARK_Uygunsuzluk-Bulgu-Sicili.csv` ile birebir aynıdır; şema
R02 xlsx'in `03_Sicil-Semasi` sayfasında da yazılıdır. CSV ayraç `;`, UTF-8 BOM'lu.

| # | Kolon | Kural | 8D karşılığı |
|---|---|---|---|
| 1 | Bulgu No | `ON.YYYY-NNN` | — |
| 2 | Tarih | ISO `YYYY-MM-DD` | — |
| 3 | **Sicil Hatti** | Endüstriyel / Medikal. PR13.FR03'ün hangi sayfasına gideceğini belirler. **Boş bırakılamaz** | — |
| 4 | Belge Kodu | Sicildeki kod; yoksa dosya adından, Not'a "sicilde kayıtlı değil" | — |
| 5 | Belge Adı | Belgenin kendi başlığı | — |
| 6 | Rev | **Belge içinden** okunan revizyon; dosya adıyla farklıysa ikisi de | — |
| 7 | Bölüm | `§3`, `§7.2`; tamamıysa `—` | — |
| 8 | Şart Kodu | `SM-0NN` — matristen | — |
| 9 | Şart Kaynağı | Otomatik (formül) | — |
| 10 | Tespit (TR) | Tek cümle | D1 |
| 11 | Finding (EN) | Aynı cümlenin İngilizcesi | D1 |
| 12 | **Kanit** | Alıntı veya bölüm atfı. **BOŞ BIRAKILAMAZ** | D1 |
| 13 | Arandığı Yerler | U3'te taranan klasör/kütüphane listesi. **BOŞ BIRAKILAMAZ** | — |
| 14 | Sistemde Karşılanıyor mu | Evet / Hayır / Kısmen | — |
| 15 | Sınıf | Kritik / Major / Minor / Gözlem | — |
| 16 | Ürün-Vaka Etkisi | Var / Yok / Belirsiz. `Var` ise MDR ön değerlendirme bloğu zorunlu | D3 girdisi |
| 17 | **Kaynak (PR13.FR02)** | Formun 14 kaynak kutusundan biri. Atölye bulgusunda varsayılan: **İç denetim uygunsuzluğu**. **Boş bırakılamaz** | Üst blok |
| 18 | **DOF Turu** | Düzeltici / Önleyici. **Boş bırakılamaz** | D5 / D7 |
| 19 | Önerilen Aksiyon | DÖF (PR13.FR02) / DKK / Düzeltme / İzleme / Aksiyon yok | D5 |
| 20 | Mükerrer | Triyaj bulgu no veya `—` | — |
| 21 | Durum | Yeni satır daima `TASLAK` | D8 |
| 22 | Kalite Ekibi Notu | Skill tarafından **doldurulmaz** | — |
| 23 | DÖF No | `PR13.FR02.NNN`. Yalnız Mod B'de, devir sonrası | D8 |

**Kolon 3, 17 ve 18 boşsa satır PR13.FR02'ye devredilemez.** Bilgi
yoksa tahmin edilmez, kullanıcıya sorulur.

## Kişisel veri

Hasta adı, hekim adı, müşteri kişi adı hiçbir kolona yazılmaz. Vaka
atfı yalnız vaka kodu (AP...) iledir. Kanıt alıntısı kişisel veri
içeriyorsa alıntı yerine bölüm atfı kullanılır.

## Tespit cümlesi kalıbı

> `{Şart}` kapsamında `{beklenen unsur}`, `{belge}` `{bölüm}` içinde ve
> taranan kontrollü belgelerde tanımlı görünmüyor.

Örnek:
> ISO 13485 §8.3 kapsamında elden çıkarılan ısmarlama cihazın kayıt
> altına alınma yöntemi, PR14 Rev07 §3'te ve taranan kontrollü
> belgelerde tanımlı görünmüyor.

Yasak ifadeler: "yapılmamış", "hiç düşünülmemiş", "eksik bırakılmış",
"muhtemelen", "görünüşe göre", "sanırım".

## Kanıt kuralı

Kanıt üç biçimden biri olabilir:
1. Belgeden birebir kısa alıntı (tırnak içinde, kısa tutulur)
2. Bölüm atfı: `PR14 Rev07 §3, üçüncü paragraf — imha kaydına atıf yok`
3. Yokluk kanıtı: `02_Prosedurler klasör listesi — PR13-F01 dosyası bulunmuyor`

Yokluk kanıtı yalnız U3'ün üç adımı da tamamlandıysa geçerlidir.

## Bir belge için birden fazla bulgu

Her şart ayrı satırdır. Aynı belgede beş şart karşılanmıyorsa beş satır
açılır — tek satırda birleştirilmez. Aksi halde kabul/red kararı
satır bazında verilemez.

## Bulgu açılmayan durumlar

- Şart sistemin başka bir belgesinde karşılanıyorsa (satır açılmaz;
  isteğe bağlı olarak "atıf zinciri kopuk" ayrı bir Minor bulgu olabilir)
- Şart `ÜRÜN BAZLI` ve uygulanabilirlik henüz kullanıcıya sorulmamışsa
- Matriste `Doğrulama = DOĞRULANDI` değilse
- Bulgu triyaj sicilinde zaten varsa → `Mukerrer` kolonuna triyaj no yazılır ve satır
  açılmaz, yeni ON kodu verilmez
