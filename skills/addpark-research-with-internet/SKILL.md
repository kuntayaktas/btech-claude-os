---
name: addpark-research-with-internet
description: ADDPARK kurumsal bilgi tabanında (BTech-ADD SharePoint sitesi) araştırma yapar ve gerektiğinde interneti de kullanır; iç kaynak ile dış kaynağı asla karıştırmaz, her ikisini de ayrı etiketle ve künyeyle referanslar, uydurma yapmaz. Sicilde bulamazsa önce tüm kütüphaneleri klasör klasör komple tarar, ancak ondan sonra internete çıkar. Kullanıcı "addpark research with internet", "internetle araştır", "dışarıya da bak", "internetten de kontrol et", "mevzuatı da tara", "standart ne diyor", "piyasada durum ne", "rakipler ne yapıyor" gibi AÇIKÇA dış kaynak istediğinde bu skill'i kullan. Kullanıcı dış kaynak istemiyorsa veya sadece "addpark research" diyorsa addpark-research-no-internet skill'ini kullan — varsayılan odur. Ayrıca ADDPARK belgesini bir dış referansla (MDR, ISO 13485, AS9100D, harmonize standart, tedarikçi teknik verisi) karşılaştırmak gerektiğinde bu skill'i kullan. Sadece ADDPARK / BTech-ADD ortamı için geçerlidir.
version: 1.0
---

# ADDPARK Araştırma (İnternet Erişimli)

`addpark-research-no-internet` ile **aynı kanıt disiplinine** tabidir.
Tek farkı: iç kaynak tükendikten sonra dış kaynağa çıkabilir.

Ek olarak taşıdığı risk: iç veri ile dış verinin karışması. Karışmış bir
cevap, denetimde ADDPARK'ın kendi kaydı gibi görünüp aslında internetten
gelmiş bir iddia taşır. **Bu skill'in asıl işi bu karışmayı önlemektir.**

## ARAMA KORLUGU — ZORUNLU (09.08.2026)

Bu sitede `sharepoint_search` ve `sharepoint_folder_search` bazi kutuphaneleri
HIC dondurmuyor; arac hata vermez, sessizce bos doner. Dogrulanmis kor noktalar:
`20_Proje-Basvurulari` tamami ve `10_Kalite/00_Yonetisim` tamami.

**"Arama bos dondu" ASLA "belge yok" demek degildir.** `[BULUNAMADI]` bloku
yalniz dogrudan klasor listelemesinden sonra yazilabilir.

Zorunlu sira: `IDX.01_Kutuphane-ve-Klasor-Haritasi.csv` oku ->
`drive:///sites/8cf70cf4-b4cd-47a2-97c4-a88b0975690b` ile kutuphane listesi ->
`file:///{driveId}/root` ile listele -> kutuphane kokundeki `_KLASOR-REHBERI.md`
oku -> ancak sonra arama.

Proje ve basvuru sorularinin sicili GOV.05 DEGIL,
`10_Kalite/00_Yonetisim/PRJ.01_EK1_Proje_ve_Basvuru_Sicili.csv`'dir.

Ayrinti: `references/kapsam-ve-kaynaklar.md` bolum 0.

## Beş mutlak kural

**1. İÇ KAYNAK ÖNCE, HER ZAMAN.**
Hiçbir soruda internetle başlanmaz. Sıra: sicil → hedefli arama →
tam tarama → *ancak sonra* internet. İç kaynakta cevap varsa dış kaynağa
hiç çıkılmaz.

**2. İÇ VE DIŞ ASLA KARIŞMAZ.**
Cevap iki ayrı bölümde verilir:
`## İç kaynak (ADDPARK belgeleri)` ve `## Dış kaynak (internet)`.
Aynı paragrafta, aynı cümlede, aynı madde işaretinde iki kaynak türü
bulunamaz. Sentez gerekiyorsa üçüncü bölüm açılır:
`## Karşılaştırma` — ve orada her satır hangi taraftan geldiğini gösterir.

**3. İÇ KAYNAK, ADDPARK GERÇEKLERİNDE ÜSTÜNDÜR.**
ADDPARK'ın ne yaptığı, neye sahip olduğu, hangi prosedürü uyguladığı
konusunda **tek geçerli kaynak kendi belgeleridir.** İnternet bunları
doğrulayamaz, çürütemez, tamamlayamaz. Dış kaynak yalnız şunlar için
kullanılır: mevzuat/standart metni, üçüncü taraf teknik verisi, pazar
ve rakip bilgisi, tedarikçi/kurum duyurusu.

**4. TEK İÇ KAYNAK: BTech-ADD.**
`https://btechinnovationas.sharepoint.com/sites/BTech-ADD`
(Site GUID `8cf70cf4-b4cd-47a2-97c4-a88b0975690b`). İnternet serbest
olması, **diğer SharePoint sitelerini ve OneDrive'ı serbest bırakmaz** —
onlar hâlâ kapsam dışıdır. Detay: `references/kapsam-ve-kaynaklar.md`

**5. UYDURMA YOK — HER İKİ TARAFTA DA.**
İç kaynakta künye, dış kaynakta URL. Kaynağı gösterilemeyen cümle
silinir. "Genel olarak bilinir ki" ile başlayan hiçbir ifade çıktıya
girmez.

## Akış

1. **Soruyu ikiye ayır.** Hangi kısmı ADDPARK verisi gerektiriyor,
   hangi kısmı dış referans? Bu ayrım baştan yapılır, sonradan değil.
2. **İç kaynak turu.** Sicil → hedefli arama → tam tarama
   (`references/arama-stratejisi.md`, `references/tam-tarama.md`).
   Tam tarama atlanamaz; internet, tam taramanın yerine geçmez.
3. **İç kaynak yeterliyse dur.** Cevabı ver, dışarı çıkma.
4. **Dış kaynak turu** (yalnız gerekiyorsa). Kural:
   - Birincil kaynak tercih edilir: mevzuat yayıncısı (EUR-Lex),
     standart kuruluşu, üreticinin kendi sitesi, resmî kurum duyurusu
   - Blog, forum, içerik çiftliği ve tarihsiz sayfa kullanılmaz
   - Her iddiada URL + erişim tarihi verilir
   - Standart metninin tam maddesi paralı/erişilemezse bu **söylenir**,
     hatırdan yazılmaz
5. **Karşılaştırma bölümü** (varsa). ADDPARK belgesi ile dış referans
   arasındaki uyum/boşluk burada gösterilir; her satır iki künye taşır.
6. **Çıktıyı formatla.** `references/cikti-formati.md`

## Etiketleme

| Etiket | Anlamı | Zorunlu |
|---|---|---|
| `[KAYIT]` | ADDPARK belgesinden okundu | Kaynak künyesi |
| `[KAYIT — ARŞİV]` | Arşiv/SUPERSEDED belgeden | Künye + yürürlükte değil notu |
| `[ÇIKARIM]` | Birden fazla ADDPARK belgesinden türetildi | Dayanak kaynaklar |
| `[BULUNAMADI]` | İç kaynakta arandı, yok | Tarama kapsamı |
| `[DIŞ KAYNAK]` | İnternetten alındı | URL + yayıncı + tarih |
| `[DIŞ — DOĞRULANAMADI]` | İnternette bulundu ama birincil kaynağa inilemedi | URL + neden doğrulanamadığı |

`[DIŞ KAYNAK]` etiketli hiçbir satır, ADDPARK'ın kendi durumu hakkında
iddia taşıyamaz. Taşıyorsa etiket yanlıştır ve satır silinir.

## Kaynak künyeleri

İç: `[PR33 Rev00 · 10_Kalite/02_Prosedurler/PR33_..._Rev00.docx · §5.5]`
Dış: `[EUR-Lex · MDR 2017/745 Ek XIII · eur-lex.europa.eu/... · erişim 01.08.2026]`

Künye biçimi bakılarak kaynağın hangi taraftan olduğu anlaşılmalıdır.

## Çelişki yönetimi

| Durum | Karar |
|---|---|
| ADDPARK belgesi ile mevzuat/standart çelişiyor | **Bulgu olarak raporla.** Mevzuat üstündür ama belgeyi düzeltme kararı kullanıcınındır. "Belgemiz yanlış" demeden önce doğru maddeyi birincil kaynaktan teyit et |
| ADDPARK belgesi ile internetteki üçüncü taraf bilgisi çelişiyor (örn. malzeme verisi) | ADDPARK belgesi esastır; dış veri "karşılaştırma" olarak sunulur |
| İnternette ADDPARK hakkında bilgi bulundu (web sitesi, haber, LinkedIn) | Kurumsal kayıt değildir. `[DIŞ KAYNAK]` etiketiyle ve "dış görünüm, iç kayıt değil" notuyla verilir |
| İki dış kaynak çelişiyor | İkisini de göster, birincil olanı işaretle, karar verme |

## Bitirme kuralı

Cevabın sonunda **her zaman**:

- İç tarama kapsamı (hangi kütüphane tam / kısmi / hiç)
- İç kaynakta bulunamayanlar
- Kullanılan dış kaynaklar listesi (URL + tarih)
- Dış kaynakta doğrulanamayanlar
- Tarama sırasında bulunan sicilde kayıtsız belgeler (varsa)

Kullanıcı "sadece bizim verilerimiz" derse bu skill durur, cevap
`addpark-research-no-internet` kurallarıyla verilir.
