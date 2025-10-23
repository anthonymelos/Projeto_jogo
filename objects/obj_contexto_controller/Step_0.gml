/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== FADE IN =====

if (alpha_tela < 1) {
    alpha_tela += 0.03;
    // Aparece gradualmente
}

// ===== TIMER MÍNIMO =====

if (timer_minimo > 0) {
    timer_minimo -= 1;
} else {
    pode_pular = true;
}


// ===== AVANÇAR COM ESPAÇO =====

if (pode_pular && keyboard_check_pressed(vk_enter)) {
    // Se pode pular E apertou espaço
    instance_destroy();
    // Vai para room do jogo
    room_goto(Room1);
    
    // OPCIONAL: Som
    // audio_play_sound(snd_menu_select, 5, false);
}



