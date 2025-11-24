// ===== SISTEMA DE SPAWN AUTOMÁTICO =====

if (spawner_ativo) {
    // Se spawner está ativo
    
    // Diminui timer a cada frame
    timer_spawn -= 1;
    // A cada frame: 90 → 89 → 88 → ... → 1 → 0
    
    // Quando timer chega a 0, tenta spawnar
    if (timer_spawn <= 0) {
        
        // ===== VERIFICA LIMITE DE INIMIGOS =====
        
        // instance_number(objeto) = conta quantos objetos existem
        var quantidade_atual = instance_number(obj_inimigo);
        
        if (quantidade_atual < maximo_inimigos) {
            // Se ainda não atingiu máximo, pode spawnar
            
            // ===== PEGA INFORMAÇÕES DA CÂMERA =====
            
            // view_camera[0] = câmera do viewport 0
            var cam = view_camera[0];
            
            // Posição da câmera
            var cam_x = camera_get_view_x(cam);
            var cam_y = camera_get_view_y(cam);
            
            // Tamanho da visão da câmera
            var cam_width = camera_get_view_width(cam);
            var cam_height = camera_get_view_height(cam);
            
            // ===== ESCOLHE LADO ALEATÓRIO =====
            
            // choose() = escolhe aleatoriamente entre as opções
            var lado = choose("esquerda", "direita");
            // Só esquerda/direita (horizontal)
            // Para também cima/baixo, use:
            // var lado = choose("esquerda", "direita", "cima", "baixo");
            
            // Variáveis para posição do spawn
            var spawn_x;
            var spawn_y;
            
            // ===== CALCULA POSIÇÃO BASEADO NO LADO =====
            
            switch(lado) {
                case "esquerda":
                    // Spawna À ESQUERDA da tela (fora da visão)
                    spawn_x = cam_x - distancia_spawn;
                    // cam_x - 250 = 250 pixels antes do início da câmera
                    
                    // Altura aleatória dentro da tela
                    spawn_y = random_range(cam_y + 100, cam_y + cam_height - 100);
                    // +100 e -100 = margem para não spawnar muito na borda
                    break;
                    
                case "direita":
                    // Spawna À DIREITA da tela (fora da visão)
                    spawn_x = cam_x + cam_width + distancia_spawn;
                    // cam_x + cam_width + 250 = 250 pixels depois do fim da câmera
                    
                    spawn_y = random_range(cam_y + 100, cam_y + cam_height - 100);
                    break;
                    
                case "cima":
                    // Spawna ACIMA da tela (fora da visão)
                    spawn_x = random_range(cam_x + 100, cam_x + cam_width - 100);
                    spawn_y = cam_y - distancia_spawn;
                    break;
                    
                case "baixo":
                    // Spawna ABAIXO da tela (fora da visão)
                    spawn_x = random_range(cam_x + 100, cam_x + cam_width - 100);
                    spawn_y = cam_y + cam_height + distancia_spawn;
                    break;
            }
            
            // ===== CRIA O INIMIGO =====
            
            // instance_create_layer(x, y, layer, objeto)
            var novo_inimigo = instance_create_layer(spawn_x, spawn_y, "Instances", obj_inimigo);
            // IMPORTANTE: "Instances" deve ser o nome da sua layer
            // Se sua layer tem nome diferente, mude aqui
            
            // ===== OPCIONAL: EFEITOS =====
            
            // Som de spawn
            // audio_play_sound(snd_spawn_alien, 5, false);
            
            // Efeito visual de spawn
            // instance_create_layer(spawn_x, spawn_y, "Instances", obj_efeito_spawn);
            
            // Debug (para ver onde spawnando)
            // show_debug_message("Inimigo spawnado: " + lado + " em (" + string(spawn_x) + ", " + string(spawn_y) + ")");
        }
        
        // ===== RESETA TIMER =====
        timer_spawn = tempo_entre_spawns;
        // Volta para 90 e começa contagem de novo
    }
}

// ===== OPCIONAL: PAUSAR SPAWNER =====
// Adicione controle manual se quiser
// if (keyboard_check_pressed(ord("P"))) {
//     spawner_ativo = !spawner_ativo;
//     show_debug_message("Spawner: " + (spawner_ativo ? "ATIVADO" : "PAUSADO"));
// }
