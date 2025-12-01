// ===== VERIFICAR SE ESTÁ NA ROOM CERTA =====
if (room != room_home) {
    instance_destroy();
    exit;
}

// ===== FADE IN =====
if (alpha_tela < 1) {
    alpha_tela += 0.02;
}

// ===== TIMER =====
if (timer > 0) {
    timer -= 1;
} else {
    pode_avancar = true;
}

// ===== AVANÇAR =====
if (pode_avancar) {
    if (keyboard_check_pressed(vk_enter)) {
        
        // Para música da cutscene
        audio_stop_all();
        
        instance_destroy();
        room_goto(room_contexto);
    }
}

// ===== ESC PARA PULAR =====
if (keyboard_check_pressed(vk_escape)) {
    audio_stop_all();
    instance_destroy();
    room_goto(Room1);
}