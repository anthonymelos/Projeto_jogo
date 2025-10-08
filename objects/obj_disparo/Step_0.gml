// ===== CONTROLE DA ANIMAÇÃO (TOCA APENAS 1 VEZ) =====

if (!animacao_terminou) {
    // ! = operador NOT (negação)
    // Se ainda NÃO terminou de animar
    
    // image_index = frame atual da animação (0, 1, 2, 3...)
    // image_number = quantidade total de frames da sprite
    
    if (image_index >= image_number - 1) {
        // >= = maior ou igual
        // image_number - 1 = último frame
        // Exemplo: se sprite tem 4 frames (0,1,2,3), último é 3
        // Quando chega no último frame...
        
        image_index = image_number - 1;
        // Força ficar travado no último frame
        // Não deixa voltar para o frame 0
        
        image_speed = 0;
        // Para a animação completamente
        // 0 = não anima mais (congela)
        
        animacao_terminou = true;
        // Marca que a animação terminou
        // Na próxima vez não entra mais neste if
    }
}

// ===== MOVIMENTO DO TIRO =====

// Move o tiro baseado na direção que foi disparado
if (direcao_tiro == "direita") {
    x += velocidade_tiro;
    // += significa x = x + velocidade_tiro
    // Adiciona pixels à posição horizontal
    // Resultado: move para DIREITA
    
} else if (direcao_tiro == "esquerda") {
    x -= velocidade_tiro;
    // -= significa x = x - velocidade_tiro
    // Subtrai pixels da posição horizontal
    // Resultado: move para ESQUERDA
}

// ===== CONTADOR DE DISTÂNCIA =====

distancia_percorrida += velocidade_tiro;
// Adiciona a velocidade ao contador a cada frame
// Exemplo: 0 → 12 → 24 → 36 → ... → 300
// Usado para saber quando destruir o tiro

// ===== DESTRUIR POR ALCANCE MÁXIMO =====

if (distancia_percorrida >= alcance_maximo) {
    // Se já viajou 300 pixels ou mais...
    
    instance_destroy();
    // Função nativa que DESTRÓI este objeto
    // Remove o tiro da room
    // Libera memória
    // Evita que fique voando infinitamente
}

// ===== DESTRUIR SE SAIR DA TELA =====

// room_width = largura da room (1920 no seu caso)
// room_height = altura da room (1080 no seu caso)

if (x < 0 || x > room_width || y < 0 || y > room_height) {
    // || = operador lógico OR (OU)
    // Se QUALQUER condição for verdadeira:
    //   x < 0 = saiu pela borda ESQUERDA
    //   x > room_width = saiu pela borda DIREITA
    //   y < 0 = saiu pela borda de CIMA
    //   y > room_height = saiu pela borda de BAIXO
    
    instance_destroy();
    // Destrói o tiro
    // Evita acumular tiros fora da tela
    // Melhora performance
}