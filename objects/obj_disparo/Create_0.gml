/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// ===== CONFIGURAÇÕES DO TIRO =====

velocidade_tiro = 8;
// Pixels por frame que o tiro se move
// Maior que personagem (5) para ser mais rápido

alcance_maximo = 200;
// Distância em pixels que o tiro viaja
// 200px = alcance médio

distancia_percorrida = 0;
// Contador de quanto já viajou

direcao_tiro = "direita";
// Será definido pelo obj_sebastiao
// Padrão temporário

ja_acertou = false;
// Flag para matar apenas 1 inimigo
// false = ainda não matou, true = já matou alguém

// ===== VISUAL =====
sprite_index = spr_disparo;
// Define sprite do tiro

image_speed = 1;
// Velocidade da animação


