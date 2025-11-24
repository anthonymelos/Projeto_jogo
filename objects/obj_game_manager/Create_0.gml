// ===== SISTEMA DE CONTADOR DE INIMIGOS MORTOS =====

global.inimigos_mortos = 0;
// Contador de quantos inimigos foram mortos

global.inimigos_para_boss = 50;
// Precisa matar 50 inimigos para boss aparecer

global.boss_invocado = false;
// Se boss já foi criado

global.boss_morto = false;
// Se boss foi derrotado

// ===== PERSISTENT =====
persistent = true;
// Mantém entre rooms