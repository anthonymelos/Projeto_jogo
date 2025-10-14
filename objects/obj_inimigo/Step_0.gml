/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

y = 410

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



