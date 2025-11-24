// ===== CONFIGURAÇÕES DO RAIO =====

tempo_aviso = 45;
// 45 frames (0.75 segundo) de aviso

timer_aviso = tempo_aviso;

raio_ativo = false;

tempo_raio_ativo = 20;
// 20 frames ativo (0.33 segundos)

timer_raio = tempo_raio_ativo;

// ===== VISUAL =====

sprite_index = spr_raios_boss;
// Define sprite

image_speed = 0;

image_alpha = 0.5;
// Começa visível mas transparente

image_xscale = 1;
image_yscale = 1;
// Garante escala normal

// ===== SEM COLISÃO DURANTE AVISO =====
mask_index = noone;

// ===== DEPTH (na frente) =====
depth = -50;
// Raio aparece na frente de tudo