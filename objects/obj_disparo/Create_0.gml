// ===== CONFIGURAÇÕES DO TIRO =====

velocidade_tiro = 10;
// Velocidade em pixels por frame que o tiro se move
// Quanto maior, mais rápido o tiro

alcance_maximo = 150;
// Distância máxima em pixels que o tiro percorre
// Depois disso, o tiro é destruído
// 300px = alcance médio de espingarda

distancia_percorrida = 0;
// Contador de quanto o tiro já viajou
// Começa em 0 e vai aumentando
// Quando chega em alcance_maximo, tiro é destruído

direcao_tiro = "direita";
// Direção que o tiro vai seguir
// Será definida pelo obj_sebastiao quando criar o tiro
// Valores possíveis: "direita", "esquerda"

ja_acertou = false;
// Flag (marcador) que indica se já matou um inimigo
// false = ainda não matou ninguém
// true = já matou alguém
// IMPORTANTE: Garante que mata apenas 1 inimigo por tiro

// ===== CONFIGURAÇÕES DE VISUAL E ANIMAÇÃO =====

sprite_index = spr_disparo;
// Define qual sprite usar para o tiro
// Certifique-se que spr_disparo existe no projeto

image_speed = 1.5;
// Velocidade da animação da sprite
// 1.0 = velocidade normal (1 frame por step)
// 1.5 = 50% mais rápido (animação mais rápida)
// 0.5 = metade da velocidade (mais lento)
// Ajuste este valor se quiser animação mais rápida/lenta

animacao_terminou = false;
// Flag que indica se a animação já tocou completamente
// false = ainda está animando
// true = já terminou de animar (parou no último frame)
// Usado para controlar que a animação toque apenas 1 vez