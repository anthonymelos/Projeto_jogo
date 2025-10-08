/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== LIMITAR MOVIMENTO NA TELA =====
// clamp(valor, minimo, maximo)
// Garante que x fica entre 15 e room_width-15
x = clamp(x, 15, room_width - 15);
y = 962

// ===== MOVIMENTO HORIZONTAL =====
// keyboard_check(tecla) = verifica se está PRESSIONADA
// Melhor que Key Down para movimento contínuo

var movendo = false; // Flag para saber se está andando

if (keyboard_check(ord("A"))) {
    // ord("A") = código ASCII da tecla A
    // Move para esquerda
    x -= speed_moviment;
    
    // Atualiza sprite e direção
    sprite_index = spr_bastiao_mov_esquerda;
    ultima_direcao = "esquerda";
    movendo = true;
    
    // Velocidade da animação
    image_speed = 1;
}

if (keyboard_check(ord("D"))) {
    // Move para direita
    x += speed_moviment;
    
    // Atualiza sprite e direção
    sprite_index = spr_bastiao_mov_direita;
    ultima_direcao = "direita";
    movendo = true;
    
    image_speed = 1;
}

// ===== SPRITE PARADO =====
// Se não está apertando nada, fica parado
if (!movendo) {
    // ! = NOT (negação)
    // !movendo = "se NÃO está movendo"
    
    // Mantém sprite da última direção
    if (ultima_direcao == "esquerda") {
        sprite_index = spr_sebastiao_parado_esq;
    } else {
        sprite_index = spr_sebastiao_parado_dir;
    }
    
    // Animação mais lenta quando parado
    image_speed = 0.3;
}

// ===== COOLDOWN DO TIRO =====
if (timer_cooldown > 0) {
    timer_cooldown -= 5; // Diminui 5 a cada frame
    pode_atirar = false;
} else {
    pode_atirar = true;
}

// ===== SISTEMA DE DISPARO =====
// keyboard_check_pressed = verifica se FOI APERTADA (uma vez)
// Diferente de keyboard_check (segurar)
if (keyboard_check_pressed(vk_space) && pode_atirar) {
    // vk_space = constante do GameMaker para tecla ESPAÇO
    // && = E (ambas condições devem ser true)
    
	
    // Cria o tiro
    var tiro = instance_create_layer(x, y, "Instances", obj_disparo);
    // IMPORTANTE: "Instances" com I maiúsculo (padrão do GM)

    
    // Passa informações para o tiro
    tiro.direcao_tiro = ultima_direcao;
    // O tiro vai saber para onde ir
    
    // Posiciona o tiro na frente do personagem
    if (ultima_direcao == "direita") {
        tiro.x = x + 20; // 20 pixels à frente
        tiro.image_angle = 0; // Sem rotação
		
		y = 962
    } else {
        tiro.x = x - 20; // 20 pixels atrás
        tiro.image_angle = 180; // Rotacionado 180°
		
		y = 962
    }
    
    // Inicia cooldown
    timer_cooldown = cooldown_tiro;
    
    // OPCIONAL: Som de tiro
    // audio_play_sound(snd_tiro, 1, false);
}


