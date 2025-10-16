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

vidas = 3;
// Quantidade de vidas
// Começa com 3 vidas

vidas_maximas = 3;
// Máximo de vidas possíveis
// Útil se quiser power-up que dá vida extra

invulneravel = false;
// Flag de invulnerabilidade temporária
// true = não pode tomar dano

tempo_invulnerabilidade = 120;
// Frames de invulnerabilidade após tomar dano
// 120 frames = 2 segundos (em 60 FPS)

timer_invulnerabilidade = 0;
// Contador da invulnerabilidade

morreu = false;
// Flag se o jogador morreu
// Usado para controlar transição para Game Over

pontos = 0;
// Contador de pontos