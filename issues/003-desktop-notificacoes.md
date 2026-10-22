# 003 — Desktop: notificações nativas e badge

**Labels:** `epic/desktop`, `fase-1`, `rust`

## Objetivo
Notificações nativas do sistema operacional quando chega mensagem.

## Critérios de aceite
- [ ] Linux: notificação via DBus (`org.freedesktop.Notifications`), sem depender de browser
- [ ] Windows/macOS: notificação nativa do SO
- [ ] Badge de não lidas no ícone da bandeja (onde o SO suportar)
- [ ] Detectado por injeção JS no WebView (contador de envelopes) → evento Tauri → notificação

> Publicado como GitHub Issue: https://github.com/tantoniazi/wazapp/issues/3
