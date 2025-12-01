// ===== VERIFICAR SE ESTÁ NA ROOM CERTA =====
if (room != room_contexto) {
    instance_destroy();
    exit;
}

// ===== FADE IN =====
if (alpha_tela < 1) {
    alpha_tela += 0.03;
}

// ===== TIMER MÍNIMO =====
if (timer_minimo > 0) {
    timer_minimo -= 1;
} else {
    pode_pular = true;
}

// ===== TIMER DE LEITURA =====
timer_leitura -= 1;

// ===== AVANÇAR AUTOMATICAMENTE =====
if (timer_leitura <= 0) {
    
    // Para música da cutscene, inicia música do jogo
    audio_stop_all();
    audio_play_sound(snd_jogo, 10, true); // Descomente se tiver música do jogo
    
    instance_destroy();
    room_goto(Room1);
}

// ===== AVANÇAR COM ENTER =====
if (pode_pular && keyboard_check_pressed(vk_enter)) {
    
    audio_stop_all();
    audio_play_sound(snd_jogo, 10, true);
    
    instance_destroy();
    room_goto(Room1);
}

// ===== ESC PARA PULAR =====
if (keyboard_check_pressed(vk_escape)) {
    audio_stop_all();
    instance_destroy();
    room_goto(Room1);
}