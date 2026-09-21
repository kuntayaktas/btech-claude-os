# BTech-ADD Kütüphane Haritası

Site: `https://btechinnovationas.sharepoint.com/sites/BTech-ADD`

## Kritik uyarı

Kütüphaneler 2026 Temmuz'da onluk blok sistemine göre **yeniden
adlandırıldı**, ancak SharePoint'te URL oluşturma anında sabitlenir.
Görünen ad ile URL farklıdır. Aramada webUrl eski numarayı gösterir —
bu normaldir, hata değildir.

| Görünen ad | URL | driveId |
|---|---|---|
| 10_Kalite | /01_Kalite | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mhu8ziiBbA8RZ_p5dmEzxin` |
| 20_Proje-Basvurulari | /13_ProjeBasvurulari | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10miVCINtMDElTqdVXp5YTA0T` |
| 21_Projeler-Aktif | /02_ProjelerAktif | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mh7wP1xLY6FTYSZ0yih7f-_` |
| 22_Projeler-Arsiv | /03_ProjelerArsiv | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mjvVqWuiANmRYsL-odyUEju` |
| 23_Proje-Mali | /04_ProjeMali | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mj4tmyG7CZzRIRSOcrdMV2Q` |
| 30_Uretim | /05_Uretim | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mgzNLz0waooTZOIcsS_McQN` |
| 31_Satinalma-Tedarik | /06_SatinalmaTedarik | *(bilinmiyor — içinde klasör oluşunca aramayla bul)* |
| 40_Finans | /07_Finans | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mjYIBhyY1CkS7HhgwwkGLzd` |
| 50_IK | /08_IK | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10miu64ds9IIhRJa7bQoMbJf1` |
| 60_Pazarlama-Kurumsal | /09_PazarlamaKurumsal | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mgHaNr7LU1mQ51Da6s-pSLL` |
| 70_IT-Guvenlik | /10_ITGuvenlik | *(bilinmiyor)* |
| 80_Yonetim | /11_Yonetim | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mi2qq6zWcxARYd-nxd5tH_9` |
| 81_Hukuk | /12_Hukuk | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mi-flqZc6txR4H0mE2bh_gQ` |
| 99_Gelen-Kutusu | /99_GelenKutusu | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mh04_RTqgeRTb1Xi_Ek00XL` |

Bilinmeyen driveId için: `sharepoint_folder_search` ile o kütüphanedeki
bir alt klasörü ara, sonuç driveId'yi verir.

## Alt klasör yapıları

**10_Kalite** — 00_Yonetisim · 01_KEK-OEK · 02_Prosedurler · 03_MDR ·
04_KVKK · 05_Denetim · 06_Egitim-Yetkinlik · 07_Tedarikci-Kalite ·
08_Etiket-Sablonlari · 09_ISG · 10_Belgelendirme · 11_Arsiv_Gecmis ·
99_Arsiv-Obsolete

**20_Proje-Basvurulari** — 01_Hazirlanan · 02_Sunulan-Bekleyen · 99_Reddedilen

**21/22_Projeler** — proje kodu klasörleri (`AP{revYY}{MMDD}{NNNN}_{Ad}_{No}`),
her birinde 7 alt klasör: 01_Basvuru-Sozlesme · 02_Teknik-Calisma ·
03_Raporlar-Donemsel · 04_Yazisma-Toplanti · 05_Ciktilar-Yayin ·
06_Tedarik-Talep · 07_Kapanis

**30_Uretim** — 01_Uretim-Kayitlari · 02_Proses-Parametreleri ·
03_Kalifikasyon-ve-Validasyon · 04_Kalibrasyon · 05_Bakim-ve-Ariza ·
06_Sarf-ve-Toz-Takibi · 07_Ardil-Islem · 08_Muayene-ve-Test ·
09_Uygunsuzluk-ve-Karantina · 10_Uretim-Planlama · 99_Arsiv

**40_Finans** — 01_Mali-Tablolar · 02_Butce-ve-Planlama · 03_Banka-ve-Kredi ·
04_Vergi-ve-Beyanname · 05_Fatura-ve-Cari · 06_Tesvik-ve-Hibe-Takibi ·
07_Sigorta · 08_Maliyet-Muhasebesi · 09_Bagimsiz-Denetim-ve-YMM · 99_Arsiv

**50_IK** — 01_Ozluk-Dosyalari · 02_Is-Sozlesmeleri · 03_Bordro-ve-Ozluk-Haklari ·
04_Egitim-ve-Yetkinlik · 05_Ise-Alim-ve-Aday · 06_Performans-ve-Degerlendirme ·
07_Izin-ve-Devam · 08_Zimmet-ve-Demirbas · 09_ISG-ve-Saglik ·
10_IK-Politika-ve-Prosedur · 11_Gorev-Tanimlari · 12_Isten-Ayrilis · 99_Arsiv

**60_Pazarlama-Kurumsal** — 01_Marka-Kimlik · 02_Kurumsal-Sunumlar ·
03_Gorsel-Arsiv · 04_Web-Icerik · 05_Sosyal-Medya · 06_Fuar-Etkinlik ·
07_Basin-PR · 08_Pazar-Arastirma · 09_Plan-ve-Strateji ·
10_Egitim-ve-Danismanlik · 98_NAS-Devir-Kuyrugu

**80_Yonetim** — 01_Yonetim-Kurulu · 02_Yonetim-Raporlari ·
03_Strateji-ve-Is-Plani · 04_Organizasyon-ve-Yetki · 05_Ortaklik-ve-Sermaye ·
06_Yatirimci-ve-Data-Room · 07_Kurumsal-Referans

**81_Hukuk** — 01_Sozlesmeler · 02_Sablonlar · 03_Dava-ve-Ihtilaf ·
04_Fikri-Mulkiyet · 05_Mevzuat-Takibi · 06_KVKK-Hukuki ·
07_Kurumsal-Islemler · 08_Sirket-Belgeleri · 99_Arsiv

## NAS sınırı

Ham çekim, video kaynak dosyası, PSD/AI/INDD çalışma dosyası, 3D model ve
CAD SharePoint'e konmaz — NAS'a gider. Kayıt:
`60_Pazarlama-Kurumsal/98_NAS-Devir-Kuyrugu/DMS.NAS.01_NAS-Devir-Sicili_R00.md`

NAS henüz kurulmadı; bu tür içerik gelirse `02_Karar-Bekleyen`'e al ve
sicile satır ekle.


## Site ve drive kimlikleri — doğrulama yöntemi (08.08.2026)

Tüm kütüphanelerin driveId listesi tek çağrıyla alınır:

```
read_resource drive:///sites/btechinnovationas.sharepoint.com,8cf70cf4-b4cd-47a2-97c4-a88b0975690b,78c201fa-6a07-4bd5-9bbc-c49d06b5d268
```

(Site GUID'leri, bilinen bir driveId'nin `b!` sonrası kısmı base64url
çözülüp 16'lık üç GUID'e ayrılarak bulundu.)

**Görünen ad ≠ drive adı.** Sol menüde `81_Hukuk` yazan kütüphanenin drive
adı `12_Hukuk`, `10_Kalite` yazanın adı `01_Kalite`'dir.

| Kütüphane | driveId | Durum |
|---|---|---|
| `01_Kalite` (menü: 10_Kalite) | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mhu8ziiBbA8RZ_p5dmEzxin` | doğrulandı |
| `12_Hukuk` (menü: 81_Hukuk) | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mi-flqZc6txR4H0mE2bh_gQ` | doğrulandı |
| `99_Gelen-Kutusu` | `b!9Az3jM20okeXxKiLCXVpC_oBwngHatVLm7zEnQa10mh04_RTqgeRTb1Xi_Ek00XL` | drive listesinden, okumayla doğrulanmadı |

Klasör itemId'leri: `01_Kalite/00_Yonetisim` = `01NQZXAHBSJCAZ2FRK7NAYMX23E2EWJVMP` ·
`12_Hukuk/02_Sablonlar` = `01NQZXAHC2ZKB3CVJ7A5A2S4OH6CNLCRWZ`

## TUZAK — klasör listelemesinde itemId bir kayık gelir

`read_resource` ile bir KLASÖR listelendiğinde bir dosyanın itemId'si,
listede **bir sonraki dosyanın adından sonra** yazılan değerdir. DRIVE
listelemesinde (`drive:///sites/...`) bu kayıklık YOKTUR.

Kural: itemId ada güvenilerek kullanılmaz. Yazmadan önce dosya okunup
içeriği doğrulanır; yazma sonrası dönen `webUrl`'deki dosya adı kontrol
edilir. Bu tuzak 08.08.2026'da üç yanlış tespite yol açtı.
