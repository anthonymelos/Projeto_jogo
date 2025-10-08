// ===== COLISÃO COM INIMIGO =====
// Este código executa automaticamente quando obj_disparo
// colide (toca) em obj_inimigo

if (!ja_acertou) {
    // ! = NOT (negação)
    // Se ainda NÃO acertou ninguém
    // Esta verificação GARANTE que mata apenas 1 inimigo
    // Mesmo que o tiro atravesse vários inimigos
    
    // ===== MARCAR QUE JÁ ACERTOU =====
    
    ja_acertou = true;
    // Muda flag para true
    // Se colidir com um segundo inimigo, não entrará neste if
    // Resultado: segundo inimigo NÃO morre
    
    // ===== DESTRUIR O INIMIGO =====
    
    // with(objeto/id)
    // O que é: Executa código NO CONTEXTO de outro objeto
    // Tudo dentro das chaves {} executa "como se fosse" o outro objeto
    
    // other
    // O que é: Palavra-chave especial do GameMaker
    // Em eventos de colisão, significa "o outro objeto da colisão"
    // Aqui: other = o obj_inimigo que colidiu com este tiro
    
    with(other) {
        // Agora estamos no contexto do INIMIGO
        // Tudo aqui executa como se fosse o código do inimigo
        
        instance_destroy();
        // Destrói o INIMIGO (não o tiro)
        // Porque estamos dentro do with(other)
        
        // ===== OPCIONAIS (descomente se quiser usar) =====
        
        // Criar efeito visual de explosão:
        // instance_create_layer(x, y, "Instances", obj_explosao);
        // Cria objeto de explosão na posição do inimigo
        
        // Tocar som de morte:
        // audio_play_sound(snd_morte_inimigo, 10, false);
        // Parâmetros: (som, prioridade, loop)
        // 10 = prioridade média
        // false = toca uma vez (não repete)
        
        // Criar partículas de sangue/fumaça:
        // repeat(5) {
        //     instance_create_layer(x, y, "Instances", obj_particula);
        // }
        // Cria 5 partículas na posição do inimigo
        
        // Adicionar pontos:
        // global.pontos += 10;
        // Aumenta variável global de pontuação
    }
    
    // ===== DESTRUIR O PRÓPRIO TIRO =====
    
    instance_destroy();
    // Agora voltamos ao contexto do TIRO (saímos do with)
    // Destrói o próprio tiro
    // Não queremos que continue voando depois de matar
}

// Se ja_acertou == true (já matou alguém):
// - Não entra no if
// - Não executa o código dentro
// - Segundo inimigo NÃO morre
// - Tiro continua voando até alcance máximo ou sair da tela