---
name: derin-tara
description: BTech Grup'un TÜM bilgi kaynaklarını tek seferde tarar — bütün posta kutuları, SharePoint kütüphaneleri, OneDrive, Notion, Google Drive, Zoom ve Fireflies toplantı kayıtları. Kullanıcı "derin tara", "her yeri tara", "tüm sistemleri tara", "komple ara", "nerede olursa olsun bul", "elimizde ne var" dediğinde MUTLAKA bu skill'i kullan. Yalnız posta yeterliyse `mail-tara`, yalnız ADDPARK SharePoint yeterliyse `addpark-research-no-internet` kullanılır — derin tarama pahalıdır, gerçekten geniş sorularda çalıştırılır. Sadece BTech Grup ortamı için geçerlidir.
version: 2.0
---

# Derin Tara — Tüm Kaynaklarda Arama

Amaç: "bu konuda elimizde ne var" sorusunu **her kaynağı** yoklayarak
cevaplamak. Bir kaynağı atlamak, cevabı yanlış yapmaz — eksik yapar,
ki bu daha tehlikelidir çünkü fark edilmez.

Bu skill pahalıdır. Dar bir soru için çalıştırılmaz.

| Soru | Doğru skill |
|---|---|
| "Şu firmayla ne yazışmışız" | `mail-tara` |
| "Bu belge hangi revizyonda" | `addpark-research-no-internet` |
| "X konusunda elimizde ne varsa çıkar" | **`derin-tara`** |

## Tarama sırası — kaynak önceliği

Sıra tesadüf değil; her adım sonrakinin arama terimlerini keskinleştirir.

**1 · Kontrollü belgeler** — `addpark-research-no-internet` kurallarıyla
BTech-ADD SharePoint. Önce siciller (`GOV.05` IDX + EK1–EK7), sonra klasörler.
Buradan çıkan kodlar, firma adları ve tarihler sonraki adımların arama
terimi olur.

**2 · Posta kutuları** — `mail-tara` kurallarıyla tüm erişilebilen
kutular. Kutu listesi ve erişim durumu:
`mail-tara/references/kutular.md`

**3 · Diğer SharePoint siteleri** — `/sites/Projects`,
`/sites/BTECHGROUP`, `/sites/TrabtechGmbH`, proje yönetimi siteleri.
Kapsam dışı ama bilgi var; **bulgular ayrı başlıkta ve kapsam dışı
etiketiyle** raporlanır.

**4 · OneDrive** — kişisel sürücüler. Kontrollü olmayan çalışma
kopyaları burada. Bulunan her şey `[KONTROLSÜZ KOPYA]` etiketiyle
raporlanır; kontrollü nüshayla çelişiyorsa bu bir bulgudur.

**5 · Notion** — Aksiyonlar veritabanı, toplantı notları, sayfalar.

**6 · Google Drive** — varsa.

**7 · Toplantı kayıtları** — Fireflies transkriptleri, Zoom kayıtları.
Sözlü kararların tek izi burada olabilir.


## Aramanın altın kuralı — "bulamadım" ile "yok" farkı

Bir kaynakta bulamamak, o şeyin var olmadığı anlamına gelmez. Rapora
asla "yok" yazılmaz; **"şu kaynaklarda şu terimlerle arandı, bulunamadı"**
yazılır.

Bir şeyin yokluğunu iddia etmeden önce üç adım zorunludur:

1. **Envanteri çıkar.** SharePoint'te site birden çok kütüphane içerir ve
   her kütüphanenin ayrı `driveId`'si vardır. Tek kütüphaneye bakıp sonuç
   çıkarma. `references/kaynaklar.md` dosyasındaki kütüphane tablosu
   okunur.
2. **Adıyla ara, konumla değil.** Dosya taşınmış olabilir; `itemId`
   korunur ama `driveId` değişir. Eski adresle gelen `NOT_FOUND`
   "silinmiş" demek değil, "bu kütüphanede değil" demektir.
3. **Komşudan git.** Aranan dosya çıkmıyorsa aynı klasörde durması
   beklenen başka bir dosyayı ara; bulunanın `webUrl`'i konumu verir.

Aynı ilke veri alanları için de geçerlidir: bir alanın boş olduğunu
iddia etmeden önce modelin tam alan listesi alınır. Varsayılan alan
seçimleri özel alanları göstermeyebilir.

## Kurallar

**Kaynak asla karıştırılmaz.** Her bulgu hangi sistemden geldiği
belirtilerek verilir. Kontrollü belge ile OneDrive'daki çalışma kopyası
aynı ağırlıkta sunulmaz.

**Etiket seti:**

| Etiket | Anlamı |
|---|---|
| `[KONTROLLÜ]` | BTech-ADD kütüphanesi, sicilde kayıtlı |
| `[KAYIT]` | Kalite kaydı, sicilde olmayabilir |
| `[POSTA]` | Yazışma — kutu, gönderen, tarih ile |
| `[KAPSAM DIŞI SITE]` | Başka SharePoint sitesi |
| `[KONTROLSÜZ KOPYA]` | OneDrive veya kişisel alan |
| `[NOTION]` · `[DRIVE]` · `[TOPLANTI]` | Kaynağıyla |
| `[BULUNAMADI]` | Arandı, yok — nerede arandığı yazılır |

**Çelişki bulunursa gizlenmez.** İki kaynak farklı şey söylüyorsa ikisi
yan yana konur ve hangisinin esas olduğu belirtilir. Belirlenemiyorsa
karar kullanıcıya bırakılır.

**Arama kaydı tutulur.** Rapor sonunda: hangi kaynakta hangi terimlerle
arandı, kaç sonuç döndü, neye erişilemedi. Bu blok olmadan rapor
tamamlanmış sayılmaz — okuyan, taramanın nerede kör olduğunu bilmelidir.

## Rapor iskeleti

```
## Özet
Üç cümle: ne arandı, ne bulundu, en önemli bulgu ne.

## Bulgular
Kaynak etiketiyle, en güvenilirden en zayıfa doğru.

## Çelişkiler
İki kaynak farklı şey söylüyorsa.

## Boşluklar
Aranan ama bulunamayan. Nerede arandığı yazılır.

## Tarama kaydı
Kaynak · terim · sonuç sayısı · erişilemeyenler
```

## Yasaklar

- Bir kaynağı atlayıp raporda belirtmemek
- OneDrive bulgusunu kontrollü belge gibi sunmak
- İnternete çıkmak — bu skill kapalı devredir; dış kaynak gerekiyorsa
  `addpark-research-with-internet` ayrıca çağrılır ve bulgular ayrı
  etiketlenir
- Genel bilgiyle boşluk doldurmak

---

## TİCARİ İLİŞKİ TARAMALARINDA — para izi yöntemi

Tedarikçi, müşteri, iş ortağı gibi **ticari ilişki** aranıyorsa
`mail-tara` skill'indeki **Para İzi Yöntemi** bölümü burada da geçerlidir
ve uygulanması zorunludur. Özet:

- **Kavramı değil davranışı ara.** "tedarikçi" kelimesiyle arama yapma;
  `proforma` · `dekont` · `SWIFT` · `irsaliye` · `CoA` · `sipariş` ·
  `mutabakat` gibi işlem terimleriyle ara. Çift dilli.
- **Yön testi.** Para gruptan çıktıysa tedarikçi, gruba girdiyse müşteri,
  ikisi de varsa her ikisi, hiçbiri yoksa aday.
- **Kanıt gücü.** Ödeme kanıtı > gelen fatura > onaylı sipariş > irsaliye >
  sadece teklif (yetersiz). Bir listede adının geçmesi kanıt değildir.
- **Grup şirketi ayrımı yapma.** 09.08.2026'da üç tedarikçi yalnız
  Trabtech yazışmalarındaydı; ADDPARK odaklı arama hepsini kaçırdı.

## KAYNAK GÜVENİLİRLİĞİ — 09.08.2026 dersleri

| Kaynak | Ders |
|---|---|
| **Odoo `res_partner` dökümü** | Tedarikçi listesi DEĞİLDİR. 1.062 kayıtta 166 gerçek kişi, grup içi şirketler, müşteriler, düzenleyici kurumlar ve "KREDİ KARTI HARCAMALARI" gibi gider kalemleri vardı. Kontrol edilen ürüne dokunan kayıtların **%70'inde para izi bulunamadı**. Kaynak olarak kullanılır, doğru kabul edilmez |
| **Aynı verinin birden çok dışa aktarımı** | Üç Odoo dosyası "aynı liste" sanılıyordu; gerçekte 1.062 tekil kayıt vardı, biri 25 kaydın tamamı diğerlerinde yoktu. **Birleştirmeden önce md5 ve kesişim kontrolü yap** |
| **OneNote defterleri** | 13 defter bulundu, hiçbiri aranan fuar/ziyaret notu değildi. Çoğu 2020-2022 dönemi |
| **Google Drive** | Formnext notları bulundu ama **2018 tarihli**. Dosya adının güncel olduğunu varsayma, değişiklik tarihini oku |
| **Fuar/ziyaret notları** | Formnext 2025'e gidildiği araç kiralama fişiyle doğrulandı ama **not tutulmamış**. "Bulunamadı" ile "yazılmamış" farklı sonuçlardır; hangisi olduğunu söyle |

## TARİH KONTROLÜ ZORUNLU

Bir belge bulunduğunda **son değişiklik tarihi mutlaka raporlanır.**
Sekiz yıllık bir dosyayı güncel bilgi gibi sunmak, bulamamaktan kötüdür.
