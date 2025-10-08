/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// ===== COLISÃO COM INIMIGO =====
// Este código executa quando tiro colide com inimigo

if (!ja_acertou) {
    // ! = NOT (negação)
    // Se ainda NÃO acertou ninguém
    // GARANTE QUE MATA APENAS 1 INIMIGO
    
    ja_acertou = true;
    // Marca que já acertou
    
    // Destrói o inimigo
    with(other) {
        // other = o inimigo que colidiu
        // Código dentro do with executa no contexto do inimigo
        
        instance_destroy();
        // Destrói o inimigo
        
        // OPCIONAL: Efeito visual
        // instance_create_layer(x, y, "Effects", obj_explosao);
        
        // OPCIONAL: Som
        // audio_play_sound(snd_morte, 1, false);
    }
    
    // Destrói o próprio tiro
    instance_destroy();
}

// Se ja_acertou = true, não entra no if
// Resultado: não mata um segundo inimigo


