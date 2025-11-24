// ===== DESENHAR BOSS =====
draw_self();

// ===== BARRA DE VIDA =====

var barra_x = x - 100;
var barra_y = y - 50;
var barra_largura = 200;
var barra_altura = 20;

var progresso_vida = hp_boss / hp_maximo;
progresso_vida = clamp(progresso_vida, 0, 1);

// Fundo
draw_set_color(c_maroon);
draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);

// Barra de HP
var cor_vida = c_red;
if (progresso_vida > 0.6) {
    cor_vida = c_lime;
} else if (progresso_vida > 0.3) {
    cor_vida = c_yellow;
}

draw_set_color(cor_vida);
var largura_vida = barra_largura * progresso_vida;
draw_rectangle(barra_x, barra_y, barra_x + largura_vida, barra_y + barra_altura, false);

// Contorno
draw_set_color(c_white);
draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, true);

// Indicador de estado
draw_set_halign(fa_center);
draw_set_color(c_yellow);

draw_set_halign(fa_left);
draw_set_color(c_white);