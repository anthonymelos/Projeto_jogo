/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// ===== COLISÃO COM INIMIGO =====
// Este código executa quando Bastião toca em um alien

if (!invulneravel && !morreu) {
    // Se NÃO está invulnerável E NÃO morreu ainda
    
    // ===== PERDE UMA VIDA =====
    vidas -= 1;
    
    // Ativa invulnerabilidade temporária
    invulneravel = true;
    timer_invulnerabilidade = tempo_invulnerabilidade;
    
    // ===== FEEDBACK VISUAL/SONORO =====
    
    // Som de dano
    // audio_play_sound(snd_dano, 10, false);
    
    // Empurra jogador para trás (knockback)
    var direcao_empurrao = point_direction(other.x, other.y, x, y);
    // Calcula direção do inimigo para o jogador
    // other = obj_inimigo que colidiu
    
    // Aplica empurrão
    hspeed = lengthdir_x(8, direcao_empurrao);
    vspeed = lengthdir_y(8, direcao_empurrao);
    // lengthdir_x/y = componentes X e Y de um vetor
    // 8 = força do empurrão (ajuste conforme necessário)
    
    // Cria efeito de dano
    // instance_create_layer(x, y, "Instances", obj_efeito_dano);
    
    // Debug
    show_debug_message("Tomou dano! Vidas restantes: " + string(vidas));
    
    // ===== DESTRÓI INIMIGO QUE TOCOU =====
    with(other) {
        // other = obj_inimigo
        
        // Animação de morte
        sprite_index = spr_alien_morrendo;
        image_index = 0;
        image_speed = 1;
        esta_morrendo = true;
        speed = 0;
    }
}


