# btech-claude-os

BTech Grup'un Claude işletim sistemi: skill'ler, Proje talimatları, zamanlanmış görev istemleri, n8n akışları ve mimari kararlar için **tek doğruluk kaynağı**.

Amaç: şirketin farklı yerlerinde üretilen bilgiyi toparlamak, kurumsal hafıza oluşturmak, standartlaştırmak, raporlamayı ve iş akışlarını otomatikleştirmek, rapor sonrası karar önerisi üretmek.

## Neden bu depo var
Skill'ler daha önce yalnız yerel zip'lerde tutuldu ve iki skill (`capa-hazirla`, `kalite-dokuman-yaz`) geri dönülmez şekilde kayboldu. Bu depo o riski sıfırlar: **claude.ai'ye yüklenen her skill'in kaynağı burasıdır; burada olmayan skill yok sayılır.**

## Yapı
```
skills/        Her klasör bir skill (SKILL.md + references/ + assets/ + scripts/)
projects/      claude.ai Proje talimatları (fonksiyon bazlı; grup şemsiyesi + şirket ayrımı içeride)
prompts/       Zamanlanmış görev istemleri (gece toplantı hattı, haftalık rapor vb.)
workflows/n8n/ n8n akış tanımları (JSON dışa aktarım)
scripts/       Paketleme ve doğrulama betikleri
docs/          Mimari, karar günlüğü (ADR)
```

## Çalışma kuralları
1. Skill değişikliği önce burada yapılır, `scripts/pack_skills.sh` ile zip'lenir, claude.ai **Ayarlar > Yetenekler > Skiller**'den yüklenir. Konteynere yazmak kalıcı değildir.
2. Her değişiklik `CHANGELOG.md`'ye ve skill'in `SKILL.md` üst bilgisindeki `version` alanına işlenir.
3. Mimari kararlar `docs/KARARLAR.md`'ye ADR biçiminde girer; sohbet hafızası karar kaynağı değildir.
4. Kurumsal gerçek SharePoint sicillerinde (GOV.05 vb.) ve Odoo'dadır; bu depo **araç** deposudur. Gizli veri, şifre, API anahtarı, driveId dışında müşteri verisi buraya girmez.
5. Kalite dokümanlarında Notion ve bu depo gibi kişisel/araç katmanlarına atıf yapılmaz.

## Sürüm politikası
- Skill: `MAJOR.MINOR` (`SKILL.md` üst bilgisi). Davranış değişirse MAJOR, metin/referans düzeltmesi MINOR.
- Depo etiketi: `os-YYYY.MM` (aylık kesit). Release oluşturulunca GitHub Actions tüm skill zip'lerini Release'e ekler.

## Kurulum
```bash
git clone git@github.com:<org>/btech-claude-os.git
cd btech-claude-os
bash scripts/check_skills.sh   # doğrulama
bash scripts/pack_skills.sh    # dist/ altına yüklenebilir zip'ler
```
