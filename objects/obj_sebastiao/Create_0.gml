// ===== MOVIMENTO =====

speed_moviment = 5;
// Velocidade de movimento do personagem em pixels por frame

// ===== DIREÇÃO =====

ultima_direcao = "direita";
// Guarda para onde o personagem está olhando
// Usado para saber onde criar o tiro
// Valores possíveis: "direita", "esquerda"

// ===== SISTEMA DE TIRO =====

pode_atirar = true;
// Boolean que controla se pode disparar
// true = pode atirar
// false = não pode (está em cooldown)

cooldown_tiro = 20;
// Tempo em frames que deve esperar entre tiros
// 20 frames = ~0.33 segundos (em 60 FPS)
// Quanto maior, mais lento o tiro
// Quanto menor, pode atirar mais rápido

timer_cooldown = 0;
// Contador regressivo do cooldown
// Quando está > 0, está contando
// Quando chega a 0, pode atirar novamente

// ===== ANIMAÇÃO DE ATIRAR =====

esta_atirando = false;
// Flag que indica se está na animação de tiro
// true = mostra sprite de atirar
// false = mostra sprites normais (andar/parado)

timer_animacao_tiro = 0;
// Contador para duração da animação de tiro
// Conta regressivamente até 0

duracao_animacao_tiro = 20;
// Quantos frames a animação de tiro dura
// 15 frames = ~0.25 segundos (em 60 FPS)
// Ajuste: 10 = mais rápido, 20 = mais lento