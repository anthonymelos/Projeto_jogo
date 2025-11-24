/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== VERIFICAR SE ESTÁ NA ROOM CERTA =====

if (room != room_contexto) {
    // Se NÃO está na room_contexto
    instance_destroy();
    exit;
}

// ===== DESENHAR TELA DE CONTEXTO =====

// Desenha sprite com história e controles
draw_set_alpha(alpha_tela);
draw_sprite_stretched(sprite_contexto, 0, 0, 0, room_width, room_height);
draw_set_alpha(1);
