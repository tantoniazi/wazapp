# Referências pesquisadas (2026-10-22)

## rafatosta/zapzap — modelo para o desktop moderno
- **O que é:** whatsapp Web desktop em PyQt6 + QtWebEngine; embrulha `web.whatsapp.com`.
- **Aproveitar:** integração de bandeja/notificações, contas múltiplas com sessões isoladas,
  injeção de CSS/JS custom, empacotamento (AppImage/Flatpak/DEB/Snap, Windows x64+ARM64).
- **Direção:** aqui a stack passa a ser **Rust + Tauri 2**; o frontend vira webview igual.

## MaskNinjaSquared/Unison — referência de protocolo
- **O que é:** cliente UWP de WhatsApp para Windows 10 Mobile feito como *linked device* no
  estilo Baileys (7.0.0-rc14): Noise, Signal, binário XML, protobuf, crypto.
- **Aproveitar:** docs de arquitetura e a prova de viabilidade do modelo linked-device.
- **Licença:** PolyForm Noncommercial 1.0 — código não copiável, apenas conceitos/docs.

## jetspiking/WindowsPhone_WebWhatsApp — the User Agent spoof
- **O que é:** WebView com User Agent customizado para carregar WhatsApp Web no W10 Mobile.
- **Conclusão para N9/N900:** **não funciona** — QtWebKit de 2011/2012 não suporta os
  recursos de JS/TLS que o WhatsApp Web exige hoje. Daí o núcleo Rust (rustls + linked
  device) empurrando UI nativa QML.

## sagarbarbhaya/Whatsapp-for-windows-phone
- Placeholder com 2 commits; sem conteúdo utilizável.

## Códigos legados já versionados neste repo
- `pr/*`: todos os 105 PRs do `tgalal/wazapp` (18 abertos + 87 fechados).
- `fork/*`: 441 branches de 156 forks (átomos de evolução histórica; dois forks foram
  apagados do GitHub — `nagya11`, `timofonic` — e não são recuperáveis).
