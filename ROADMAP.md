# WazApp — Roadmap de modernização

> Repo público de orquestração: as issues detalhadas vivem em [`/issues`](./issues) (uma por arquivo,
> numeradas em ordem de execução). Referências pesquisadas: [`/docs/referencias.md`](./docs/referencias.md).

## Visão

Reviver o WazApp (cliente não-oficial de WhatsApp para Nokia N9/Harmattan) como:

1. **App desktop moderno** (Linux, Windows, macOS — x86_64 e ARM64), em **Rust + Tauri 2**,
   embutindo o `web.whatsapp.com` (modelo "WhatsApp Web linked device") no estilo do ZapZap.
2. **Cliente nativo Harmattan/Maemo** — mantém o app original em QML/Qt4, modernizado,
   consumindo um **núcleo Rust compartilhado** que fala WhatsApp como "linked device".

## Decisões registradas (2026-10-22)

| Decisão | Escolha | Motivo |
|---|---|---|
| Stack desktop | Rust + Tauri 2 | Binários pequenos, x64+ARM64 nos 3 OS, webview nativa (equiv. QtWebEngine do ZapZap) |
| Protocolo | WhatsApp Web / linked device (QR) | O protocolo legado do Yowsup morreu em ~2013; alto impacto |
| Harmattan/Maemo | App nativo no device, QML atuais | Pedido do mantenedor — sem thin client; texto primeiro |
| Referência protocolo | Unison (Baileys 7, UWP) | Prova que linked-device funciona; documentação usada como referência (código é PolyForm, não copiável) |
| Orquestração | ROADMAP + issues em .md no repo | Repo já público; sem dependência de API do GitHub |

## Fases

### Fase 0 — Infra e orquestração (em andamento)
- [x] Trazer todos os PRs (105) e forks (156 repos, 441 branches) para este repo (`pr/*`, `fork/*`)
- [x] ROADMAP + issues públicas versionadas
- [ ] CI multi-target: Linux/Windows/macOS × x86_64/ARM64
- [ ] Scaffold Rust + Tauri 2 compilando

### Fase 1 — Desktop minimal viável (WazApp Desktop)
- [ ] Janela WebView carregando `web.whatsapp.com` (QR login) — GH #1
- [ ] Ícone/UA e tratamentos de janela (minimizar p/ bandeja, salvar sessão por perfil) — GH #2
- [ ] Notificações nativas do desktop + badge — GH #3
- [ ] Empacotamento: Flatpak/AppImage/DEB (Linux), EXE + MSI (Windows), DMG (macOS) — #004
- [ ] Tema claro/escuro, contas múltiplas com sessões isoladas — #005

### Fase 2 — Núcleo Rust compartilhado
- [ ] Crate `wazapp-core`: sessão WhatsApp "linked device" (QR → E2E → recv/send texto) — GH #4
- [ ] Testes de protocolo e fixtures; sem UI — (detalhe no GH #4)
- [ ] FFI (C ABI) para consumo pelo Qt4/QML do Harmattan — GH #5

### Fase 3 — Harmattan (Nokia N9) nativo
- [ ] QML atual consumindo `wazapp-core` via FFI no lugar do Yowsup — GH #6
- [ ] Envio/recebimento de texto; mídia como follow-up (detalhe no GH #6)
- [ ] Empacotamento `.deb` Harmattan com cross-compile armv7 (detalhe no GH #6)

### Fase 4 — Maemo (N900)
- [ ] Porta do cliente QML para Maemo 5 (Qt 4.6, Fremantle) — GH #7
- [ ] Validação de recursos: 256 MB RAM, TLS moderno no núcleo Rust (rustls) (detalhe no GH #7)

## Riscos conhecidos

- **WhatsApp Web pode mudar o DOM/UA** → camada de injeção CSS/JS versionada por perfil (aprendizado do ZapZap).
- **Protocolo linked device é não-oficial e em evolução** → Unison/Baileys como referência; risco de ban existe (anotação do próprio Unison: nenhum testador banido).
- **Harmattan/Maemo**: glibc/Qt antigos exigem rustc ARMv7 (musl) e `rustls` (TLS moderno) — o device não tem TLS 1.2+ moderno no stack Qt4.
- **ARM64 Windows**: builds precisam de VS com target AA64 no CI.
