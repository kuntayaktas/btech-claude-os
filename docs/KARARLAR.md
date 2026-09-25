# Karar Günlüğü (ADR)

## ADR-001 · 2026-09-20 · Skill kaynağı GitHub
Skill'lerin tek kaynağı `btech-claude-os` deposudur; claude.ai'ye yükleme depodan paketlenerek yapılır. Gerekçe: iki skill'in geri dönülmez kaybı.

## ADR-002 · 2026-09-20 · Projeler fonksiyon bazlı
claude.ai Projeleri fonksiyon bazlı (Grup Yönetim, Satış-Pazarlama, Kalite-Mevzuat, Finans, İK, Ar-Ge). Grup şemsiyesi ve şirket ayrımı her talimatın içinde.

## ADR-003 · 2026-09-20 · Pilot: Satış-Pazarlama (BTech)
Karar katmanı ilk olarak BTech satış-pazarlamada kurulur; veri katmanı en olgun alan.

## ADR-004 · 2026-09-20 (düzeltme 21.09) · Yetki ilkesi
Okuma serbest; yazma/taşıma/silme/harcama işlem başına onay. Odoo MCP'ye yazma 10.09.2026'da bilinçli olarak açıldı (45 model); salt-okunur yapılmayacak. Müşteri/lead kaydı silinmez, arşivlenir.

## ADR-005 · 2026-09-21 · Görev yeri ayrımı
Şirket işleri Odoo proje/görev modülünde, Kuntay'ın kişisel takipleri Notion Aksiyonlar'da tutulur.

## ADR-006 · 2026-09-21 · Proje talimatı yalın tutulur
Talimat yalnız sohbetler arası kalıcı olması gereken kural ve veri kaynağı bilgisini taşır; plan içeriği, rakam ve revizyonlar asıl belgelerden okunur.
