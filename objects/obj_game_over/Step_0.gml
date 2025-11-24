/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== CONTAGEM PARA REINICIAR =====

if (timer_espera > 0) {
    timer_espera -= 1;
} else {
    pode_reiniciar = true;
}

// ===== CONTROLES =====

if (pode_reiniciar) {
    
    // Aperta SPACE para reiniciar
    if (keyboard_check_pressed(vk_space)) {
        // Para música
        // audio_stop_all();
        
        // Volta para room do jogo
        room_goto(Room1);
        // Reinicia o jogo do zero
    }
    
    // Aperta ESC para sair
    if (keyboard_check_pressed(vk_escape)) {
        game_end();
        // Fecha o jogo
    }
}



