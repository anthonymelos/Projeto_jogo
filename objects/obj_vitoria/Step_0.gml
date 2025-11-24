/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== CONTAGEM PARA LIBERAR AÇÕES =====

if (timer_espera > 0) {
    timer_espera -= 1;
} else {
    pode_agir = true;
}

// ===== CONTROLES =====

if (pode_agir) {
    
    // ENTER para jogar novamente
    if (keyboard_check_pressed(vk_enter)) {
        
        // Reseta variáveis globais
        global.inimigos_mortos = 0;
        global.boss_invocado = false;
        global.boss_morto = false;
        
        // Reativa spawner
        if (instance_exists(obj_spawner_inimigos)) {
            obj_spawner_inimigos.spawner_ativo = true;
        }
        
        // OPCIONAL: Para música
        // audio_stop_all();
        
        // Vai para o jogo
        room_goto(Room1);
    }
    
    // ESC para sair
    if (keyboard_check_pressed(vk_escape)) {
        game_end();
        // Fecha o jogo
    }
}




