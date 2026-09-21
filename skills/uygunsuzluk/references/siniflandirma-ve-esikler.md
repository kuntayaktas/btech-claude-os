# Sınıflandırma, Aksiyon Tipi ve Eşikler

## Sınıflandırma

| Sınıf | Ölçüt | Örnek |
|---|---|---|
| **Kritik** | Hasta güvenliğini doğrudan etkiler · piyasaya arz edilmiş cihazı etkiler · yasal bir bildirim yükümlülüğü yerine getirilmemiş · onaylanmış kuruluş sertifikasının dayanağını zayıflatır | Ciddi olay bildirimi yapılmamış; Ek XIII beyanı olmadan cihaz sevk edilmiş |
| **Major** | Bağlayıcı bir şart sistemin hiçbir yerinde karşılanmıyor · süreç tanımlı ama uygulanamaz durumda · kayıt zinciri kopuk | Prosedürün atıf yaptığı form hiç mevcut değil; PSUR döngüsü tanımlı değil |
| **Minor** | Şart karşılanıyor ancak eksik, tutarsız veya izlenebilirliği zayıf | Sicil ile belge içi revizyon farklı; iki belgede aynı kod farklı yazılmış |
| **Gözlem** | Şart ihlali yok, iyileştirme fırsatı var | Prosedür yürürlükte ama gözden geçirme tarihi yaklaşıyor |

Sınıf **yumuşatılmaz**. Diplomatik dil anlatıma uygulanır, sınıfa değil.

## Ürün / vaka etkisi

`Var` işaretlenirse Mod B'de G kapıları zorunlu hale gelir ve
`Önerilen Aksiyon` en az `DÖF (PR13.FR02)` olur. `Belirsiz` bırakılamaz — bilgi
yoksa kullanıcıya sorulur.

## Aksiyon tipi karar matrisi

| Durum | Aksiyon |
|---|---|
| Yalnız metin/biçim hatası, kök neden dokümantasyonda değil | **Düzeltme** — DKK bile gerekmez, `dokuman-denetle` zincirinden düzeltilir |
| Doküman içeriği değişecek, kök neden doküman kontrolünde | **DKK** |
| Süreç, yetkinlik, ürün veya sistem etkisi var | **DÖF (PR13.FR02)** |
| Şart karşılanıyor ama izlenmeli | **İzleme** |
| Bulgu geçersiz çıktı | **Aksiyon yok** (satır RED'e gider) |

## DÖF Türü — Düzeltici mi Önleyici mi

Ayrı bir kolondur ve aksiyon tipinden bağımsızdır.

| | Ne zaman |
|---|---|
| **Düzeltici** | Uygunsuzluk gerçekleşmiş; mevcut durumu düzeltiyoruz |
| **Önleyici** | Uygunsuzluk henüz oluşmamış; potansiyel neden ortadan kaldırılıyor. PR13.FR02'nin **D7** bölümü doldurulur |

PR13.FR03'teki 53 kaydın tamamı "Düzeltici" — sistemde "Önleyici"
kaydı hiç yok. Bir bulgu gerçekten önleyici nitelikteyse bu doğru
işaretlenmeli; kolaylık olsun diye "Düzeltici" seçilmemeli.

**DÖF–DKK sınırı (yerleşik karar):** doküman değişikliği bir DÖF'ün
D5 satırıysa ayrı DKK açılmaz. DKK açılıyorsa DÖF o satırı DKK'ya
devreder ve kapanışı DKK'dan izler.

## Açık bulgu tavanı

Tavan **yalnız `KABUL` edilmiş** satırlar için işler. Sicildeki
`TASLAK` ve `İNCELENDİ` satırlarının denetim açısından bir maliyeti
yoktur — kabul anından itibaren ISO 13485 §8.5.2 saati başlar.

```
Tavan = aylık kapatma kapasitesi × 3 ay
```

| Parametre | Başlangıç | Not |
|---|---|---|
| Aylık kapatma kapasitesi | 8 | **Varsayım.** İlk 4 haftada gerçek hız ölçülüp güncellenir |
| Tavan çarpanı | 3 ay | 3 aydan eski açık bulgu denetçi için "sistem işlemiyor" göstergesidir |
| Başlangıç tavanı | 24 | |
| Kritik bulgu | Tavana tabi değil | Hedef 0; kabul edilir edilmez DÖF açılır, kuyruğa girmez |

**Davranış:**
- Açık kabul sayısı tavanın %80'ine ulaşınca → skill uyarır
- Tavan aşılınca → skill yeni bulgu üretmeye devam eder ama
  **KABUL önerisi vermez**; satırlar `İNCELENDİ`de bekletilir
- Kritik bulgu varken → skill her çıktının başında bunu hatırlatır

Skill KABUL sayısını bulgu sicilinden sayar ve tavanla karşılaştırır.
Parametreler R02 xlsx'in `04_Tavan-Kontrolu` sayfasındadır.

## Tarama önceliği (alfabetik değil, risk bazlı)

1. Ismarlama cihaz zinciri — Ek XIII beyanı, vaka dosyası, serbest bırakma
2. Tasarım kontrolü ve risk yönetimi
3. Klinik değerlendirme, PMS, PSUR, vijilans
4. Üretim, proses validasyonu, izlenebilirlik, temizlik/sterilizasyon
5. Tedarikçi ve satın alma
6. Destek süreçler — İK, altyapı, doküman kontrolü, IT

Kullanıcı belge verdiyse öncelik sırası uygulanmaz; verilen belge
taranır. Öncelik yalnız "sırayla tara" tipi taleplerde geçerlidir.
