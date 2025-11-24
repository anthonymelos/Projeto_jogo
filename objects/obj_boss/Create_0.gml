// ===== CONFIGURAÇÕES DO BOSS =====

// Vida do boss
hp_boss = 30;
hp_maximo = 30;

// Estados do boss
estado = "parado";

// ===== TIMERS DE ESTADO =====

tempo_parado = 180;
timer_parado = tempo_parado;

tempo_preparando_ataque = 60;

tempo_entre_raios = 90;
// Aumentado para 90 frames (1.5 segundos entre raios)

raios_lancados = 0;

total_raios = 1;
// APENAS 1 RAIO por ataque (simplificado)

// ===== VISUAL =====

sprite_index = spr_boss_parado;
image_speed = 0.5;

invulneravel = false;

// ===== DEPTH =====
depth = -100;

// ===== POSIÇÃO (DIREITA DA TELA) =====

// Move boss para direita da tela
x = room_width - 150;
// 150 pixels da borda direita

y = 210;
// 200 pixels do topo (mais para baixo)