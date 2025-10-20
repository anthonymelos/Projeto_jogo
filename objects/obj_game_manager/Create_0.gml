// ===== SISTEMA DE PONTUAÇÃO =====

// Inicializa variável global de pontos
global.pontos = 0;
// global = variável acessível de qualquer lugar
// Todos os objetos podem ler/modificar global.pontos

// Pontos necessários para boss
global.pontos_para_boss = 100;
// Quando chegar a 100, boss aparece

// Flag se boss já foi invocado
global.boss_invocado = false;
// false = ainda não apareceu
// Evita spawnar boss múltiplas vezes

// ===== PERSISTENT (IMPORTANTE!) =====
persistent = true;
// persistent = true faz objeto persistir entre rooms
// global.pontos será mantido mesmo trocando de room
