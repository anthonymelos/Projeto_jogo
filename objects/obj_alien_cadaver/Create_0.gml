// ===== CONFIGURAÇÃO DO CADÁVER =====

sprite_index = spr_alien_morrendo;
// Usa sprite de morte

image_index = 0;
// Começa do primeiro frame

image_speed = 1;
// Velocidade da animação

// ===== SEM COLISÃO =====
mask_index = noone;
// noone = sem hitbox
// Bastião e tiros passam através

solid = false;
// Não é sólido

// ===== PROFUNDIDADE DE DESENHO =====
depth = 10;
// Números maiores = desenha atrás
// Cadáver fica atrás de objetos vivos

// ===== ADICIONAR AO CONTADOR DE MORTES =====

global.inimigos_mortos += 1;
// Aumenta contador de inimigos mortos


// OPCIONAL: Som
// audio_play_sound(snd_inimigo_morte, 5, false);