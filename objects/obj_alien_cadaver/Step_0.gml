/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// ===== DESTRUIR QUANDO ANIMAÇÃO TERMINAR =====

// image_index = frame atual da animação (0, 1, 2, 3...)
// image_number = total de frames da sprite

if (image_index >= image_number - 1) {
    // Se chegou no último frame da animação
    // Exemplo: se tem 4 frames (0,1,2,3), último é 3
    
    instance_destroy();
    // Destrói o cadáver
    // Cadáver some após animação completa
}

// ===== OPCIONAL: FADE OUT =====
// Descomente se quiser que vá sumindo gradualmente

// image_alpha -= 0.02;
// // Reduz opacidade 2% por frame
// // Começa em 1.0 (opaco) e vai até 0.0 (invisível)

// if (image_alpha <= 0) {
//     // Quando ficar totalmente invisível
//     instance_destroy();
// }


