// ===== VERIFICAR SE ESTÁ NA ROOM CERTA =====
if (room != Room1) {
    exit;
}

// ===== RESETA VELOCIDADES =====
if (!morreu) {
    hspeed = 0;
    vspeed = 0;
    speed = 0;
}

// ===== LIMITAR MOVIMENTO NA TELA =====
x = clamp(x, 15, room_width - 15);
y = 430

// ===== ANIMAÇÃO DE TIRO =====
if (esta_atirando) {
    timer_animacao_tiro -= 1;
    if (timer_animacao_tiro <= 0) {
        esta_atirando = false;
    }
}

// ===== MOVIMENTO HORIZONTAL =====
var movendo = false;

if (!esta_atirando && !morreu) {
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
if (esta_atirando) {
    if (ultima_direcao == "esquerda") {
        sprite_index = spr_atirando_esquerda;
    } else {
        sprite_index = spr_atirando_direita;
    }
    image_speed = 1;
}

// ===== COOLDOWN DO TIRO =====
if (timer_cooldown > 0) {
    timer_cooldown -= 1;
    pode_atirar = false;
} else {
    pode_atirar = true;
}

// ===== SISTEMA DE DISPARO =====
if (keyboard_check_pressed(vk_space) && pode_atirar && !morreu) {
    esta_atirando = true;
    timer_animacao_tiro = duracao_animacao_tiro;
    
    var tiro = instance_create_layer(x, y, "Instances", obj_disparo);
    tiro.direcao_tiro = ultima_direcao;
    
    if (ultima_direcao == "direita") {
        tiro.x = x + 30;
        tiro.y = y - 5;
        tiro.image_angle = 0;
    } else {
        tiro.x = x - 30;
        tiro.y = y - 5;
        tiro.image_angle = 180;
    }
    
    timer_cooldown = cooldown_tiro;
    
    // ===== SOM DE TIRO =====
    audio_play_sound(snd_tiro, 1, false);
    
    // ===== SOM DE RECARREGAR (após um pequeno delay) =====
    alarm[2] = 15; // Toca som de recarregar após 15 frames
}

// ===== SISTEMA DE INVULNERABILIDADE =====
if (invulneravel) {
    timer_invulnerabilidade -= 1;
    
    if (timer_invulnerabilidade <= 0) {
        invulneravel = false;
    }
}

// ===== VERIFICAR SE MORREU =====
if (vidas <= 0 && !morreu) {
    morreu = true;
    speed_moviment = 0;
    pode_atirar = false;
    alarm[1] = 120;
    
    // ===== SOM DE GAME OVER =====
    audio_stop_all();
    audio_play_sound(snd_game_over, 10, false);
}