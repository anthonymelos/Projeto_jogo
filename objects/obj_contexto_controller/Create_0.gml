// ===== CONFIGURAÇÃO =====

sprite_contexto = spr_tela_contexto;

tempo_leitura = 900;
timer_leitura = tempo_leitura;

pode_pular = false;

tempo_minimo = 30;
timer_minimo = tempo_minimo;

alpha_tela = 0;

// ===== CONTINUAR MÚSICA DA CUTSCENE =====
if (!audio_is_playing(snd_cutscene)) {
    audio_play_sound(snd_cutscene, 10, true);
}