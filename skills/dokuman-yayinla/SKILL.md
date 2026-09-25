---
name: dokuman-yayinla
description: Denetimden geçmiş bir belgeyi kontrollü yayına alır — doküman kodu ve revizyon verir, künyesini yazar, gelen kutusuna bırakır (Faz A), yerleştirme sonrası sicile tescil eder ve dağıtım kaydına işler (Faz B). Kullanıcı "yayınla", "yayına al", "kod ver", "revizyon ver", "sicile işle", "tescil et", "dağıtıma çık" dediğinde MUTLAKA bu skill'i kullan. Beş BTech Grup şirketi için geçerlidir (Addpark, Trabtech, BTech, Earfit, Vimics); şirket belirlenmeden hiçbir adım atılmaz. Belge İÇERİĞİNİ denetlemez — o `dokuman-denetle`; dosyayı klasöre YERLEŞTİRMEZ — o `gelen-kutusu-isle`.
version: 1.0
---

# Doküman Yayınla — kontrollü yayın ve sicil tescili

Bu skill bir belgeyi "hazır" durumundan "kontrollü yayında" durumuna
taşır. İki fazdan oluşur; arada dosya yerleştirme işi `gelen-kutusu-isle`
skill'ine devredilir.

```
dokuman-denetle  →  BU SKILL Faz A  →  gelen-kutusu-isle  →  BU SKILL Faz B
(içerik uygun mu)   (kod, rev, künye)   (tasnif, kopyalama)   (sicil, dağıtım)
```

## Yapar / Yapmaz

| Yapar | Yapmaz (devreder) |
|---|---|
| Kod ve revizyon atama | İçerik/mevzuat denetimi → `dokuman-denetle` |
| Künye yazma (kod, rev, tarih, gizlilik, onay) | Dosya taşıma/kopyalama → `gelen-kutusu-isle` |
| Sicile satır yazma, EK/master revizyonu ilerletme | Uygunsuzluk açma → `uygunsuzluk` |
| Dağıtım kaydı ve önceki revizyonun SUPERSEDED edilmesi | Belge yazma/üretme (ayrı iş) |

## Adım 0 — Şirketi belirle (atlanamaz)

`references/sirket-profilleri.md` okunur. Şirket sırayla şöyle belirlenir:
kullanıcının beyanı → belge kodunun öneki (TRB./BTE./EAR./VIM. = o şirket,
öneksiz GOV/PR/MDR/KEK = Addpark) → çalışılan site. Hiçbiri netleşmiyorsa
**sorulur**; varsayılmaz.

Profil şunları verir: site, kütüphane, gelen kutusu, **sicil modeli**
(BÖLÜNMÜŞ / TEK DOSYA), sicil dosya adları, driveId, kod şeması, standart.

---

## FAZ A — Yayın adayı hazırlama

**A1 · Belgeyi aç ve oku.** Karar hafızadan veya arama sonucundan
verilmez; belge açılır.

**A2 · Denetim teyidi.** Belge `dokuman-denetle`den geçmiş mi? Geçmemişse
kullanıcıya söylenir ve önce o çalıştırılır. Kullanıcı "denetlemeden
yayınla" derse bu rapora not düşülür.

**A3 · Kod kararı.** Sicil okunur (BÖLÜNMÜŞ ise önce IDX, sonra ilgili EK;
TEK DOSYA ise master CSV).
- Yeni belge → aile içinde boş sıradaki numara. Numara **sicilden**
  okunarak bulunur, tahmin edilmez.
- Mevcut belgenin yeni sürümü → kod aynı kalır, revizyon +1.
- Aynı kod farklı belgede kullanılmış mı diye çakışma kontrolü yapılır.

**A4 · Revizyon kuralı.** İlk yayın Rev00. Sonraki her yayın +1. Yayın
öncesi taslaklar revizyon numarası almaz. `_FINAL`, `_SON`, `_v2` gibi
ekler **kullanılmaz**.

**A5 · Künye.** Belgenin künye alanına yazılır: doküman kodu · revizyon ·
yayın tarihi · hazırlayan / kontrol / onay · gizlilik sınıfı · sayfa
altbilgisinde kod+rev. Şirketin antet ve marka kuralları profilden okunur.

**A6 · Dosya adı.** `KOD_Belge-Adi_RevNN.uzanti` biçiminde. Türkçe karakter
ve boşluk kullanılmaz.

**A7 · Onay ve teslim.** Kullanıcıya tablo halinde sunulur: kod · revizyon ·
dosya adı · hedef kütüphane/klasör · sicil hedefi. **Onay alınmadan** dosya
hiçbir yere konmaz. Onay sonrası belge YAYIN ADAYI olarak şirketin gelen
kutusuna bırakılır ve `gelen-kutusu-isle`ye devredilir.

---

## FAZ B — Tescil (yerleştirme tamamlandıktan sonra)

**B1 · Yerleşim doğrulaması.** Hedef klasör **listelenir**; dosyanın orada
olduğu ve boyutunun beklenenle uyuştuğu görülür. Görülmeden tescil yapılmaz.

**B2 · Sicil hedefini belirle.**
- **BÖLÜNMÜŞ (Addpark):** `GOV.05_IDX_Sicil-Haritasi.md` okunur, ailenin
  hangi EK'te olduğu belirlenir. EK7 = belgelendirme/sertifika ailesi.
  Eski tek dosyalı sicil (`GOV.05_EK1_Master_Dokuman_Sicili.csv`)
  17.09.2026'da arşive alınmıştır — kullanılmaz.
- **TEK DOSYA (TRB · BTE · EAR · VIM):** şirketin master sicil CSV'si.

**B3 · Yazma öncesi güvenlik.**
1. Sicil dosyası **yazımdan hemen önce** yeniden okunur (aynı gün başka
   bir oturumun yazdığı satırı ezmemek için).
2. Mevcut nüsha `99_Onceki-Surumler` altına kopyalanır (silme yok).
3. Satır sayısı ve dosya boyutu not edilir.

**B4 · Satırı yaz.** Sicil kolon düzenine birebir uyulur; kolon sırası
değiştirilmez, ayraç (`;`) korunur. Yeni kayıt: kod · ad · revizyon ·
yayın tarihi · konum · gizlilik · durum (YAYINDA) · sahibi.
Revizyon güncellemesi: aynı satır güncellenir, önceki revizyon
**SUPERSEDED** olarak işaretlenir (satır silinmez).

**B5 · Sicil revizyonunu ilerlet.**
- BÖLÜNMÜŞ: yazılan EK'in revizyonu +1; EK1'deki sicil-envanter satırı da
  güncellenir; IDX değişmediyse dokunulmaz.
- TEK DOSYA: dosya adındaki `R__` +1 (örn. `..._R07.csv` → `..._R08.csv`),
  eski nüsha `99_Onceki-Surumler`'e kopyalanır.

**B6 · Yazma sonrası doğrulama.** Dosya yeniden okunur: satır sayısı
beklenen kadar arttı mı, yeni satır doğru kolonlarda mı, dosya boyutu
mantıklı mı. Uymuyorsa yedekten dönülür ve kullanıcı bilgilendirilir.

**B7 · Dağıtım kaydı.** Belgenin kimlere hangi tarihte dağıtıldığı kaydedilir
(Addpark'ta `DMS.PRS.01-EK1`; diğer şirketlerde profilde belirtilen dağıtım
kaydı). Kayıt yoksa kurulur — dağıtım kaydı olmadan yayın tamamlanmış
sayılmaz.

**B8 · Kapanış raporu.** Kod · revizyon · konum (webUrl) · sicil satırı ·
sicil yeni revizyonu · dağıtım · SUPERSEDED edilen önceki revizyon.

---

## Değişmez kurallar

- Her yazma adımından **önce** kullanıcı onayı alınır; bir onay yalnız o
  işlemi kapsar, sonrakini kapsamaz.
- Hiçbir dosya **silinmez**; arşive alma kopyalamadır, kaynak yerinde kalır.
- Sicil satırı hafızadan değil, **açılmış belgeden** üretilir.
- itemId'ler kayabilir; klasör her oturumda listelenerek doğrulanır,
  profildeki driveId başlangıç noktasıdır.
- Kalite belgelerinde Notion, Claude, GitHub gibi kişisel/araç katmanına
  atıf yapılmaz.
- Açık işler ve YGG kararları resmî sicilde tutulur (Trabtech'te
  `TRB.ACT.01`), kişisel araçlarda değil.

## Bilinen tuzaklar

- Aynı kodun iki belgede kullanılması: A3'teki çakışma kontrolü atlanırsa
  sicil iki satırla bozulur.
- Aynı gün iki oturum: B3.1 okunmadan yazılırsa önceki satır kaybolur.
- Dosya adı `_FINAL` ile biten eski örnekler LEGACY'dir, kopyalanmaz.
- Boş bir kütüphanenin driveId'si aramayla bulunamaz; içinde en az bir
  dosya olan komşu klasörden gidilir.
- Bir belgenin "yok" olduğu, aranıp bulunamadığı ile aynı şey değildir;
  rapora nerede arandığı yazılır.

## Sürüm geçmişi
- 1.0 (2026-09-24): ilk sürüm. Beş şirketli; sicil modeli profilden
  okunur. `gelen-kutusu-isle` ile Faz A/B devir mimarisi.
