---
name: dokuman-denetle
description: Bir Addpark dokümanını yayın öncesi denetler - biçim, adlandırma, kalite sistemi tutarlılığı, mevzuat uyumu (MDR 2017/745, ISO 13485, KVKK, İş Kanunu, TTK) ve mevcut kontrollü belgelerle çelişki kontrolü yapar, önem derecesine göre düzeltme önerisi sunar, onay alınca düzeltilmiş sürümü üretir. Kullanıcı "bu dökümanı kontrol et", "uygun mu bak", "denetle", "gözden geçir", "yayına hazır mı", "mevzuata uygun mu", "bunu düzelt" gibi bir şey söylediğinde MUTLAKA bu skill'i kullan. Yeni hazırlanan veya revize edilen her kontrollü doküman için yayın öncesi çalıştırılmalıdır. Denetimden geçen doküman dokuman-yayinla skill'ine devredilir.
version: 5.0
---

# Doküman Denetleme

Amaç: bir belgeyi yayınlamadan önce, denetçinin bulacağı şeyi önce bizim
bulmamız.

En sık rastlanan hata belgenin *yanlış* olması değil, **başka bir belgeyle
çelişmesidir**. Tek başına doğru iki belge birlikte uygunsuzluk üretir.

## Akış

1. Belgeyi oku
2. Belge ailesini ve hangi standartlara tabi olduğunu belirle
3. Beş kontrolü sırayla uygula (aşağıda)
4. Bulguları önem derecesiyle sun
5. Onay al
6. Düzeltilmiş sürümü üret
7. `dokuman-yayinla` skill'ine devret

## Kontrol 0 — Belge türü triyajı (önce bunu yap)

**Her belge kontrollü belge adayı değildir.** Triyaj yapılmadan denetime
başlanırsa çalışma dosyasına kontrollü belge ölçütü uygulanır ve yanlış
bulgu üretilir.

| Tür | İşaretler | Nasıl denetlenir |
|---|---|---|
| **Kontrollü belge adayı** | İçeriği tamamlanmış, doğrulanmış, karar bekleyen alan yok | Kontrol 1-5 tam uygulanır |
| **Çalışma dosyası** | Doğrulanmamış kayıtlar, `[atanacak]` / `[karar]` / `[belirsiz]` yer tutucular, "birleştirme kararı bekliyor" gibi iç notlar **içeriğin kendisi** | Kontrol 1-3 ve 5 uygulanır; **Kontrol 4'ün "iç not kalmamış" maddesi UYGULANMAZ** |

Çalışma dosyasında iç notlar bulgu değildir — belgenin işlevidir. Onları
silmek dosyayı işlevsiz bırakır. Bunun yerine kullanıcıya üç seçenek sun:

1. **Böl** — doğrulanmış kısım kontrollü belge, gerisi ayrı çalışma dosyası
2. **Çalışma sürümü olarak yayınla** — kapakta açık ibare, sicile öyle kaydedilir
3. **Yayınlama** — kararlar verilene kadar bekle, sicildeki eski satır düzeltilir

**Seçenek 1 varsayılan öneridir.** Kontrollü belgede doğrulanmamış veri
bulunmaması denetim açısından en temiz sonuçtur.

### Elektronik tablo (xlsx) belgelerinde antet

Kontrol 4 Word belgesine göre yazılmıştır. xlsx'te karşılıklar:

| Word | xlsx karşılığı |
|---|---|
| Kapak sayfası | İlk sayfa (`01_Ozet` vb.) — kod, revizyon, tarih, gizlilik sınıfı burada |
| Üst bilgi / alt bilgi | Sayfa yapısı → üstbilgi/altbilgi, **her sekmede ayrı ayrı** |
| Sayfa n / N | `&P / &N` alan kodu |
| Logo | Üstbilgiye resim olarak eklenir (`&G`) |
| Revizyon tarihçesi | Ayrı sekme (`02_Revizyon-Gecmisi`) |
| Mülkiyet ibaresi | Altbilgi, TR/EN |

Her sekmenin üstbilgisi ayrı kontrol edilir — bir sekmede doğru olması
diğerlerinde de doğru olduğu anlamına gelmez.

### Gizlilik sınıfı ile konum çelişkisi

`Ö` (Hizmete Özel) sınıfı **yalnız `80_Yönetim`, `81_Hukuk`, `50_IK`**
içinde durabilir. Hedef klasör bunlardan biri değilse `Ö` bir bulgudur
(Major) — sınıf `K`'ye düşürülür veya konum değişir.

### ADDPARK dışı belge

Belge birden çok grup şirketini kapsıyorsa (BTech Grup ortak belgesi),
antet ve sicil sorusu bu skill'in kapsamı dışındadır ve **tahmin edilmez**
— bulgu olarak yazılır, `dokuman-yayinla` Faz A'da kullanıcıya sorulur.

## Kontrol 1 — Atıf ilkesi (en kritik)

**Bir belge rol, yetki, vekalet veya imza tanımını TEKRARLAMAZ.**
Organizasyonel roller için OEK Organizasyon El Kitabı'na, imza ve onay
yetkisi için **GOV.08 İmza Gereklilik ve Yetki Matrisi**'ne atıf yapar.

Yanlış: `PRRC: Genel Müdür`
Doğru: `PRRC ataması OEK Rev08 §4'te tanımlandığı şekildedir`

Gerekçe: CAPA.2026-02'nin kök nedeni budur. OEK Rev07 "PRRC = QMR" derken
MDR.FR.024 Rev00 "PRRC = Genel Müdür" demişti; ikisi de aynı ay
yayınlanmış, ikisi de teknik dosyanın parçasıydı.

Belgede şu ifadeler geçiyorsa dur ve işaretle: bir rolün kim olduğu,
kimin neyi onaylayacağı, vekalet düzeni, imza yetkisi.

## Kontrol 2 — Çelişki taraması

Belgede geçen her tanım, sayı ve tarih için mevcut kontrollü belgelerde
karşılığını ara. `references/uyum-kontrol-listesi.md` içinde nereye
bakılacağı yazılı.

Özellikle kontrol et:
- Belge kodları ve revizyon numaraları (aynı kod farklı içerikle dolaşıyor mu)
- Rol adları ve kişiler
- Tarihler (sözleşme, destek başlangıç, yürürlük)
- Referans verilen belgelerin gerçekten var olduğu ve o revizyonda olduğu

**Var olmayan bir belgeye veya bölüme atıf, çelişkiden daha kötüdür.**

## Kontrol 3 — Mevzuat uyumu

Belge ailesine göre uygulanacak mevzuat `references/uyum-kontrol-listesi.md`
dosyasındadır. Özet:

| Belge tipi | Bakılacak |
|---|---|
| MDR / teknik dosya | MDR 2017/745, ISO 13485:2016, MDCG rehberleri |
| Kalite prosedürü | ISO 13485, ISO 9001, AS9100 |
| İK belgesi | 4857 İş Kanunu, KVKK, 6331 İSG |
| Sözleşme | TBK, TTK, KVKK |
| Kurumsal karar | TTK (temsil, imza, işlem yasağı) |
| Kişisel veri içeren her belge | KVKK 6698, özel nitelikli veri için Md.6 |

Hukuki yorum gerektiren noktalarda **karar verme** — "hukuki görüş
alınmalıdır" diye işaretle. Örnek: TTK 395 şirketle işlem yasağı.

## Kontrol 4 — Biçim, antet ve yapı

Antet öğeleri (MK.01 Rev02 · `dokuman-yayinla/references/logo-kullanimi.md`):

- [ ] Logo **dosya olarak gömülü**, turkuaz, oran doğru — metinle veya
      `[ADDPARK logo]` yer tutucusuyla yazılmamış
- [ ] Slogan `Redefining the Possible` — eski slogan değil
- [ ] Kapakta doküman kodu · revizyon · tarih · **gizlilik sınıfı** (GOV.04 seti)
- [ ] Üst bilgi: `Dok. No / Doc: {KOD} · BTech Grup · ADDPARK · Rev: {Rev} ·
      Sayfa / Page n / N`
- [ ] Alt bilgi: `{KOD} · Güncel sürüm Master Sicil'de doğrulanır / Verify
      current version in Master Register`
- [ ] Son sayfada mülkiyet ibaresi (TR/EN)
- [ ] Marka yazımı `ADDPARK` (`AddPark` yasak)

Yapı:

- [ ] **Revizyon tarihçesi tablosu** var ve açıklama *neyin* değiştiğini
      yazıyor — "güncellendi" yetersizdir
- [ ] Çift dilli belgelerde TR ve EN sütunları örtüşüyor (pdftotext -layout
      ile doğrula)
- [ ] Sayfa yoğunluğu: boş sayfa veya tek satırlık öksüz sayfa yok
- [ ] Belgede **bize ait iç not / denetim uyarısı kalmamış** — bunlar
      kullanıcıya raporlanır, kontrollü belgede durmaz
- [ ] `[TBD]` / doldurulmamış yer tutucu yok (şablonlarda kasıtlı boşluklar
      hariç; ADDPARK'ın kendi sabit alanları önceden doldurulmuş olmalı)

### Onay — aile bazlı, tek kalıp yok

Onay yapısı `dokuman-yayinla/references/belge-tipi-onay.md`'ye göre denetlenir.
Tek bir "Hazırlayan → Gözden geçiren → Onaylayan" kalıbı **yoktur**:

| Aile | Beklenen |
|---|---|
| **A** — DÖF (PR13.FR02), DKK, eski CAPA | Belgede imza bloğu VAR. **Plan Onayı ≠ Kapanış Onayı** (D5 / D8). Blokta "İnceleyen ve Onaylayan" rolü zorunlu |
| **B** — kontrollü belgeler (PR, MDR.FR, KEK, OEK, GOV, LGL, MK, DMS, QMS) | Ayrı iç imza sayfası YOK. Sonunda **PR01 onay notu** (TR/EN) bulunur; onay GOV.05 sicilinden gelir |
| **B — iki taraflı belge** (LGL sözleşme, MDR.FR.024, GOV.03) | Tarafların imza bloğu belgede KALIR + PR01 onay notu ikisinin farkını söyler |
| **C** — vaka belgeleri (MDR.FR.008-*) | Bu skill'in kapsamı dışı — `mdr-case-create` |

Her iki ailede: **imza alanlarında isim önceden basılmamış**, yalnız rol
yazılı. Aynı gerçek kişi hem hazırlayıp hem onaylayamaz; vekalet bu kuralı
geçersiz kılmaz.

## Kontrol 5 — Adlandırma

DMS.STD.02 **Rev02**'ye uygunluk. Detay: `references/adlandirma-standardi.md`

**KARAR (08.08.2026, kullanıcı): `_FINAL` YOKTUR.** Kontrollü belge hiçbir
durum eki almaz; durum GOV.05 sicilinden okunur. Denetimde:

- Yeni veya revize belgede `_FINAL` **varsa bulgudur (Minor)** — kaldırılır.
- Mevcut `..._FINAL.pdf` adlı belgeler LEGACY'dir; tek başına bulgu
  yazılmaz, revizyon aldıklarında ek düşürülür.
- GOV.05'te `_FINAL` eksikliğini bulgu sayan notlar (örn. MDR.FR.040)
  **geçersizdir**; sicil temizliği açık iş olarak raporlanır.

`_ADDPARK_` gövde eki ayrı bir konudur ve yasak değildir: ailenin
yayınlanmış emsaline uyulur (Desen 1 / Desen 2 — bkz.
`references/adlandirma-standardi.md`).

## Bulgu sunumu

Bulguları şu tabloyla sun:

| # | Bölüm | Bulgu | Önem | Öneri |
|---|---|---|---|---|

Önem dereceleri:
- **Kritik** — yayınlanırsa mevzuata aykırılık veya hasta/ürün güvenliği riski
- **Major** — denetimde uygunsuzluk bulgusu üretir
- **Minor** — biçim, tutarlılık, okunabilirlik
- **Öneri** — zorunlu değil

Kritik ve major bulgular düzeltilmeden yayın önerilmez. Bunu açıkça söyle.

## Düzeltme

Onay alındıktan sonra düzeltilmiş sürümü üret. 66 sayfalık bir sözleşme
gibi büyük belgelerde **tam metni yeniden yazma** — bunun yerine
değişiklik talimatı üret: bölüm, mevcut metin, yeni metin, gerekçe.

Küçük belgelerde doğrudan düzeltilmiş sürümü ver.

## Devir

Düzeltme tamamlanınca `dokuman-yayinla` skill'ine geç: kod atama, antet,
sicil kaydı ve arşivleme orada yapılır.
