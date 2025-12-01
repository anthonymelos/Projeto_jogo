/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

y = 470

// ===== MOVIMENTO DO INIMIGO =====
// ===== MOVIMENTO DO INIMIGO =====

if (instance_exists(obj_sebastiao)) {
    var direcao_alvo = point_direction(x, y, obj_sebastiao.x, obj_sebastiao.y);
    direction = lerp(direction, direcao_alvo, 0.05);
    speed = velocidade_inimigo;
    
    // ===== SOM DE ALIEN ANDANDO =====
    timer_som_andando -= 1;
    
    if (timer_som_andando <= 0) {
        audio_play_sound(snd_passos_alien, 3, false);
        timer_som_andando = intervalo_som_andando;
    }
}

// Destruir se sair muito da room
if (x < -500 || x > room_width + 500 || 
    y < -500 || y > room_height + 500) {
    instance_destroy();
}