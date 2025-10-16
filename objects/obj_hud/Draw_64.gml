/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (instance_exists(obj_sebastiao)) {
    var vidas_atual = obj_sebastiao.vidas;
    var vidas_max = obj_sebastiao.vidas_maximas;
    
    // Barra de vida
    var barra_largura = 200;
    var barra_altura = 20;
    var barra_x = 20;
    var barra_y = 20;
    
    // Fundo da barra (vermelho escuro)
    draw_set_color(c_maroon);
    draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);
    
    // Barra de vida (verde)
    var largura_vida = (vidas_atual / vidas_max) * barra_largura;
    draw_set_color(c_lime);
    draw_rectangle(barra_x, barra_y, barra_x + largura_vida, barra_y + barra_altura, false);
    
    // Contorno
    draw_set_color(c_white);
    draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, true);
    
    // Texto
    draw_text(barra_x, barra_y + 25, string(vidas_atual) + " / " + string(vidas_max));
}


