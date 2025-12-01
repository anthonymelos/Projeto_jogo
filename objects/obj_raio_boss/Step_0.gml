// ===== FASE 1: AVISO =====

if (!raio_ativo) {
    
    timer_aviso -= 1;
    
    // Pisca vermelho para avisar
    image_alpha = 0.4 + (sin(current_time / 80) * 0.3);
    // Oscila entre 0.1 e 0.7
    
    image_blend = c_red;
    // Cor vermelha durante aviso
    
    if (timer_aviso <= 0) {
     
        raio_ativo = true;
        image_alpha = 1;
        image_blend = c_white;
        // Cor normal
        
        // Ativa colisão
        mask_index = sprite_index;
        
      
        
    
    }
}

// ===== FASE 2: RAIO ATIVO =====

else {
    
    timer_raio -= 1;
    
    if (timer_raio <= 0) {
        show_debug_message("Raio destruído!");
        instance_destroy();
    }
}