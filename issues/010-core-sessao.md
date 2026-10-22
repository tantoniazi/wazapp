# 010 — Núcleo Rust: sessão "linked device" (QR → texto)

**Labels:** `epic/core`, `fase-2`, `rust`, `protocolo`

## Objetivo
Crate `wazapp-core`: sessão WhatsApp como "linked device" — login via QR, handshake Noise,
Signal, e envio/recebimento de texto. Referências: arquitetura documental do Unison
(Baileys 7) — conceitos, não código (licença PolyForm).

## Critérios de aceite
- [ ] `wazapp-core` sem dependência de UI; expõe API async (tokio)
- [ ] Scan do QR → sessão persistida (chaves + creds) em arquivo local
- [ ] Recebe mensagens de texto e emite eventos
- [ ] Envia mensagem de texto para o seu próprio número (self-chat)
- [ ] Testes de unidade para parser de binário XML e protobuf dos envelopes
- [ ] TLS via `rustls` (portátil também para ARMv7/glibc antigo)

> Publicado como GitHub Issue: https://github.com/tantoniazi/wazapp/issues/4
