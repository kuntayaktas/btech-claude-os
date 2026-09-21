# Uyum Kontrol Listesi

## Referans belgeler — nereye bakılacak

Kalite kütüphanesinin **gerçek URL yolu `01_Kalite`'dir.** GOV.05 sicilinin
`Kütüphane` kolonu tarihsel olarak `10_Kalite` yazar; aşağıda gerçek yol
kullanılmıştır. (Doğrulandı 08.08.2026.)

| Konu | Belge | Konum |
|---|---|---|
| Rol, yetki, vekalet, imza | OEK Organizasyon El Kitabı | 01_Kalite/01_KEK-OEK |
| **İmza ve yetki matrisi** | **GOV.08** | **01_Kalite/00_Yonetisim** |
| Doküman kontrolü, onay matrisi | PR01 (Rev08) | 01_Kalite/02_Prosedurler |
| Personel, yetkinlik | PR04 + PR04.ORSE | 01_Kalite/02_Prosedurler |
| Güncel belge sürümleri | GOV.05 — **altı CSV**, aşağıya bak | 01_Kalite/00_Yonetisim |
| Teknik dosya içeriği | MDR.TF.TOC | 01_Kalite/03_MDR |
| **Bilgi sınıflandırma (gizlilik)** | **GOV.04** + özeti DMS.REF.01 | **01_Kalite/00_Yonetisim** |
| **KVKK — CRM/pazarlama verisi** | **KVK.09** | **01_Kalite/04_KVKK** |
| **KVKK — saklama ve imha** | **KVK.03** | **01_Kalite/04_KVKK** |
| **KVKK — veri sahibi başvurusu** | **KVK.16** | **01_Kalite/04_KVKK** |
| Organizasyon | ORG.SEM.01 / ORG.SEM.02 | 80_Yonetim/04_Organizasyon-ve-Yetki |
| Adlandırma | DMS.STD.02 **Rev02** | **01_Kalite/00_Yonetisim** |
| Metaveri kolonları | DMS_MIG_01_EK3 **R02** | **01_Kalite/00_Yonetisim** |
| Marka, antet, renk | MK.01 Marka Kılavuzu **Rev02** | 60_Pazarlama-Kurumsal/01_Marka-Kimlik |
| Sözleşme adlandırma | _Sozlesme-Isimlendirme-Sistematigi | 81_Hukuk/01_Sozlesmeler |
| Hukuk şablonları | LGL.{nn} — LGL.01 NDA, LGL.02 Feragatname, LGL.03 İş Geliştirme/Aracılık/Yetkili Satıcı DOLU | 81_Hukuk/02_Sablonlar |

DMS.STD.02 ve DMS_MIG_01_EK3'ün eski konumu `21_Projeler-Aktif/00_Migrasyon-Sicili`
olarak yazılıydı; **bu konum geçersizdir**, ikisi de yönetişim klasöründedir.

### GOV.05 tek dosya değildir

`01_Kalite/00_Yonetisim` altında altı CSV + bir harita dosyası vardır:
`GOV.05_EK1_Sicil_Yonetisim-DMS-Referans` · `EK2_QMS-Prosedurler-BT-Denetim` ·
`EK3_MDR-Teknik-Dosya-ve-Etiket` · `EK4_KVKK-ve-Hukuk` · `EK5_IK-ve-Idari` ·
`EK6_Pazarlama-IT-Uretim` · `GOV.05_IDX_Sicil-Haritasi.md`

**Tasnif doğrudur.** (Bir önceki sürümde "dosya adları içerikle uyuşmuyor"
yazıyordu — GERİ ALINDI.) Sebep, klasör listelemesinde itemId'lerin bir kayık
gelmesiydi: bir dosyanın itemId'si, listede **bir sonraki dosyanın adından
sonra** yazılan değerdir. Bir kodun varlığını doğrulamak için ilgili EK dosyası
okunur ve **içeriğinin beklenen aile ile eşleştiği teyit edilir**; itemId ada
güvenilerek kullanılmaz.

`GOV.05-IDX` (Sicil Haritası, R01) hangi ailenin hangi dosyada olduğunu
gösterir ve sicile dokunmadan önce okunur.

### MK.01 Rev02 ile değişenler (denetimde sık kaçan)

| Öğe | Doğru değer |
|---|---|
| Slogan | `Redefining the Possible` — eski `Advanced Engineering · Additive Manufacturing` değil |
| Marka yazımı | `ADDPARK` — `AddPark` yazımı YASAK |
| Logo rengi | Turkuaz `#00C9C6` (08.08.2026 kararı; MK.01 metni hâlâ lacivert diyor) |

### Gizlilik sınıfı — DÖRT SINIF (GOV.05-IDX R01)

`G` genel · `İ` iç · `K` kısıtlı · **`Ö` hizmete özel**

**`T` diye bir sınıf yoktur.** DMS.REF.01 kartındaki `H/İ/T/G/S` listesi
sicilde kullanılmıyor ve kartın revize edilmesi gerekiyor. Belgede `T`
görülürse **bulgudur (Minor)**.

Ö sınıfı belge yalnız `80_Yönetim`, `81_Hukuk` veya `50_IK` içinde durabilir,
adı geçen kişiler dışına dağıtılmaz ve üzerinde "HİZMETE ÖZEL" ibaresi
bulunmalıdır. Karşı tarafa verilecek sözleşme/şablonlar `K`'dır.

## MDR 2017/745 — sık kontrol edilen maddeler

| Madde | Konu | Kontrol |
|---|---|---|
| Md.10 | Üretici yükümlülükleri | Sorumluluk devredilemez; dış kaynak kullanımı yükümlülüğü kaldırmaz |
| Md.15 | PRRC | Yetkinlik kanıtlı mı; baskı altında olmayacak konumda mı; küçük işletmede sürekli emirde bulundurma yazılı mı |
| Md.15(3)(a) | Serbest bırakma | PRRC uygunluğu **doğrular**, serbest bırakma kararı ayrı fiildir |
| Md.21 + Ek XIII | Ismarlama cihaz beyanı | Yalnız yasal üretici imzalar |
| Md.31 | EUDAMED | SRN kaydı, PRRC bilgisi güncel mi |
| Md.83-86 | PMS | Plan sahibi üretici |
| Md.87-92 | Vijilans | Bildirim süreleri 2-15 gün; yetki devredilemez, ama **vekalet tanımlı olmalı** |
| Md.10(8) | Arşiv | Son cihazdan sonra asgari 15 yıl |

## ISO 13485:2016

| Madde | Kontrol |
|---|---|
| §4.1.5 | Dış kaynaklı süreçler kalite sisteminde tanımlı mı |
| §4.2.4 | Doküman kontrolü — aynı kişi hazırlayıp onaylamamalı |
| §4.2.5 | Kayıt kontrolü — saklama süresi belirli mi |
| §5.5.2 | QMR üst yönetimce atanmış mı, sorumlulukları tanımlı mı |
| §6.2 | Personel yetkinliği kanıtlı mı |
| §7.3 | Tasarım kontrolü — girdi, çıktı, doğrulama, validasyon, transfer |
| §7.4 | Satın alma ve tedarikçi kontrolü |
| §8.5.2 | Düzeltici faaliyet — kök neden analizi var mı |

## KVKK 6698

| Konu | Kontrol |
|---|---|
| Md.6 özel nitelikli veri | Sağlık, adli sicil, sendika, biyometrik — açık rıza veya kanuni dayanak var mı |
| Amaçla sınırlılık | Veri gerektiğinden fazla tutuluyor mu (örn. aday özgeçmişleri) |
| Süre sınırlılığı | Saklama süresi tanımlı mı |
| Aydınlatma | Aydınlatma metni ve rıza formu mevcut mu |
| VERBIS | Kayıt yükümlülüğü değerlendirilmiş mi |

Belgede kişisel veri varsa erişim modeli de kontrol edilmeli — belge doğru
ama yanlış yerde durursa KVKK ihlali olur.

## 4857 İş Kanunu ve 6331 İSG

| Konu | Kontrol |
|---|---|
| Md.75 | Özlük dosyası zorunlu içeriği tam mı |
| Saklama | Özlük 10 yıl, ISG kayıtları 15 yıl (bazı risk gruplarında 40) |
| 6331 Md.15 | Sağlık kayıtlarına erişim işyeri hekimiyle sınırlı; işveren yalnız uygunluk sonucunu bilir |

## TTK

| Madde | Kontrol |
|---|---|
| Md.370, 371 | Temsil ve ilzam yetkisi — ticaret siciline tescil edilmiş mi |
| Md.395 | Şirketle işlem yapma yasağı — ortak yönetimli şirketler arası sözleşmede değerlendirilmeli |
| Md.375 | Yönetim kurulunun devredilemez görevleri |

Vekaletname ile tescilli temsil yetkisi aynı şey değildir. Üçüncü taraflar
imza sirkülerine bakar.

## Bilinen tuzaklar

**İki tarafı aynı kişi imzalıyor.** Ortak yönetimli şirketler arası
sözleşmelerde "ayrı tüzel kişilik, arm's-length" beyanı varsa, imza
düzeyinde de korunmalıdır.

**Beş imza zinciri dörde iniyor.** İmza zincirinde iki rol aynı kişideyse
bağımsız kontrol katmanı kaybolur. Zincirdeki her rol farklı gerçek kişi
olmalıdır.

**Belge kendi hakkında yanlış beyanda bulunuyor.** OEK Rev07 "vekalet
matrisi bu el kitabında belgelenir" diyordu ama matris belgede yoktu.
Belge bir şeyin içinde olduğunu söylüyorsa, gerçekten var mı bak.

**Aynı kod, aynı revizyon, farklı içerik.** MDR.TF.TOC R01 adıyla iki
farklı belge dolaşıyordu. Yeni belge yayınlamadan önce kodun ve revizyonun
benzersiz olduğunu doğrula.

**TBD yer tutucular.** Denetçiye sunulan belgede "[TBD]" kalmışsa bu tek
başına bulgu üretir.
