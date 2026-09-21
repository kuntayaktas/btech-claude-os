# Şart Matrisi — SM Rev01

**Sürüm:** SM Rev01 · **Doğrulama tarihi:** 07.08.2026
**Kapsam:** ADDPARK — ısmarlama (custom-made), Sınıf III implante
edilebilir tıbbi cihaz üreticisi; ayrıca AS9100D kapsamındaki
havacılık/savunma işi.

## Kullanım kuralları

1. Bu matris **donmuştur**. Her çalıştırmada MDR yeniden yorumlanmaz;
   buradaki satırlar kullanılır.
2. `Doğrulama = DOĞRULANDI` olmayan satırdan **bulgu açılamaz**.
3. `ÜRÜN BAZLI` işaretli satırlarda uygulanabilirlik önce kullanıcıya
   sorulur — skill kendi karar vermez.
4. Matris değişirse sürüm numarası artar ve referans xlsx'in
   `01_Sart_Matrisi` sayfası eşitlenir; eski sürüm `99_Arsiv`'e alınır. Farklı sürümlerle üretilmiş
   bulgular karşılaştırılamaz.
5. Onay zinciri: Hazırlayan (kalite) → İnceleyen **PRRC** (mevzuat
   doğruluğu, MDR Md. 15) → Onaylayan **QMR** (sistemde kullanım).

## ISMARLAMA CİHAZIN TEMEL FARKI — bu matrisin belkemiği

Ismarlama cihaz **Ek II/III teknik dosyasına tabi değildir.** MDR
Md. 10(5) gereği dokümantasyon **Ek XIII Bölüm 2**'ye göre tutulur.
Bu, seri üretim cihazına yazılmış bir şartı ısmarlama cihaza
uygulamanın yanlış bulgu üreteceği anlamına gelir. Her eşlemede
"bu şart ısmarlamada hangi yoldan karşılanıyor?" sorulur.

---

## MDR 2017/745

| Kod | Madde | Şart | Aranan kanıt | Uygulanabilirlik | Doğrulama |
|---|---|---|---|---|---|
| SM-001 | Md. 2(3) | Ismarlama cihaz tanımına uygunluk | Reçete zinciri, tek hastaya özgülük beyanı | Evet | DOĞRULANDI |
| SM-002 | Md. 10(1)-(4) | Üretici genel yükümlülükleri, risk yönetimi, KYS | KEK, süreç haritası, sorumluluk matrisi | Evet | DOĞRULANDI |
| SM-003 | **Md. 10(5)** | Ismarlama cihaz dokümantasyonu **Ek XIII Böl. 2**'ye göre tutulur (Ek II/III **uygulanmaz**) | Üretim yeri bilgisi + tasarım, üretim ve performansın anlaşılmasını sağlayan dokümantasyon | Evet | DOĞRULANDI |
| SM-004 | Md. 10(8) | Dokümantasyon saklama: 10 yıl, **implante edilebilirde 15 yıl** | Saklama süresi tanımı, arşiv kuralı | Evet | DOĞRULANDI |
| SM-005 | Md. 10(9) | KYS'nin asgari kapsamı (mevzuat uyum stratejisi, kaynak yönetimi, PMS, vijilans dahil) | KEK madde eşlemesi | Evet | DOĞRULANDI |
| SM-006 | Md. 15 | PRRC atanması, yetkinliği, görevleri | Atama kaydı, yetkinlik kanıtı, görev tanımı | Evet | DOĞRULANDI |
| SM-007 | Md. 18 | İmplant kartı ve hasta bilgilendirmesi | Kart içeriği, hastaya teslim kaydı, üretici web sayfası | **ÜRÜN BAZLI** — Md. 18(3) muafiyet listesi vida, plaka, tel, pim, klips, konnektör içerir; CMF plaka/vida muaf olabilir, TMJ/diz/omurga kafesi büyük olasılıkla muaf değil. Ürün ürün karar verilir | DOĞRULANDI (uygulanabilirlik ürün bazlı) |
| SM-008 | Md. 18(1)(a) + Md. 27 | İmplant kartında UDI zorunlu, ancak ısmarlama cihazda UDI yok | **Gerilim noktası.** Kart gerekliyse cihaz kimliğinin UDI yerine nasıl verildiği gerekçelendirilmeli | ÜRÜN BAZLI | DOĞRULANDI |
| SM-009 | **Md. 27(3)** | Ismarlama cihaza **UDI atanmaz** | Muafiyetin gerekçeli beyanı; etikette UDI taşıyıcısı bulunmaması | Evet | DOĞRULANDI |
| SM-010 | **Md. 29(1)** | Ismarlama cihaza **Basic UDI-DI atanmaz**, UDI veritabanına kayıt yapılmaz | Kayıt dışı bırakma gerekçesi | Evet | DOĞRULANDI |
| SM-011 | **Md. 31** | Yalnız ısmarlama cihaz üretse bile üretici **aktör olarak kayıtlıdır (SRN)** | SRN kaydı / EUDAMED aktör kaydı kanıtı | Evet | DOĞRULANDI |
| SM-012 | **Md. 52(8)** | Ismarlama cihazda uygunluk değerlendirme yolu: **Ek XIII** + Sınıf III implante edilebilirde **Ek IX Böl. I veya Ek XI Kısım A** (onaylanmış kuruluş) | NB sertifikası, seçilen yolun kaydı | Evet | DOĞRULANDI |
| SM-013 | **Ek XIII Böl. 1** | Ismarlama cihaz beyanı: hasta adı/akronim/kod, reçeteyi yazan yetkili kişi, cihaz özellikleri, tek hastaya özel olduğu ifadesi | MDR.FR.008 ailesi, imzalı beyan | Evet | DOĞRULANDI |
| SM-014 | Ek XIII Böl. 1 | Beyanın saklanması: 10 yıl, **implante edilebilirde 15 yıl** | Saklama kuralı ve arşiv konumu | Evet | DOĞRULANDI |
| SM-015 | **Ek XIII Böl. 2** | Üretim yeri bilgisi + tasarım/üretim/performansın anlaşılmasını sağlayan dokümantasyon, yetkili otoriteye hazır | Vaka dosyası yapısı, teknik dosya eşdeğeri | Evet | DOĞRULANDI |
| SM-016 | **Ek XIII Böl. 2 §5** | Üretim sonrası deneyimin gözden geçirilmesi ve belgelenmesi (**PMCF — Ek XIV Kısım B dahil**), gerekli düzeltici faaliyetin uygulanması, ciddi olay ve FSCA'nın **Md. 87(1)** uyarınca yetkili otoriteye bildirilmesi | Gözden geçirme kaydı, PMCF çıktısı, bildirim kanıtı | Evet | DOĞRULANDI |
| SM-017 | Ek I (GSPR) | Genel güvenlilik ve performans şartları | GSPR kontrol listesi ve her satır için kanıt atfı | Evet | DOĞRULANDI |
| SM-018 | **Ek I Böl. III §23.2** | Etikette "**ısmarlama cihaz**" ibaresi | Etiket şablonu (LBL ailesi) | Evet | DOĞRULANDI |
| SM-019 | Md. 61 + Ek XIV Kısım A | Klinik değerlendirme ve GSPR'ye uygunluğun klinik kanıtı | CER, literatür stratejisi | Evet. **Not:** ısmarlama cihazda klinik değerlendirme, risk yönetimi ve PMS benzer tasarım/malzeme/kullanım amacına sahip cihaz ailesi bazında karşılanabilir — her cihaz için ayrı ayrı gerekmez | DOĞRULANDI |
| SM-020 | Ek XIV Kısım B | Pazar sonrası klinik takip (PMCF) | PMCF planı ve değerlendirme raporu | Evet | DOĞRULANDI |
| SM-021 | Md. 83-84 | PMS sistemi ve PMS planı; ısmarlamada plan Ek XIII Böl. 2 dokümantasyonunun parçasıdır (Ek III değil) | PMS planı, veri kaynakları, gözden geçirme sıklığı | Evet | DOĞRULANDI |
| SM-022 | **Md. 86** | PSUR — Sınıf III'te **en az yıllık**; ısmarlamada **Ek XIII Böl. 2 dokümantasyonunun parçası** | Güncel PSUR, yıllık döngü kanıtı | Evet | DOĞRULANDI |
| SM-023 | **Md. 86(2)** | Sınıf III ve implante edilebilir cihazda PSUR, **Md. 92 elektronik sistemi üzerinden onaylanmış kuruluşa sunulur** | Sunum kaydı, NB değerlendirmesi | Evet | DOĞRULANDI |
| SM-024 | Md. 87 | Ciddi olay ve FSCA bildirimi, süreler | PR16 eşikleri, raporlama süreleri, kayıt | Evet | DOĞRULANDI |
| SM-025 | Md. 88 | Ciddi olmayan olaylarda trend raporlaması | Trend eşiği tanımı ve izleme kaydı | Evet | DOĞRULANDI |
| SM-026 | Md. 10(13) | Olay ve FSCA kayıt/raporlama sistemi | PR16, kayıt taşıyıcısı | Evet | DOĞRULANDI |

## ISO 13485:2016

| Kod | Madde | Şart | Aranan kanıt | Doğrulama |
|---|---|---|---|---|
| SM-030 | §4.1.6 | Yazılım validasyonu (KYS'de kullanılan yazılım) | **Odoo validasyon dosyası** — plan, URS, IQ, OQ, PQ, izlenebilirlik matrisi | DOĞRULANDI |
| SM-031 | §4.2 | Doküman ve kayıt kontrolü | QMS.DKVP.01, GOV.05 sicili, revizyon kontrolü | DOĞRULANDI |
| SM-032 | §5.6 | Yönetimin gözden geçirmesi | YGG girdileri, çıktıları, kaydı | DOĞRULANDI |
| SM-033 | §6.2 | Personel yetkinliği ve eğitimi | Yetkinlik matrisi, eğitim kayıtları | DOĞRULANDI |
| SM-034 | §6.4 | Çalışma ortamı ve kontaminasyon kontrolü | Ortam şartları, temizlik kayıtları | DOĞRULANDI |
| SM-035 | §7.3 | Tasarım ve geliştirme kontrolü | Girdi, çıktı, gözden geçirme, doğrulama, validasyon, transfer, DHF | DOĞRULANDI |
| SM-036 | §7.4 | Satın alma ve tedarikçi kontrolü | Tedarikçi değerlendirme, satın alma bilgisi, giriş doğrulama | DOĞRULANDI |
| SM-037 | §7.5.6 | Üretim süreçlerinin validasyonu | Proses validasyon planı ve raporları, parametre kontrolü | DOĞRULANDI |
| SM-038 | §7.5.8 | Tanımlama ve izlenebilirlik | Lot/seri izlenebilirliği, toz lot yönetimi (PWD-SOP/PWD-LBL) | DOĞRULANDI |
| SM-039 | §7.5.9.2 | İmplante edilebilir cihazda genişletilmiş izlenebilirlik kaydı | Bileşen, malzeme, çalışma ortamı kayıtları | DOĞRULANDI |
| SM-040 | §7.6 | İzleme ve ölçme donanımının kontrolü | Kalibrasyon planı ve kayıtları | DOĞRULANDI |
| SM-041 | §8.2.1 | Geri bildirim ve şikayet ele alma | Şikayet kaydı, değerlendirme, kapanış | DOĞRULANDI |
| SM-042 | §8.2.4 | İç denetim | Denetim programı, denetçi bağımsızlığı, bulgu takibi | DOĞRULANDI |
| SM-043 | §8.3 | Uygun olmayan ürünün kontrolü | Karantina, karar, **ısmarlamada yeniden işleme yasağı** (PR14 §3) | DOĞRULANDI |
| SM-044 | §8.5.2 / §8.5.3 | Düzeltici ve önleyici faaliyet | PR13, PR13-F01, etkinlik doğrulama | DOĞRULANDI |

## Diğer standartlar ve mevzuat

| Kod | Kaynak | Şart | Aranan kanıt | Doğrulama |
|---|---|---|---|---|
| SM-050 | ISO 14971:2019 | Risk yönetimi süreci ve dosyası | Risk yönetim planı, analiz, artık risk, üretim sonrası bilgi (MDR.FR.018) | DOĞRULANDI |
| SM-051 | ISO 10993-1 | Biyolojik değerlendirme stratejisi | Değerlendirme planı, EVD kanıt atıfları, malzeme eşleşmesi | DOĞRULANDI |
| SM-052 | ISO 17664 | Yeniden işleme bilgisi (non-steril teslim) | Temizlik/sterilizasyon talimatı, validasyon dayanağı | ÜRÜN BAZLI |
| SM-053 | ASTM F3001 / F3184 / F2924 vb. | Eklemeli imalat malzeme şartnamesi | Toz şartnamesi, lot sertifikası, kimyasal/mekanik kabul | ÜRÜN BAZLI |
| SM-054 | KVKK / GDPR | Hasta verisinin işlenmesi ve saklanması | Anonimleştirme kuralı, erişim kontrolü, saklama süresi, KVK ailesi | DOĞRULANDI |
| SM-055 | AS9100D §8.1.2 | Konfigürasyon yönetimi | PR29, PR29-L01 | AS9100 KAPSAMI |
| SM-056 | AS9100D §8.1.3 | Ürün güvenliği | PR32 | AS9100 KAPSAMI |
| SM-057 | AS9100D §8.1.4 | Sahte/taklit parça önleme | PR30, tedarikçi kalifikasyonu, tek kaynak kuralı | AS9100 KAPSAMI |
| SM-058 | AS9100D §8.5.1.3 | İlk ürün muayenesi (FAI, AS9102) | PR33, PR33-F01/F02/F03 | AS9100 KAPSAMI |

---

## Doğrulama kaynakları (07.08.2026)

MDR satırları EUR-Lex konsolide metni ve MDCG rehberleriyle
karşılaştırıldı. Doğrulanan ve **önceki taslakta yanlış olan** noktalar:

| Önceki taslak | Düzeltilmiş hali |
|---|---|
| "UDI muafiyeti Md. 27(4)" | **Md. 27(3)** — ayrıca Md. 29(1) Basic UDI-DI muafiyeti eklendi |
| Teknik dosya Ek II/III varsayımı | **Md. 10(5) → Ek XIII Böl. 2**; Ek II/III ısmarlamada uygulanmaz |
| PSUR uygulanabilirliği belirsiz | **Md. 86 uygulanır**, Ek XIII Böl. 2'nin parçası, Sınıf III'te yıllık ve Md. 92 üzerinden NB'ye sunulur |
| Md. 22 sistem/prosedür paketleri | Kapsam dışı bırakıldı — ADDPARK için ilgisiz |
| Aktör kaydı yoktu | **Md. 31 SRN** eklendi — yalnız ısmarlama üreten de kayıtlıdır |
| İmplant kartı "doğrulanacak" | Uygulanır, ancak **Md. 18(3) muafiyet listesi** vida/plaka/tel/pim/klips içerir → ürün bazlı karar |
| Ek XIII Böl. 2 içeriği genel | **§5**: üretim sonrası deneyim + PMCF (Ek XIV Kısım B) + Md. 87(1) bildirimi |

**Hâlâ karar bekleyen (bulgu açılmadan önce kullanıcıya sorulur):**
- SM-007 / SM-008: ADDPARK'ın hangi ürünleri Md. 18(3) muafiyetine
  girer? (CRA, HPV, CMF, TMJ, DEN, SPN, SHL, TLS, KNE tek tek)
- SM-052: hangi ürünler non-steril teslim ediliyor?
- SM-055-058: AS9100 kapsamı hangi ürün/proje hattında geçerli?
