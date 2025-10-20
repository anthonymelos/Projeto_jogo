// ===== DESENHAR TELA HOME =====

// ===== VERIFICAR SE ESTÁ NA ROOM CERTA =====

if (room != room_home) {
    // Se NÃO está na room_home
    instance_destroy();
    exit;
    // exit para o código aqui (não desenha nada)
}


// Desenha sprite preenchendo a tela
draw_set_alpha(alpha_tela);
draw_sprite_stretched(sprite_home, 0, 0, 0, room_width, room_height);
// draw_sprite_stretched estica sprite para preencher área
// (sprite, subimage, x, y, largura, altura)
draw_set_alpha(1);
