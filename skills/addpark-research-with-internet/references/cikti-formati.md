# Çıktı Formatı

## Standart yapı — iki kaynak, iki bölüm

```
## İç kaynak (ADDPARK belgeleri)

[KAYIT] / [ÇIKARIM] / [BULUNAMADI] satırları — künyeli

## Dış kaynak (internet)          (yalnız iç kaynak yetmediyse)

[DIŞ KAYNAK] / [DIŞ — DOĞRULANAMADI] satırları — URL + tarih

## Karşılaştırma                  (yalnız iki taraf da varsa)

| Konu | ADDPARK belgesi | Dış referans | Durum |

## Kaynaklar

| # | Tür | Kaynak | Konum / URL | Teyit |

## Tarama kapsamı

- İç: bakılan kütüphaneler (tam / kısmi / hiç)
- İç: bulunamayanlar
- Dış: kullanılan kaynaklar + erişim tarihi
- Dış: doğrulanamayanlar
```

**İki bölüm asla birleştirilmez.** Kısa cevaplarda bile başlıklar durur —
okuyucunun bir cümlenin nereden geldiğini başlığa bakarak anlaması gerekir.
Tarama kapsamı hiçbir durumda atlanmaz.

## Kaynak künyesi biçimi

`[KOD Rev · Görünen-Kütüphane/Klasör/Dosya-adı · konum]`

- Görünen kütüphane adı kullanılır (10_Kalite), URL adı değil (01_Kalite)
- Bölüm/madde/sayfa biliniyorsa yazılır; **bilinmiyorsa yazılmaz**
- Uydurulmuş madde numarası tüm çıktıyı geçersiz kılar

## Kaynaklar tablosu

| # | Tür | Kaynak | Konum / URL | Teyit |
|---|---|---|---|---|
| 1 | İç | PR33 İlk Ürün Muayenesi Prosedürü Rev00 | 10_Kalite/02_Prosedurler | belge içi |
| 2 | İç | GOV.05 Master Doküman Sicili R05 | 10_Kalite/00_Yonetisim | CSV satırı |
| 3 | Dış | AS9100D md. 8.5.1.3 | sae.org/... (erişim 01.08.2026) | birincil |
| 4 | Dış | Sektör özeti | ...blog... | **kullanılmadı — kalite eşiği altı** |

`Teyit` kolonu değerleri: `belge içi` · `dosya adı` · `sicil kaydı` ·
`klasör listelemesi`. En zayıf teyit `sicil kaydı`dır; tek başına
dayanak olduğunda çıktıda görünmesi gerekir.

## Doğru örnek

> ## Bulgu
>
> `[KAYIT]` FAI tetikleyicileri PR33'te 11 madde olarak tanımlı; proses
> parametre seti değişikliği bunlardan biridir.
> `[PR33 Rev00 · 10_Kalite/02_Prosedurler/PR33_..._Rev00.docx · §5]`
>
> `[KAYIT]` FAI kayıtları için üç ayrı kontrollü form mevcut: PR33-F01,
> PR33-F02, PR33-F03.
> `[10_Kalite/02_Prosedurler · klasör listelemesi]`
>
> `[ÇIKARIM]` Parametre değişikliği kaydı 30_Uretim/02_Proses-Parametreleri
> altında tutulduğundan, FAI tetikleyicisinin izlenmesi bu iki konum
> arasında el ile bağ kurulmasını gerektiriyor — otomatik bir bağ belgede
> tanımlı değil. Dayanak: PR33 §5.5 + 30_Uretim klasör yapısı.
>
> `[BULUNAMADI]` Tamamlanmış FAI kaydı örneği. Arandı: 30_Uretim/08_Muayene-ve-Test
> listelemesi, `sharepoint_search` "FAI" ve "AS9102". Sonuç yok — prosedür
> yayında ancak uygulanmış kayıt SharePoint'te görünmüyor.

## Yanlış örnek — bunları yapma

| Yanlış | Neden |
|---|---|
| "AS9102 Rev C standardına göre üç form doldurulur" | Kaynak künyesi yok; standart bilgisi belge iddiası gibi sunulmuş |
| "Prosedür muhtemelen 2026 başında yayınlandı" | Tahmin. Tarih belgede varsa yazılır, yoksa yazılmaz |
| "PR33 §7.3'te belirtildiği üzere..." (madde teyit edilmeden) | Uydurulmuş madde numarası |
| "Sicilde YAYIN görünüyor, yani belge mevcut" | Hayalet kayıt riski; dosya teyidi yok |
| "Başka bir sitede benzer bir dosya buldum" | Kapsam ihlali |
| "Elimizde bir şey yok" (tek arama sonrası) | Yetersiz tarama |

## "Bulunamadı" nasıl yazılır

Kötü: *"Bu konuda bir belge bulamadım."*

İyi:
> `[BULUNAMADI]` Tedarikçi denetim planı.
> Arandı: GOV.05 sicili (kod ve başlık taraması), 10_Kalite/07_Tedarikci-Kalite
> klasör listelemesi, `sharepoint_search` "tedarikçi denetim" / "supplier audit".
> Sicilde de kayıtlı değil. → Belge kapsamda yok görünüyor.

Fark: kullanıcı nereye bakıldığını görür, aramayı tekrar etmez ve
"belge yok" ile "ben bulamadım" ayrımını yapabilir.

## Kapsam dışı not bloğu

Genel bilgi gerekiyorsa yalnız en sonda, ayrı ve etiketli:

> **Kapsam dışı not (ADDPARK belgesi değil, genel bilgi):**
> AS9100D md. 8.5.1.3 ilk ürün muayenesini şart koşar. Bu ifade benim
> genel bilgimdir; ADDPARK belgelerinden okunmamıştır ve mevzuat kararına
> dayanak yapılmadan önce standart metninden teyit edilmelidir.

Kullanıcı "sadece bizim verilerimiz" dediyse bu blok hiç yazılmaz.

## Ton

- Kısa, yoğun, tablo ağırlıklı
- Emoji yok
- Türkçe teknik içerikte "Eklemeli İmalat" (AM değil)
- Yorum ile kayıt karışmaz; yorum `[ÇIKARIM]` etiketiyle ve dayanağıyla


## Dış kaynak künyesi

`[Yayıncı · Belge/Sayfa · URL · erişim GG.AA.YYYY]`

Örnek:
`[EUR-Lex · MDR 2017/745 Ek XIII · eur-lex.europa.eu/... · erişim 01.08.2026]`

İç künye ile dış künye biçimsel olarak ayırt edilebilir olmalıdır —
okuyucu künyeye bakarak kaynağın hangi taraftan geldiğini anlamalı.

## Dış kaynakta yanlış örnekler

| Yanlış | Neden |
|---|---|
| "MDR Ek XIII şunu şart koşar" (URL yok) | Hatırdan mevzuat — bu skill'de de yasak |
| "İnternete göre Addpark'ın kapasitesi..." | Dış kaynak ADDPARK gerçeği hakkında iddia taşıyamaz |
| Aynı madde işaretinde iç ve dış veri | Bölüm ayrımı ihlali |
| "Standart metnine erişemedim ama muhtemelen..." | `[DIŞ — DOĞRULANAMADI]` de ve dur |
| Blog/forum alıntısı | Kalite eşiği altı |

## İç kaynak yetiyorsa

Dış kaynak bölümü **hiç açılmaz**. Boş başlık bırakma, "internette de
baktım bir şey yok" yazma. Yalnızca tarama kapsamında "dış kaynağa
çıkılmadı — iç kaynak yeterliydi" satırı yer alır.
