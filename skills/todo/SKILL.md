---
name: todo
description: Kuntay'ın tek görev sistemidir — Notion'daki "Aksiyonlar" veritabanına tarihli ve aksiyon planlı görev yazar, vadesi geleni hatırlatır, "Claude Yapabilir" işaretli işleri fiilen yapar ve tamamlananları listeden düşürür. Kullanıcı "todo", "yapılacaklar", "listeye ekle", "bunu unutmayayım", "hatırlat", "ne var bugün", "açık işlerim ne", "neyim gecikti", "hallettim", "bunu bitirdim", "tamamlandı", "bu iş kapandı" gibi bir şey söylediğinde MUTLAKA bu skill'i kullan. Ayrıca bir sohbette taahhüt veya termin ortaya çıktığında ("pazartesiye kadar X yapılacak", "Y'yi arayacağım") kullanıcıya görev olarak eklemeyi öner. Görevler ASLA hafızaya, sohbete veya Microsoft To Do'ya yazılmaz — tek yer Notion Aksiyonlar veritabanıdır.
version: 1.0
---

# Todo — Tek Görev Sistemi

Amaç: **görev bilgisinin tek bir yerde durması.** Notion'daki `Aksiyonlar`
veritabanı tek kayıt yeridir. Hafıza dosyaları, sohbet geçmişi ve Microsoft
To Do görev tutmaz.

Bu sistem Microsoft To Do'nun yerini alır. Kullanıcı bir görevden söz
ettiğinde To Do'ya yazmasını önerme — buraya yaz.

Veritabanı koordinatları, alan adları ve yazım biçimleri:
`references/veritabani.md`

## Temel çalışma ilkesi — ÖNCE YAZ, SONRA SOR

Kullanıcı bir iş söylediğinde **soru sorma, yaz.** Eksik alanları
aşağıdaki tabloya göre türet, kaydı oluştur, `Doğrulanmadı` kutusunu
işaretle, sonra tek bir doğrulama tablosu göster.

Gerekçe: soru sorup beklemek görevin sohbette kaybolmasına yol açar.
Yakalama kaybı, yanlış tahminden daha pahalıdır. `Doğrulanmadı` işareti
tahminleri gerçek veriden ayırır — bu işaret olmadan yaz-önce protokolü
veritabanını bozar.

**Tek istisna:** anlam belirsizse (ne yapılacağı anlaşılmıyorsa) yazma,
sor. Eksik metadata belirsizlik değildir — o türetilir.

## Üç mod

| Cümle | Mod |
|---|---|
| "todo: X yapılacak", "şunu ekle", "unutmayayım" | **Yakalama** |
| "todo", "ne var", "bugün ne yapmalıyım", "neyim gecikti" | **Gözden geçirme** |
| "hallettim", "bitti", "X'i tamamladım" | **Kapatma** |

---

## Yakalama

### 1. Yaz

Her görev tüm alanları dolu girilir. Boş alan bırakma — türet ve işaretle.

| Alan | Kullanıcı verdiyse | Vermediyse — türetme kuralı |
|---|---|---|
| **Aksiyon** | fiil ile başlat, tek iş | — |
| **Termin** | o tarih | aşağıdaki termin tablosu |
| **Sonraki Aksiyon** | — | bağlamdan somut ilk hamleyi üret |
| **Alan** | — | bağlamdan; çıkmıyorsa `Grup` |
| **Öncelik** | — | `Orta` |
| **Sorumlu** | — | `Kuntay` |
| **Kaynak** | — | `Sohbet` |
| **Claude Yapabilir** | — | test tablosu; karar veremezsen `__NO__` |
| **Durum** | — | `Açık` |
| **Doğrulanmadı** | tüm alanlar kullanıcıdan geldiyse `__NO__` | **en az bir alan türetildiyse `__YES__`** |

#### Termin türetme tablosu

| Sinyal | Termin | Doğrulanmadı |
|---|---|---|
| Açık tarih verildi | o tarih | `__NO__` |
| "acil", "bugün", "hemen" | bugün | `__NO__` |
| "bu hafta" | bu cuma | `__NO__` |
| "gelecek hafta" | gelecek cuma | `__NO__` |
| "ay sonu" | ayın son iş günü | `__NO__` |
| Bağlamda dış termin var (denetim, başvuru, sözleşme) | o tarihten 5 iş günü önce | `__YES__` |
| Hiçbir sinyal yok | **bugün + 7 gün** | `__YES__` |

Bugünün tarihini tahmin etme — sistemden al.

#### "Sonraki Aksiyon" testi

Yazdığın şeyi okuyup hemen başlayabiliyor musun? "MDR dosyasını hallet"
hayır. "MDR.FR.005 dosya adını Rev01'e düzelt" evet.

Somut bir ilk hamle üretemiyorsan görev fazla büyüktür. Yine de yaz,
ama doğrulama tablosunda **"bölünmeli"** diye işaretle.

#### Claude Yapabilir testi

| ✅ İşaretle | ❌ İşaretleme |
|---|---|
| Belge/taslak/rapor üretimi | Telefon görüşmesi, toplantı |
| Araştırma (addpark-research) | İmza, onay, ödeme |
| Analiz, karşılaştırma, hesap | Fiziksel iş, saha, üretim |
| Sicil/kayıt güncelleme | Kuntay'ın kişisel kararı |
| E-posta/mesaj taslağı | Üçüncü tarafın cevabı beklenen iş |

Karar veremiyorsan işaretleme. Yanlış ✅, vadesi gelince yapılamayan bir
iş yaratır ve güveni bozar.

### 2. Yazdıktan sonra denetle

Kayıt oluştuktan sonra açık işler listesini sorgula ve şunları ara:

| Kontrol | Aksiyon |
|---|---|
| **Kopya** — aynı işi tarif eden mevcut kayıt | yeni kaydı silme; kullanıcıya "bu 39e4… ile aynı iş olabilir, birleştireyim mi" diye sor |
| **Yığılma** — aynı güne 4'ten fazla görev düştü | uyar, dağıtım öner |
| **Bağımlılık** — yeni görev, daha geç terminli bir görevin çıktısını gerektiriyor | çelişkiyi göster |
| **Çelişki** — mevcut bir kayıtla ters karar | ikisini yan yana koy |

Sorun yoksa bu bölümü hiç yazma. Boş denetim raporu üretme.

### 3. Doğrulama tablosunu göster

```
| # | Aksiyon | Termin | Alan | Öncelik | Türettiğim alanlar |
```

Altına tek satır: hangi alanları tahmin ettiğini ve düzeltmenin nasıl
yapılacağını söyle. Onay bekleme — kullanıcı ses çıkarmazsa kayıt olduğu
gibi kalır.

### 4. Düzeltme geldiğinde

Kullanıcı bir alanı düzeltirse: alanı güncelle **ve tüm alanlar artık
doğrulanmışsa `Doğrulanmadı` kutusunu kaldır.** Kısmi düzeltmede işaret
kalır.

Kullanıcı "hepsi doğru" derse ilgili kayıtların hepsinde işareti kaldır.

### Toplu giriş

Kullanıcı birden fazla iş sayarsa hepsini tek seferde yaz, sonra tek
doğrulama tablosu göster. Madde madde soru sorma.

---

## Gözden geçirme

Bugünün tarihini al, açık kayıtları sorgula ve şu sırayla sun:

1. **Gecikmiş** (Termin < bugün) — en üstte, sayısıyla
2. **Bugün**
3. **Bu hafta**
4. **Bekleyen** (Bekleyen Kim dolu) — ayrı blok, "sende değil"
5. **Claude Yapabilir** olanlar — "bunları şimdi yapabilirim" teklifiyle
6. **Doğrulanmadı** işaretli kayıt sayısı — tek satır, "N kaydın termini
   benim tahminim, gözden geçirmek ister misin"

Sütunlar: Aksiyon · Termin · Sonraki Aksiyon · Alan. Öncelik yalnız
Kritik/Yüksek ise gösterilir.

Sonraki ay ve ötesini varsayılan olarak gösterme.

### Bozuk kayıt hijyeni

Gözden geçirmede **terminsiz** veya **Alan'ı boş** kayıtla karşılaşırsan
(eski toplu içe aktarımlardan kalma olabilir):

- Bunları ayrı bir "eksik kayıt" bloğunda göster, normal kovalara sokma
- Kullanıcı onaylamadan toplu düzeltme yapma — bunlar mevcut veridir,
  yeni yakalama değildir
- Bir kayıt `;` ile ayrılmış birden fazla iş içeriyorsa bölünmesini öner

---

## Kapatma

Kapatma = `Durum: Tamamlandı` + `Tamamlanma: bugün`. **Silme yok.**
Kayıt arşiv görünümünde kalır, açık listeden düşer.

Eşleştirme kuralı:

- **Tek aday** → kapat, hangisini kapattığını tek satırda söyle
- **Birden fazla aday** → kapatmadan önce sor
- **Aday yok** → "böyle bir kayıt bulamadım" de, uydurma kayıt kapatma

Kullanıcı açıkça "sil" derse: silmenin geri alınamayacağını ve denetim
izinin kaybolacağını bir cümleyle söyle, onay al, sonra sil.

Bir görev kısmen bittiyse kapatma — `Durum: Devam` yap ve
`Sonraki Aksiyon` alanını güncelle.

Kapatma tek istisnadır: burada yaz-önce protokolü geçerli değildir.
Yanlış kapatılan görev görünmez olur, yanlış açılan görev görünür kalır.

---

## Vadesi gelen işi yapma

Görev vadesi geldiğinde ve `Claude Yapabilir` işaretliyse:

1. `Sonraki Aksiyon` alanını oku — yapılacak şey odur
2. İşi yap (gerekiyorsa ilgili skill'i çağır: `addpark-research-no-internet`,
   `dokuman-denetle`, `dokuman-yayinla`)
3. Sonucu kullanıcıya sun
4. **Kendiliğinden kapatma** — kullanıcı onaylayınca kapat. Yapılan işi
   `Not` alanına yaz

Yapamadıysan nedenini `Not`'a yaz ve `Claude Yapabilir` işaretini kaldır.

## Günlük süpürme

Tekrarlayan görev olarak kurulduğunda her sabah: gecikmişleri ve bugün
vadesi gelenleri çıkar, `Claude Yapabilir` olanları yapmayı teklif et.
Yapılacak iş yoksa kısa geç — boş rapor üretme.

## Yasaklar

- Görev yazmadan önce metadata sorusu sormak (belirsizlik hariç)
- Türetilmiş alanı `Doğrulanmadı` işareti koymadan yazmak
- Görevi hafıza dosyasına yazmak (`/areas/...` içindeki "Açık işler"
  listeleri bağlamdır, görev sistemi değildir)
- Microsoft To Do'yu önermek
- Terminsiz görev oluşturmak
- "Sonraki Aksiyon" alanını görev başlığının kopyasıyla doldurmak
- Kullanıcı onaylamadan görev kapatmak veya silmek
