// ===== CONFIGURAÇÃO DO CADÁVER =====

sprite_index = spr_alien_morrendo;
image_index = 0;
image_speed = 1;

mask_index = noone;
solid = false;
depth = 10;

// ===== CONTADOR DE MORTES =====
global.inimigos_mortos += 1;

audio_play_sound(snd_morte_alien, 8, false);