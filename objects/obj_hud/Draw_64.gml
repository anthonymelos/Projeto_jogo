// ===== VERIFICAR VARIÁVEIS GLOBAIS =====

if (!variable_global_exists("boss_invocado")) {
    global.boss_invocado = false;
}


if (!variable_global_exists("boss_morto")) {
    global.boss_morto = false;
}

// ===== BARRA DE VIDA DO BASTIÃO =====

if (instance_exists(obj_sebastiao)) {
    var vidas_atual = obj_sebastiao.vidas;
    var vidas_max = obj_sebastiao.vidas_maximas;
    
    // Posição da barra
    var barra_x = 20;
    var barra_y = 20;
    var barra_largura = 150;
    var barra_altura = 20;
    
    // Progresso da vida (0.0 a 1.0)
    var progresso_vida = vidas_atual / vidas_max;
    progresso_vida = clamp(progresso_vida, 0, 1);
    
    // Fundo da barra (vermelho escuro)
    draw_set_color(c_maroon);
    draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);
    
    // Cor da barra baseada na vida
    var cor_vida = c_red;
    if (progresso_vida > 0.6) {
        cor_vida = c_lime; // Verde se vida alta
    } else if (progresso_vida > 0.3) {
        cor_vida = c_yellow; // Amarelo se vida média
    }
    
    // Barra de vida
    draw_set_color(cor_vida);
    var largura_vida = barra_largura * progresso_vida;
    draw_rectangle(barra_x, barra_y, barra_x + largura_vida, barra_y + barra_altura, false);
    
    // Contorno da barra
    draw_set_color(c_white);
    draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, true);
    
}

// ===== MOSTRAR CONTADOR / STATUS DO BOSS =====

draw_set_color(c_yellow);
draw_set_halign(fa_left);

if (!global.boss_invocado) {
    // Boss ainda não apareceu
    
    var faltam = global.inimigos_para_boss - global.inimigos_mortos;
    draw_set_color(c_red);
    draw_text(20, 70, "Boss em: " + string(faltam));
    
} else if (instance_exists(obj_boss)) {
    
    // Indicador de estado
    draw_set_color(c_white);
    var estado_texto = obj_boss.estado == "parado" ? "ATAQUE!" : "DESVIE!";
    draw_text(20, 90, estado_texto);
    
    // Seta piscante para a direita
    if ((current_time div 300) mod 2 == 0) {
        draw_set_color(c_black);
        draw_set_halign(fa_right);
        draw_text(620, 240, ">>>");
        draw_set_halign(fa_center);
        draw_text(580, 260, "   GO!");
        draw_set_halign(fa_left);
    }
    
} 

draw_set_color(c_white);
draw_set_halign(fa_left);