# 020 — Harmattan: QML atual consumindo o núcleo Rust

**Labels:** `epic/harmattan`, `fase-3`

## Objetivo
Manter o app nativo QML do N9 (pedido do mantenedor: nativo mesmo), trocar o backend
Yowsup pelo `wazapp-core` via FFI.

## Critérios de aceite
- [ ] QR da sessão renderizado na UI do N9 (pareamento com celular "primary")
- [ ] Envio e recebimento de texto funciona no N9
- [ ] Notificação nativa Harmattan para mensagens novas
- [ ] Sessão persiste no device entre reconexões
- [ ] Desempenho: < 60 MB RAM para o processo do núcleo
