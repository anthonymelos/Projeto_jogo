// ===== COLISÃO DO TIRO COM INIMIGO =====

if (!ja_acertou) {
    // Se este tiro ainda não matou ninguém
    
    ja_acertou = true;
    // Marca que já matou (mata apenas 1 inimigo)
    
    with(other) {
        // other = obj_inimigo que foi atingido
        // Código aqui executa no contexto do inimigo
        
        // ===== CRIA CADÁVER NA POSIÇÃO DO INIMIGO =====
        instance_create_layer(x, y, "Instances", obj_alien_cadaver);
        // Cria obj_alien_cadaver exatamente onde inimigo está
        // "Instances" = nome da layer (ajuste se diferente)
        
        // ===== DESTRÓI INIMIGO IMEDIATAMENTE =====
        instance_destroy();
        // Inimigo desaparece na hora
        // Só fica o cadáver no lugar (que não tem colisão)
        
        // OPCIONAL: Adicionar pontos
        // if (instance_exists(obj_sebastiao)) {
        //     obj_sebastiao.pontos += 10;
        // }
    }
    
    // ===== DESTRÓI O TIRO =====
    instance_destroy();
    // Tiro some após matar inimigo
}

// IMPORTANTE: Não precisa verificar se inimigo está morrendo
// porque inimigo é destruído IMEDIATAMENTE
// Cadáver é objeto diferente (sem colisão com tiro)