// ===== VERIFICAR SE DEVE SPAWNAR BOSS =====

if (global.inimigos_mortos >= global.inimigos_para_boss && 
    !global.boss_invocado && 
    room == Room1) {
    // Se matou 50 inimigos E boss não foi invocado E está na room do jogo
    
    global.boss_invocado = true;
    // Marca que boss foi invocado
    
    // ===== CRIAR BOSS =====
    var boss = instance_create_layer(
        room_width / 2,  // Centro horizontal da tela
        150,             // Posição Y (topo da tela)
        "Instances",
        obj_boss
    );
    
    // Para spawner de inimigos normais
    if (instance_exists(obj_spawner_inimigos)) {
        obj_spawner_inimigos.spawner_ativo = false;
        // Desativa spawn de inimigos normais
    }
    
    // Destrói inimigos normais restantes (opcional)
    with(obj_inimigo) {
        instance_destroy();
    }
    
    // Debug
    show_debug_message("===== BOSS APARECEU! =====");
    
    // OPCIONAL: Música de boss
    // audio_stop_all();
    // audio_play_sound(snd_boss_theme, 10, true);
}