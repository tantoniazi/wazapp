# 012 — Núcleo Rust: FFI (C ABI) para Qt4/QML do Harmattan

**Labels:** `epic/core`, `epic/harmattan`, `fase-2`, `rust`

## Objetivo
Expor `wazapp-core` via C ABI estável + bindings para o app QML do N9
substituindo o Yowsup morto.

## Critérios de aceite
- [ ] Alvos: `armv7-unknown-linux-musl` (Harmattan glibc antiga → musl estático) e `aarch64`
- [ ] API C chave: `wz_start`, `wz_stop`, `wz_send`, callback `wz_event`
- [ ] Loop de eventos para o thread principal QML (sinal via QSocketNotifier)
- [ ] `cargo build --target armv7-unknown-linux-musl` verde no CI
