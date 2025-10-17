// ===== COLISÃO DO BASTIÃO COM INIMIGO (DANO SIMPLES) =====

if (!invulneravel && !morreu) {
    // Se NÃO está invulnerável E NÃO morreu
    
    // ===== PERDE UMA VIDA =====
    vidas -= 1;
    
    // ===== ATIVA INVULNERABILIDADE TEMPORÁRIA =====
    invulneravel = true;
    timer_invulnerabilidade = tempo_invulnerabilidade;
    
    // ===== FEEDBACK =====
    show_debug_message("Tomou dano! Vidas restantes: " + string(vidas));
    
    // OPCIONAL: Som de dano
    // audio_play_sound(snd_dano, 10, false);
    
    with(other) {
        // other = obj_inimigo que colidiu com Bastião
        
        // ===== CRIA CADÁVER =====
        instance_create_layer(x, y, "Instances", obj_alien_cadaver);
        // Cria cadáver na posição do inimigo
        
        // ===== DESTRÓI INIMIGO IMEDIATAMENTE =====
        instance_destroy();
        // Inimigo some na hora
        // Só fica cadáver (sem colisão)
    }
}

// IMPORTANTE: Não precisa verificar se inimigo está morrendo
// porque inimigo é destruído IMEDIATAMENTE
// Cadáver é objeto diferente (sem colisão com Bastião)