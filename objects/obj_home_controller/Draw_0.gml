// ===== DESENHAR TELA HOME =====

// Desenha sprite preenchendo a tela
draw_set_alpha(alpha_tela);
draw_sprite_stretched(sprite_home, 0, 0, 0, room_width, room_height);
// draw_sprite_stretched estica sprite para preencher área
// (sprite, subimage, x, y, largura, altura)
draw_set_alpha(1);
