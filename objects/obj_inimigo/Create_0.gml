// ===== CONFIGURAÇÕES DO INIMIGO =====

velocidade_inimigo = 2;
// Velocidade de movimento
// AJUSTE: Maior = inimigo mais rápido

// Direção inicial aleatória
direction = random(360);
// 0-360 graus (qualquer direção)

// OU direção específica em direção ao jogador:
// if (instance_exists(obj_sebastiao)) {
//     direction = point_direction(x, y, obj_sebastiao.x, obj_sebastiao.y);
// }

speed = velocidade_inimigo;
// Aplica velocidade na direção definida