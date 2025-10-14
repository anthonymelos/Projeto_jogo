// ===== COLISÃO COM INIMIGO =====

if (!ja_acertou) {
    ja_acertou = true;
    
    // ===== FAZER INIMIGO "MORRER" COM ANIMAÇÃO =====
    
    with(other) {
        // other = obj_inimigo que foi atingido
        
        // Troca para sprite de morte
        sprite_index = spr_alien_morrendo;
        
        // Reseta animação para começar do frame 0
        image_index = 0;
        
        // Velocidade da animação de morte
        image_speed = 1;
        // 1 = normal, 1.5 = mais rápido, 0.5 = mais lento
        
        // Marca que está morrendo (para controlar no Step)
        esta_morrendo = true;
        
        // Para o movimento do inimigo (se tiver)
        speed = 0;
        hspeed = 0;
        vspeed = 0;
        
        // OPCIONAL: Som de morte
        // audio_play_sound(snd_morte_alien, 10, false);
    }
    
    // Destrói o tiro
    instance_destroy();
}