// ===== LIMITAR MOVIMENTO NA TELA =====
x = clamp(x, 15, room_width - 15);
y = 960

// ===== ANIMAÇÃO DE TIRO (Contador) =====
if (esta_atirando) {
    // Se está na animação de tiro
    
    timer_animacao_tiro -= 1;
    // Diminui o contador a cada frame
    // Exemplo: 15 → 14 → 13 → ... → 1 → 0
    
    if (timer_animacao_tiro <= 0) {
        // Quando chegar a 0, termina a animação
        esta_atirando = false;
    }
}

// ===== MOVIMENTO HORIZONTAL =====
var movendo = false;

// IMPORTANTE: Só permite movimento se NÃO está atirando
if (!esta_atirando) {
    // Se NÃO está na animação de tiro
    
    if (keyboard_check(ord("A"))) {
        x -= speed_moviment;
        sprite_index = spr_bastiao_mov_esquerda;
        ultima_direcao = "esquerda";
        movendo = true;
        image_speed = 1;
    }
    
    if (keyboard_check(ord("D"))) {
        x += speed_moviment;
        sprite_index = spr_bastiao_mov_direita;
        ultima_direcao = "direita";
        movendo = true;
        image_speed = 1;
    }
    
    // ===== SPRITE PARADO =====
    if (!movendo) {
        if (ultima_direcao == "esquerda") {
            sprite_index = spr_sebastiao_parado_esq;
        } else {
            sprite_index = spr_sebastiao_parado_dir;
        }
        image_speed = 0.3;
    }
}

// ===== SPRITE DE ATIRAR =====
// IMPORTANTE: Isso fica FORA do if anterior
// Para sobrescrever as outras sprites quando está atirando
if (esta_atirando) {
    // Define sprite baseado na direção
    if (ultima_direcao == "esquerda") {
        sprite_index = spr_atirando_esquerda;
    } else {
        sprite_index = spr_atirando_direita;
    }
    
    // Velocidade da animação de tiro
    image_speed = 1;
    
    // OPCIONAL: Trava movimento enquanto atira
    // Descomente as linhas abaixo se quiser que ele pare ao atirar
    // speed_moviment_temp = speed_moviment;
    // speed_moviment = 0;
}

// ===== COOLDOWN DO TIRO =====
if (timer_cooldown > 0) {
    timer_cooldown -= 1;
    pode_atirar = false;
} else {
    pode_atirar = true;
}

// ===== SISTEMA DE DISPARO =====
if (keyboard_check_pressed(vk_space) && pode_atirar) {
    
    // ===== INICIA ANIMAÇÃO DE TIRO =====
    esta_atirando = true;
    timer_animacao_tiro = duracao_animacao_tiro;
    // Reseta o timer para 15 frames
    
    // Cria o tiro
    var tiro = instance_create_layer(x, y, "Instances", obj_disparo);
    
    tiro.direcao_tiro = ultima_direcao;
    
    if (ultima_direcao == "direita") {
        tiro.x = x + 30; // Posiciona na frente da arma
        tiro.y = y - 5;  // Ajusta altura (opcional)
        tiro.image_angle = 0;
    } else {
        tiro.x = x - 30;
        tiro.y = y - 5;
        tiro.image_angle = 180;
    }
    
    timer_cooldown = cooldown_tiro;
    
    // OPCIONAL: Som de tiro
    // audio_play_sound(snd_tiro, 1, false);
}