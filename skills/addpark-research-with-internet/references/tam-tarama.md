# Tam Tarama Protokolü

Sicil ve hedefli arama sonuç vermediğinde devreye girer. Amaç: "sicilde
yok" ile "sistemde yok" arasındaki farkı kapatmak.

**Kural: sicilde bulunamayan hiçbir konu, tam tarama yapılmadan
"bulunamadı" olarak raporlanmaz.**

## Ne zaman tetiklenir

Aşağıdakilerin **tümü** doğruysa tam tarama zorunludur:

1. GOV.05 sicilinde ilgili kod/başlık/aile bulunamadı
2. `sharepoint_search` en az 3 terim varyantıyla (TR + EN + kod) denendi, boş
3. Konunun beklenen kütüphanesi listelendi, çıkmadı

Ayrıca kullanıcı "komple tara", "her yere bak", "tam tarama yap"
dediğinde 1-3 atlanır, doğrudan tam taramaya geçilir.

## Neden gerekli

Sicilde kayıtlı olmayan belge çok sayıda mevcut — bilinen vaka:
02_Prosedurler'de AR_01, IS_01–IS_04, PR_GUM_01, PR_SAT_01, PR_SEY_01,
PR_TES_01, PR_ZIM_01 ve altı form eki sicilde hiç kayıtlı değilken
klasörde duruyordu. Sicil kapsamı = gerçek kapsam değildir.

Ayrıca yanlış kütüphaneye düşmüş dosyalar var (örn. varsayılan
`Shared Documents` kökünde kalmış sicil kopyası). Bunlar yalnız tam
taramayla görünür.

## Tarama sırası — öncelikli, rastgele değil

| Öncelik | Kapsam | Gerekçe |
|---|---|---|
| 1 | Konunun kendi kütüphanesi (tüm alt klasörler + arşivler) | En olası yer |
| 2 | 10_Kalite (tüm 13 alt klasör) | Kontrollü belgelerin ana yatağı |
| 3 | 99_Gelen-Kutusu (00_Yeni, 01_Islenmis, 02_Karar-Bekleyen) | Tasnif edilmemiş belge burada bekliyor olabilir |
| 4 | 80_Yonetim + 30_Uretim | Rapor ve kayıt tarafı |
| 5 | 21_/22_Projeler | Proje eki olarak konmuş olabilir |
| 6 | Kalan tüm kütüphaneler + `Shared Documents` kökü | Yanlış yere düşmüş dosyalar |

## İki aşamalı yürütme

**Aşama A — ad taraması (ucuz).**
Her kütüphanenin klasör ağacını listele, yalnız **dosya adlarına** bak.
Dosya açma yok. Konuyla ilişkili olabilecek adayları biriktir.

**Aşama B — aday açma (pahalı).**
Aşama A'dan çıkan adayları aç ve içinden teyit et. Aday sayısı 10'u
aşarsa listeyi kullanıcıya sun, hangilerinin açılacağını sor.

Bu ayrım olmadan tam tarama bütçeyi tüketir ve yarıda kalır.

## Arşiv ve süper-sedded dosyalar

Tam taramada `99_Arsiv`, `11_Arsiv_Gecmis`, `99_Arsiv-Obsolete` ve
`_SUPERSEDED` dosyaları **taranır ama ayrı raporlanır**:

> `[KAYIT — ARŞİV]` ... konum ... — yürürlükte değil, tarihsel kayıt

Aranan belgenin yalnız arşivde bulunması önemli bir bulgudur: belge var
ama yürürlükten kalkmış demektir; bu "bulunamadı"dan çok farklı bir cevaptır.

## Kesinti ve bütçe

Tam tarama uzun sürer. Yarıda kesilirse **kesildiği nokta yazılır**:

> Tarama kapsamı: 10_Kalite (tam) · 30_Uretim (tam) · 21_Projeler-Aktif
> (12 proje klasöründen 5'i) · diğer kütüphaneler taranmadı.
> Sonuç bu kapsamla sınırlıdır.

Kısmi taramayı tam tarama gibi sunma. "Hiçbir yerde yok" cümlesi ancak
altı öncelik kademesi de bitince kurulabilir.

## Tam tarama sonrası çıktı zorunlulukları

1. **Kapsam tablosu** — hangi kütüphane tam, hangisi kısmi, hangisi hiç
2. **Aday listesi** — açılan dosyalar ve neden elendikleri
3. **Sicil boşluğu bulgusu** — tarama sırasında sicilde kayıtlı olmayan
   ilgili belge bulunduysa bu ayrıca raporlanır (sicil bakımı için değerli)

Üçüncü madde sık atlanır ama en değerli çıktıdır: tam tarama, cevabı
bulurken sicilin eksiklerini de ortaya çıkarır.
