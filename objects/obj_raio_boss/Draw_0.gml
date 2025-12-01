// ===== DESENHAR RAIO COM DEBUG =====

// Desenha a sprite
draw_self();

// DEBUG: Desenha retângulo da hitbox
if (raio_ativo) {
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_set_color(c_green);
}

// DEBUG: Texto
draw_set_color(c_yellow);
draw_text(x, y - 20, raio_ativo ? "ATIVO" : "AVISO");
draw_set_color(c_white);