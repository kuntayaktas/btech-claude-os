# PROJE: Satış-Pazarlama (pilot)

## Kapsam
Beş şirketin satış ve pazarlama sistemi; pilot ve varsayılan bağlam **BTech**. Şirket belirtilmezse BTech kabul edilir; Addpark/Trabtech/Earfit/Vimics açıkça adlandırılır.

## Şirket ayrımı
| Şirket | Ana platform | Huniler | Notlar |
|---|---|---|---|
| BTech | LinkedIn = Instagram; YouTube açılacak; dental yalnız Instagram (formdent3d.btech) | Huni A gelen (site/form/fuar) · Huni B outbound (BLT metal, Fuse X1, yazılım, toz) | Servis-bakım Apollo dışı (Odoo/Mailjet) |
| Addpark | LinkedIn (Instagram ikincil) | Savunma, medikal, endüstriyel hizmet | Kamuya açık beyan sınırları MKT.TRM.01 |
| Trabtech | LinkedIn | Medikal | MDR nedeniyle site chatbot yok |
| Earfit / Vimics | Instagram | — | Kendi Google/Meta hesapları açılacak |

## Veri kaynakları ve sorgu kuralları
- **Odoo CRM/Satış (MCP):** kanal, huni ve kayıp analizi HER ZAMAN `active in [true,false]` ile; kapsam tabloda yazılır. BTech ticari taban `sale.order` + `company_id = 1` (`team_id` filtresi iki ekibi dışarıda bırakır).
- **Supermetrics:** GA4 (BTech 442511700 · Formdent3D 529759234 · Earfit 553050724), Google Ads 3033140182, Meta Ads (BTech act_345248075160631 · Earfit act_1017925979485837; kişisel hesap act_1548226188730375 şirket raporlarında DIŞARIDA). Reklam ve web verisi buradan; Excel'e elle yazılmaz.
- **Metricool:** yalnız sosyal yayın/analitik, Europe/Istanbul.
- **Apollo:** ICP ve Context Center aktif; mailbox/domain (btechgroup.co) kurulana kadar dizi pasif. Kredi harcayan her işlem öncesi onay.
- **Kontrollü belgeler:** `MK.TKP.01` ve `SAT.TKP.01` Excel'leri resmî kayıt; Supermetrics/Odoo hamdır. Belge seti SET.01 → BTE.MK.09 (durum), BTE.MK.PLN.01, GRP.MK.SYS.01, BTE.MK.ISL.01, GRP.MK.GRS.01, GRP.MK.ILT.01, GRP.MK.VRI.01.
- Bilinen ölçüm arızası: GA4 dönüşüm izleme Şubat 2026'dan beri 0 (form_submit tanımsız). Dönüşüm rakamı verilirken bu not düşülür.

## Sabit kurallar
- Tekil olay kanıt değildir: kanal "kanıtlanmış" için 3 tekrar veya 2 dönem.
- Meta'da yalnız lead hedefli kampanya; CPL 250 ₺ üstü set durdurulur.
- E-posta şirket adına, kişisel imza yok, olay tetikli, kişi başı ayda en fazla 2. Apollo (soğuk, btechgroup.co) ve Mailjet (izinli, news subdomain) ayrı hatlardır; karışmaz.
- İçerik %70 açık / %30 kapılı; 2027 makaleleri Kuntay Aktaş imzalı, kişisel post şirket postundan önce.
- Pazarlama planı üç slot: S1 sabit %50, S2 dönemsel %25, S3 veri güdümlü %25 (boş bırakılır). Aksiyon sicili ayda en fazla 5.
- Sosyal görsel: 1080×1350 ana kanvas, 6 arketip, BTech ana tema mavi+sarı+siyah; şablon kaynağı Canva brand templates.

## Standart çıktılar
1. **Haftalık sinyal raporu** (Pazartesi): Odoo pipeline hareketi + site niyet sinyalleri + reklam sapmaları → en fazla 5 aksiyon önerisi.
2. **Aylık kapanış:** ham veri ↔ kontrollü Excel mutabakatı, sapma listesi, K-numaralı karar önerileri.
3. **Pipeline açığı tespiti** → o ürün için hedef şirket listesi + Apollo kişi önerisi + kampanya taslağı; yürütme onaya bağlı.
Her rapor: kaynak, kapsam filtresi ve veri tarihi tabloda yazılır.

## Proje bilgisine eklenecek belgeler
GRP.MK.SYS.01 · GRP.MK.VRI.01 · BTE.MK.PLN.01 · BTE.MK.09 Rev01 · MKT.TRM.01 (Addpark terminoloji) · MK.01 Rev02 marka kılavuzu (özet)
