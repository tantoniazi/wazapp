// WazApp Desktop — núcleo de janela: carrega o WhatsApp Web como "linked device".
// Referência: zapzap (PyQt6+QtWebEngine) — aqui em Rust/Tauri 2.
use tauri::{
    WebviewUrl, WebviewWindowBuilder,
    menu::{Menu, MenuItem},
    tray::TrayIconBuilder,
    Manager,
};

fn main() {
    tauri::Builder::default()
        .setup(|app| {
            // Janela principal apontando direto para o WhatsApp Web (QR login).
            let win = WebviewWindowBuilder::new(
                app,
                "main",
                WebviewUrl::External("https://web.whatsapp.com".parse().unwrap()),
            )
            .title("WazApp")
            .inner_size(1100.0, 780.0)
            .min_inner_size(480.0, 320.0)
            .build()?;

            // Tray com as ações básicas do ZapZap: abrir / sair.
            let abrir = MenuItem::with_id(app, "open", "Abrir WazApp", true, None::<&str>)?;
            let sair = MenuItem::with_id(app, "quit", "Sair", true, None::<&str>)?;
            let menu = Menu::with_items(app, &[&abrir, &sair])?;
            tray::TrayIconBuilder::with_id("main-tray")
                .menu(&menu)
                .show_menu_on_left_click(true)
                .on_menu_event(|app, ev| match ev.id.as_ref() {
                    "open" => {
                        if let Some(w) = app.get_webview_window("main") {
                            let _ = w.show();
                            let _ = w.set_focus();
                        }
                    }
                    "quit" => app.exit(0),
                    _ => {}
                })
                .build(app)?;

            // Fechar a janela esconde para a tray (issue 002).
            let win_clone = win.clone();
            let _ = win.on_window_event(move |ev| {
                if let tauri::WindowEvent::CloseRequested { api, .. } = ev {
                    api.prevent_close();
                    let _ = win_clone.hide();
                }
            });

            Ok(())
        })
        .run(tauri::generate_context!())
        .expect("erro ao iniciar o WazApp");
}
