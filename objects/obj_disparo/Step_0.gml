/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== MOVIMENTO DO TIRO =====

// Move baseado na direção que foi disparado
if (direcao_tiro == "direita") {
    x += velocidade_tiro;
    // Adiciona à posição x (move para direita)
} else if (direcao_tiro == "esquerda") {
    x -= velocidade_tiro;
    // Subtrai da posição x (move para esquerda)
}

// ===== CONTADOR DE DISTÂNCIA =====
distancia_percorrida += velocidade_tiro;
// Adiciona velocidade ao contador
// Exemplo: 0 → 12 → 24 → 36 → ... → 300

// ===== DESTRUIR SE PASSAR DO ALCANCE =====
if (distancia_percorrida >= alcance_maximo) {
    // >= = maior ou igual
    // Se já viajou 300 pixels ou mais...
    
    instance_destroy();
    // Destrói este tiro (libera memória)
}

// ===== DESTRUIR SE SAIR DA TELA =====
// room_width = largura da room (1920 no seu caso)
if (x < 0 || x > room_width) {
    // || = OU (se qualquer condição for true)
    // x < 0 = saiu pela esquerda
    // x > room_width = saiu pela direita
    
    instance_destroy();
}



