/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== CONFIGURAÇÃO DO CADÁVER =====

sprite_index = spr_alien_morrendo;
// Define sprite de morte do alien

image_index = 0;
// Começa do primeiro frame (frame 0)

image_speed = 1;
// Velocidade da animação
// 1 = normal, 0.5 = mais lento, 1.5 = mais rápido

// ===== SEM COLISÃO (IMPORTANTE!) =====

mask_index = noone;
// noone = sem hitbox de colisão
// Bastião e tiros passam através

solid = false;
// Não bloqueia movimento de outros objetos

// ===== PROFUNDIDADE DE DESENHO =====

depth = 10;
// Números maiores = desenha atrás
// depth 10 = atrás de objetos com depth 0
// Cadáver fica "no chão" atrás de tudo



