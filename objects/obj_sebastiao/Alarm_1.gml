// ===== TRANSIÇÃO PARA GAME OVER =====

// Reseta contadores ao morrer
global.inimigos_mortos = 0;
global.boss_invocado = false;
global.boss_morto = false;

// Reativa spawner
if (instance_exists(obj_spawner_inimigos)) {
    obj_spawner_inimigos.spawner_ativo = true;
}

// Vai para Game Over
room_goto(room_game_over);
