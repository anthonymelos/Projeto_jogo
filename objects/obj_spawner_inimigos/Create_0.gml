/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== CONFIGURAÇÃO DO SPAWNER =====

tempo_entre_spawns = 120;
// Tempo em frames entre cada spawn
// 90 frames = 1.5 segundos (em 60 FPS)
// AJUSTE AQUI: Menor = spawna mais rápido

timer_spawn = tempo_entre_spawns;
// Contador regressivo para próximo spawn

maximo_inimigos = 8;
// Quantidade máxima de inimigos na tela
// AJUSTE AQUI: Mais inimigos = mais difícil

distancia_spawn = 250;
// Pixels fora da câmera onde inimigos aparecem
// 250px = inimigos aparecem bem longe da visão
// AJUSTE AQUI: Maior = spawna mais longe

// Flag de controle
spawner_ativo = true;
// true = spawner funcionando
// false = pausado (útil para pausar jogo)



