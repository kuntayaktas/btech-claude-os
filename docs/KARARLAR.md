# Karar Günlüğü (ADR)

## ADR-001 · 2026-09-20 · Skill kaynağı GitHub
Skill'lerin tek kaynağı `btech-claude-os` deposudur; claude.ai'ye yükleme depodan paketlenerek yapılır. Gerekçe: iki skill'in geri dönülmez kaybı.

## ADR-002 · 2026-09-20 · Projeler fonksiyon bazlı
claude.ai Projeleri fonksiyon bazlı (Grup Yönetim, Satış-Pazarlama, Kalite-Mevzuat, Finans, İK, Ar-Ge). Grup şemsiyesi ve şirket ayrımı her talimatın içinde.

## ADR-003 · 2026-09-20 · Pilot: Satış-Pazarlama (BTech)
Karar katmanı ilk olarak BTech satış-pazarlamada kurulur; veri katmanı en olgun alan.

## ADR-004 · 2026-09-20 · Yetki ilkesi
Okuma serbest; yazma/taşıma/silme/harcama işlem başına onay. Odoo MCP kullanıcısı salt-okunur yapılana kadar otomatik akış Odoo'ya yazmaz.
