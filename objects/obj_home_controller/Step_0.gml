// ===== FADE IN (OPCIONAL) =====

if (alpha_tela < 1) {
    alpha_tela += 0.02;
    // Aumenta opacidade gradualmente
}

// ===== TIMER PARA LIBERAR AVANÇO =====

if (timer > 0) {
    timer -= 1;
    // Diminui contador a cada frame
} else {
    pode_avancar = true;
    // Depois de 0.5s, libera avanço
}

// ===== DETECTAR INPUT PARA AVANÇAR =====

if (pode_avancar) {
    if (keyboard_check_pressed(vk_enter)) {
        // Destrói este controlador ANTES de trocar room
        instance_destroy();
        
        // Vai para próxima room
        room_goto(room_contexto);
    }
}