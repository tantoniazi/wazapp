# 001 — Desktop: janela WebView com WhatsApp Web (QR login)

**Labels:** `epic/desktop`, `fase-1`, `rust`

## Objetivo
Janela desktop (Tauri 2) carregando `https://web.whatsapp.com/` com login por QR,
usada como "linked device".

## Critérios de aceite
- [ ] `cargo check` verde no crate `app/src-tauri`
- [ ] Janela abre 1100×780, título "WazApp", redimensionável
- [ ] WhatsApp Web renderiza e o QR aparece
- [ ] Sessão persiste entre reinícios (WebView data dir em perfil isolado)
- [ ] `cargo build` roda no CI para Linux x86_64

> Publicado como GitHub Issue: https://github.com/tantoniazi/wazapp/issues/1
