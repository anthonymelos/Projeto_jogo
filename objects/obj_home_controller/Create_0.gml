// ===== CONFIGURAÇÃO DA TELA HOME =====

sprite_home = spr_tela_home;

pode_avancar = false;

tempo_inicial = 30;
timer = tempo_inicial;

alpha_tela = 0;

// ===== TOCAR MÚSICA DA CUTSCENE =====
audio_stop_all();
audio_play_sound(snd_cutscene, 10, true);
// true = loop (repete a música)