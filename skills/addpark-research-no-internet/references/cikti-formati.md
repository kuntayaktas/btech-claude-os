# Çıktı Formatı

## Standart yapı

```
## Bulgu

[etiketli satırlar — her biri kaynak künyeli]

## Çelişkiler        (yalnız varsa)

## Kaynaklar

| # | Belge | Konum | Revizyon | Teyit |

## Tarama kapsamı

| Kütüphane | Kapsam |
|---|---|
| 10_Kalite | tam / kısmi / taranmadı |

- Bulunamayanlar:
- Sicilde kayıtsız bulunan belgeler:
- Erişilemeyen / doğrulanamayan:
```

Tam tarama yapıldıysa kapsam tablosu zorunludur — kısmi taramayı tam
tarama gibi sunmak, uydurmayla aynı sınıfta hatadır.

Kısa sorularda "Bulgu + Kaynaklar + tek satır tarama kapsamı" yeterlidir.
Tarama kapsamı hiçbir durumda atlanmaz.

## Kaynak künyesi biçimi

`[KOD Rev · Görünen-Kütüphane/Klasör/Dosya-adı · konum]`

- Görünen kütüphane adı kullanılır (10_Kalite), URL adı değil (01_Kalite)
- Bölüm/madde/sayfa biliniyorsa yazılır; **bilinmiyorsa yazılmaz**
- Uydurulmuş madde numarası tüm çıktıyı geçersiz kılar

## Kaynaklar tablosu

| # | Belge | Konum | Revizyon | Teyit |
|---|---|---|---|---|
| 1 | PR33 İlk Ürün Muayenesi Prosedürü | 10_Kalite/02_Prosedurler | Rev00 | belge içi |
| 2 | GOV.05 Master Doküman Sicili | 10_Kalite/00_Yonetisim | R05 | CSV satırı |

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


## Arşiv bulgusu

Aranan belge yalnız arşivde bulunduysa bu "bulunamadı" değildir:

> `[KAYIT — ARŞİV]` Tedarikçi denetim planı R00.
> `[10_Kalite/07_Tedarikci-Kalite/99_Arsiv/... ]`
> Yürürlükte değil. Yürürlükteki bir muadili tam taramada bulunamadı.

Fark önemlidir: belge hiç yok mu, yoksa vardı da kaldırıldı mı — bu iki
durum denetimde çok farklı sonuç doğurur.
