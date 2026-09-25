---
name: addpark-research-no-internet
description: ADDPARK kurumsal bilgi tabanında (yalnızca BTech-ADD SharePoint sitesi) kapalı devre araştırma yapar; internete hiç çıkmaz, başka SharePoint sitesine veya OneDrive'a girmez, genel bilgiyle boşluk doldurmaz, her cümlesini belgeye referanslar. Sicilde bulamazsa tüm kütüphaneleri klasör klasör komple tarar. Kullanıcı "addpark research", "addpark araştır", "internete çıkma", "sistemden bul", "kendi verilerimizde ara", "bizde var mı", "hangi belgede yazıyor", "sharepointte ara", "kalite sisteminde ne diyor", "komple tara" dediğinde MUTLAKA bu skill'i kullan. Bir belgenin varlığı, revizyonu, konumu veya içeriği sorulduğunda; iki belge çelişiyor mu denildiğinde; ya da başka bir Addpark skill'i (dokuman-denetle, dokuman-yayinla, gelen-kutusu-isle, mdr-case-create) mevcut duruma bakmak zorunda kaldığında bu kuralları uygula. ADDPARK araştırmalarında VARSAYILAN skill budur — kullanıcı açıkça dış kaynak istemedikçe addpark-research-with-internet yerine bunu kullan.
version: 1.0
---

# ADDPARK Kapalı Devre Araştırma (İnternetsiz)

Bu skill'in tek işi: **ADDPARK'ın kendi belgelerine bakıp, kaynağını
gösterebildiği şeyi söylemek; gösteremediği şeyi söylememek.**

Bu bir arama aracı değil, bir **kanıt zinciri** aracıdır. Çıktı denetimde,
mevzuat yazışmasında ve yönetim kararında kullanılacaktır. Kaynaksız tek
bir cümle bile çıktıyı kullanılamaz hale getirir.

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

## Dört mutlak kural

**1. TEK KAYNAK: BTech-ADD.**
`https://btechinnovationas.sharepoint.com/sites/BTech-ADD`
Site GUID `8cf70cf4-b4cd-47a2-97c4-a88b0975690b`.
Her sonucun `webUrl` alanı `/sites/BTech-ADD/` içermelidir. İçermiyorsa
sonuç **atılır**, cevapta kullanılmaz, kullanıcıya "kapsam dışı bir
konumda benzer bir dosya göründü" diye bile aktarılmaz.

**2. İNTERNET YOK.**
`web_search`, `web_fetch` ve benzeri hiçbir dış kaynak aracı bu skill
çalışırken kullanılmaz. Kullanıcı internete de bakılmasını isterse
`addpark-research-with-internet` skill'ine geçildiğini söyle — ikisi
aynı cevabın içinde karıştırılmaz.

**3. UYDURMA YOK.**
Belgeden okunmayan hiçbir sayı, tarih, kod, revizyon, isim veya cümle
çıktıya girmez. Bulunamayan şeyin cevabı **"bulunamadı"**dır. Bu bir
başarısızlık değil, geçerli ve çoğu zaman en değerli bulgudur.

**4. SİCİL SON SÖZ DEĞİL — TAM TARAMA VAR.**
Sicilde (GOV.05) bulunamayan konu, tüm kütüphaneler klasör klasör
taranmadan "yok" diye raporlanamaz. Protokol: `references/tam-tarama.md`

Kapsam dışı bırakılan konumların tam listesi: `references/kapsam-ve-kaynaklar.md`

## Akış

1. **Soruyu ayrıştır.** Ne soruluyor: belge var mı · içerik ne diyor ·
   revizyon/konum ne · iki belge çelişiyor mu · bir konuda elde ne var.
2. **Sicilden başla.** `10_Kalite/00_Yonetisim/01_Sicil-ve-Kayitlar/` —
   önce `GOV.05_IDX_Sicil-Haritasi.md`, sonra ilgili `GOV.05_EK{n}` CSV
   (EK1–EK7, `;` ayraçlı, 12 kolon). Tek dosyalı eski sicil
   (`GOV.05_EK1_Master_Dokuman_Sicili.csv`) 17.09.2026'da arşive alındı,
   kullanılmaz.
3. **Sicili ASLA tek başına doğru kabul etme.** Sicil geride kalabilir
   (PR ve KEK aileleri gerçekte Rev07 iken sicilde 00 yazıyordu) ve
   hayalet kayıt taşıyabilir (PR29/30/32 "YAYIN" görünürken belge yoktu).
   Sicil bir **indeks**tir, kanıt değil. Kanıt dosyanın kendisidir.
4. **Hedefli ara.** Arama katmanları: `references/arama-stratejisi.md`
5. **Çıkmazsa TAM TARAMA.** Sicil + 3 terim varyantı + beklenen kütüphane
   listelemesi boş döndüyse tam taramaya geç — `references/tam-tarama.md`.
   Bu adım opsiyonel değildir.
6. **Belge içinden oku.** Revizyon, tarih ve içerik **belgenin içinden**
   teyit edilir; dosya adı ikincil kanıttır. (ADDPARK yazılı kararı:
   belge içi bilgi esastır.)
7. **Çelişkileri bastırma, raporla.** Sicil ≠ dosya adı ≠ belge içi
   durumu ortaya çıkarsa üçünü de göster ve hangisinin esas olduğunu
   kurala dayandır.
8. **Çıktıyı formatla.** `references/cikti-formati.md`

## Etiketleme — her satır bir etiket taşır

| Etiket | Anlamı | Zorunlu |
|---|---|---|
| `[KAYIT]` | Belgeden doğrudan okundu | Kaynak künyesi |
| `[KAYIT — ARŞİV]` | Arşiv/SUPERSEDED belgeden okundu | Künye + yürürlükte olmadığı notu |
| `[ÇIKARIM]` | Birden fazla belgeden türetildi | Tüm dayanak kaynaklar |
| `[BULUNAMADI]` | Arandı, kapsamda yok | Tarama kapsamı |

Beşinci kategori yoktur. Bir bilgi bunlardan birine girmiyorsa çıktıya
girmez.

**Genel bilgi (mevzuat metni, standart maddesi, sektör pratiği) cevabın
gövdesine giremez.** Gerekliyse en sona, `> Kapsam dışı not:` bloğuyla,
"bu ADDPARK belgesinden değil, benim genel bilgimden" ibaresiyle ayrı
yazılır. Kullanıcı istemiyorsa hiç yazılmaz.

## Kaynak künyesi

`[KOD Rev · Kütüphane/Klasör/Dosya-adı · konum]`

Örnek:
`[PR33 Rev00 · 10_Kalite/02_Prosedurler/PR33_ADDPARK_Ilk_Urun_Muayenesi_Proseduru_Rev00.docx · §5.5]`

Sayfa/madde/satır numarası biliniyorsa yazılır, bilinmiyorsa künye
dosya seviyesinde kalır — uydurulmuş madde numarası künyeyi geçersiz kılar.

## Bilinen tuzaklar

- **Görünen ad ≠ URL.** 10_Kalite'nin URL'i `/01_Kalite`. Cevapta
  **görünen ad** kullanılır. Eşleme: `references/kapsam-ve-kaynaklar.md`
- **`read_resource` xlsx'te bozuk çıktı verir.** Bozuk çıktıdan veri
  okuma; "dosyayı yükleyin" de. CSV ve docx sorunsuz.
- **Sicilde kayıtlı olmayan belgeler var.** Bu normaldir — tam taramanın
  varlık sebebi budur.
- **Boş kütüphane aramada görünmez.** "Belge yok" sonucuna yalnız
  listelemeyle varılır, aramayla değil.
- **Hasta verisi, CAD ve askeri gizlilik dereceli içerik SharePoint'te
  değildir** (ERP/NAS'ta). Bunlarda "bulunamadı" eksiklik değil,
  mimarinin gereğidir — belirt.

## Bitirme kuralı

Cevabı vermeden önce her satır için sor: *bu cümlenin kaynağını
gösterebiliyor muyum?* Gösteremediğin satırı sil. Cevap kısalıyorsa
kısalsın — eksik ama doğru cevap, tam ama uydurulmuş cevaptan iyidir.

Araştırma sonunda **her zaman** şunu yaz:

- Taranan konumlar (hangi kütüphane tam, hangisi kısmi, hangisi hiç)
- Bulunamayanlar (neye bakıldı, çıkmadı)
- Tarama sırasında bulunan **sicilde kayıtsız belgeler** (varsa)
- Cevabı değiştirebilecek erişilemeyen kaynak (varsa)
