// ===== RAIO ATINGE BASTIÃO =====

if (raio_ativo && !other.invulneravel && !other.morreu) {
    
    other.vidas -= 1;
    
    other.invulneravel = true;
    other.timer_invulnerabilidade = other.tempo_invulnerabilidade;
    
    
    // OPCIONAL: Som
    // audio_play_sound(snd_dano, 10, false);
    
    instance_destroy();
}