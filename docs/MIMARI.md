# Mimari — Kunta.Ai OS

| Katman | Görev | Araç | Doğruluk kaynağı |
|---|---|---|---|
| 0 Temel | Sürüm kontrolü, yetki, Projeler | GitHub, claude.ai Projeler, Odoo salt-okunur kullanıcı | bu depo |
| 1 Skill'ler | Tekrarlanabilir iş akışları | skills/ | bu depo → claude.ai yükleme |
| 2 Zamanlayıcı | Tetikleme | n8n + claude.ai zamanlanmış görevler | prompts/, workflows/ |
| 3 Kurumsal hafıza | Kalıcı gerçek | SharePoint sicilleri, Odoo; Notion kişisel | SharePoint/Odoo |
| 4 Karar katmanı | Rapor → sapma → öneri → görev | Projeler + todo skill | Notion Aksiyonlar |
| 5 Yayılım | Fonksiyon fonksiyon, şirket şirket | — | — |

İlke: Claude kendiliğinden tetiklenmez; her otomatik iş bir tetikleyiciye bağlanır ve her yazma/harcama adımı insan onayı ister.
