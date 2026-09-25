---
name: kasa-giris-cikis
description: Kuntay'ın kasa defteridir — Notion "Kasa" veritabanına para giriş/çıkışını işler, güncel bakiyeyi raporlar. Kullanıcı "/kasa-giris-cikis", "kasa", "kasaya para geldi", "kasadan ödedim", "X'ten Y TL geldi", "Z'ye ödeme yaptım", "kasa durumu ne", "bakiye ne", "bu ay ne girdi çıktı", "kasa raporu", "kasa defteri" gibi bir şey söylediğinde MUTLAKA bu skill'i kullan. Tek mesajda birden fazla hareket olabilir; hepsi ayrı satır olarak işlenir. Döviz hareketinde işlem günü kuru web'den alınır ve kayda yazılır. Kayıtlar YALNIZ Notion Kasa veritabanına yazılır; hafızaya, sohbete veya başka yere yazılmaz. Sadece Kuntay Aktaş / BTech Grup ortamı için geçerlidir.
version: 1.0
---

# Kasa Giriş-Çıkış

Notion **Kasa** veritabanı bir defterdir: her satır tek bir para hareketi, sütun toplamı güncel bakiye.
Koordinatlar ve alan yazım biçimleri için `references/veritabani.md` oku (yazmadan önce mutlaka).

## Üç mod

| Mod | Tetikleyici | Ne yapılır |
|---|---|---|
| **Yakalama** | "geldi / ödedim / çıktı / girdi" + tutar | Hareketi ayrıştır → kur → Notion'a yaz → yeni bakiyeyi bildir |
| **Rapor** | "kasa durumu / bakiye / bu ay / kim ne verdi" | Sorgula → tablo + bakiye + para birimi kırılımı |
| **Düzeltme** | "o kayıt yanlış / şunu düzelt / sil" | Kaydı bul → onay al → güncelle (silme yerine Not'a "İPTAL" yaz, Tutar 0) |

## Yakalama — yaz-önce protokolü

1. Mesajdan her hareket için şunu çıkar: **Yön** (Giriş/Çıkış) · **Tutar** · **Para Birimi** · **Karşı Taraf** · **Tarih** (belirtilmediyse bugün) · **Kategori** ve **Şirket** (çıkarabiliyorsan).
2. Para birimi TRY değilse: işlem günü TCMB/piyasa kurunu web'den al, `Kur` alanına yaz, Not'a kaynağı ve saati yaz. TRY ise `Kur = 1`.
3. **Önce yaz, sonra sor.** Belirsiz alanı boş bırak, Not'a "kategori/şirket belirtilmedi" yaz; kaydı yazdıktan sonra tek soruda tamamlat. Yakalamayı asla soruyla bloklama.
4. Yazdıktan sonra Net TL toplamını sorgula ve bildir: `Yeni bakiye: … TL` + para birimi kırılımı.
5. Kopya kontrolü: aynı gün, aynı karşı taraf, aynı tutar zaten varsa yazma, sor.

### Ayrıştırma kuralları
- "K" = bin, "M" = milyon (548K TL → 548000 TRY).
- "X'ten geldi", "tahsil ettim", "yattı" → **Giriş**. "X'e ödedim", "gönderdim", "harcadım" → **Çıkış**.
- Tutar daima pozitif yazılır; işaret `Yön`den gelir (Net TL formülü işaretler).
- Karşı taraf grup şirketiyse (BTech/Addpark/Trabtech/Earfit/Vimics) `Şirket` = o şirket, `Kategori` = "Grup içi transfer" **yalnız** kullanıcı transfer/borç dediyse; söylemediyse kategori boş bırakılır ve sorulur.
- Kişisel harcama sinyali (market, yemek, kişisel fatura) → `Şirket = Kişisel`.

## Rapor
- Varsayılan pencere: bu ay. "Toplam" denirse tüm kayıtlar.
- Çıktı: tarih sıralı tablo (Tarih · Yön · Karşı taraf · Tutar+PB · Kur · Net TL) + **Bakiye (Net TL toplamı)** + para birimi başına Giriş/Çıkış/Net.
- Sorgu SQL'inde formül sütunları (`Net TL`, `TL Karşılığı`) **sorgulanamaz**; `Tutar * Kur` ile hesapla, işareti `Yön`den ver.

## Yasaklar
- Kasa hareketini hafıza dosyasına, Aksiyonlar'a veya sohbet notuna yazmak.
- Kur uydurmak; bulunamazsa alanı boş bırak, Not'a yaz, kullanıcıya sor.
- Kullanıcı onayı olmadan kayıt silmek veya tutar değiştirmek.
- Banka kimlik bilgisi, IBAN veya kart numarasını Kasa'ya yazmak (Belge alanına yalnız dekont/fatura numarası).
