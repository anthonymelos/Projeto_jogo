/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

y = 440

// ===== CONTROLE DA ANIMAÇÃO DE MORTE =====

if (esta_morrendo) {
    // Se está na animação de morte
    
    // image_index = frame atual da animação
    // image_number = total de frames da sprite
    
    if (image_index >= image_number - 1) {
        // Se chegou no último frame da animação
        // image_number - 1 porque frames começam em 0
        // Exemplo: 4 frames = 0, 1, 2, 3 (último é 3)
        
        instance_destroy();
        // Destrói o inimigo depois da animação completa
        
        // OPCIONAL: Criar efeito de fumaça/explosão
        // instance_create_layer(x, y, "Instances", obj_fumaca);
        
        // OPCIONAL: Adicionar pontos
        // global.pontos += 10;
    }
}

// ===== MOVIMENTO DO INIMIGO (se tiver) =====
// Só se move se NÃO está morrendo
if (!esta_morrendo) {
    // Adicione código de movimento aqui se quiser que inimigo ande
    // Exemplo:
    // x += velocidade_inimigo;
}


// ===== CÓDIGO DE MORTE (já tem) =====
if (esta_morrendo) {
    if (image_index >= image_number - 1) {
        instance_destroy();
    }
}

// ===== MOVIMENTO AUTOMÁTICO (NOVO) =====

if (!esta_morrendo) {
    // Só se move se não está morrendo
    
    // OPÇÃO A: Movimento em direção ao jogador
    if (instance_exists(obj_sebastiao)) {
        // Calcula direção para o Bastião
        var direcao_alvo = point_direction(x, y, obj_sebastiao.x, obj_sebastiao.y);
        
        // Gira suavemente em direção ao alvo
        direction = lerp(direction, direcao_alvo, 0.05);
        // 0.05 = 5% de interpolação (movimento suave)
        // Maior = gira mais rápido
        
        speed = velocidade_inimigo;
    }
    
    
    // ===== DESTRUIR SE SAIR MUITO DA ROOM =====
    // Evita acumular inimigos longe
    if (x < -500 || x > room_width + 500 || 
        y < -500 || y > room_height + 500) {
        instance_destroy();
        // Destrói se ficar muito longe
    }
}

if (esta_morrendo && image_index >= image_number - 1) {
    // Antes de destruir, adiciona pontos
    if (instance_exists(obj_sebastiao)) {
        obj_sebastiao.pontos += 10;
    }
    instance_destroy();
}



