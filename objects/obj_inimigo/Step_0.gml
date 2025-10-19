/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

y = 470

// ===== MOVIMENTO DO INIMIGO =====

// Movimento em direção ao jogador
if (instance_exists(obj_sebastiao)) {
    // Se Bastião existe na room
    
    // Calcula direção para o Bastião
    var direcao_alvo = point_direction(x, y, obj_sebastiao.x, obj_sebastiao.y);
    // point_direction retorna ângulo em graus (0-360)
    
    // Gira suavemente em direção ao alvo
    direction = lerp(direction, direcao_alvo, 0.05);
    // lerp = interpolação suave
    // 0.05 = 5% de movimento em direção ao alvo
    // Menor = gira mais devagar, maior = gira mais rápido
    
    // Aplica velocidade
    speed = velocidade_inimigo;
    // velocidade_inimigo definida no Create (geralmente 2)
}

// ===== DESTRUIR SE SAIR MUITO DA ROOM =====

// Evita acumular inimigos muito longe da câmera
if (x < -500 || x > room_width + 500 || 
    y < -500 || y > room_height + 500) {
    // Se saiu muito longe (500 pixels fora da room)
    
    instance_destroy();
    // Destrói inimigo (libera memória)
}

// IMPORTANTE: NÃO TEM MAIS CÓDIGO DE MORTE
// Morte é gerenciada pelo obj_alien_cadaver
// Inimigo é sempre destruído imediatamente quando morre