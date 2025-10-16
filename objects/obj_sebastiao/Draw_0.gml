/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== DESENHAR PERSONAGEM COM EFEITO DE INVULNERABILIDADE =====

if (invulneravel) {
    // Se está invulnerável, pisca
    
    // Alterna entre visível e invisível
    if ((timer_invulnerabilidade div 5) mod 2 == 0) {
        // div = divisão inteira
        // mod = resto da divisão (módulo)
        // Resultado: pisca a cada 5 frames
        
        draw_self();
        // Desenha sprite normal
    }
    // Quando não entra no if, não desenha nada (invisível)
    
} else {
    // Se não está invulnerável, desenha normalmente
    draw_self();
}

// ALTERNATIVA: Piscar em vermelho ao invés de invisível
// if (invulneravel && (timer_invulnerabilidade mod 10) < 5) {
//     draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 
//                     image_angle, c_red, image_alpha);
// } else {
//     draw_self();
// }



