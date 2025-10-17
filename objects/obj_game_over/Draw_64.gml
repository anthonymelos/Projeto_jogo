/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// ===== DESENHAR TELA DE GAME OVER =====

// Fundo escuro semi-transparente
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, 640, 480, false);
draw_set_alpha(1);

// Título GAME OVER
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Aumenta tamanho da fonte (se tiver fonte customizada)
// draw_set_font(fnt_grande);

draw_text(320, 150, "GAME OVER");

// Volta configurações
draw_set_color(c_white);

// Instruções
if (pode_reiniciar) {
    draw_text(320, 250, "Pressione ESPACO para Reiniciar");
    draw_text(320, 280, "Pressione ESC para Sair");
    
    // Pisca texto (efeito)
    if ((current_time div 500) mod 2 == 0) {
        // current_time = tempo em milissegundos desde início
        // Pisca a cada 0.5 segundos
        draw_set_color(c_yellow);
        draw_text(320, 320, "▼ REINICIAR ▼");
    }
} else {
    // Ainda não pode reiniciar
    var segundos = ceil(timer_espera / 60);
    draw_text(320, 250, "Aguarde... " + string(segundos));
}

// Volta configurações
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);


// Mostra pontuação final
if (instance_exists(obj_sebastiao)) {
    draw_text(320, 200, "Pontuação: " + string(obj_sebastiao.pontos));
}

