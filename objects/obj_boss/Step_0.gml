// ===== MÁQUINA DE ESTADOS DO BOSS =====

switch(estado) {
    
    case "parado":
        sprite_index = spr_boss_parado;
        invulneravel = false;
        
        timer_parado -= 1;
        
        if (timer_parado <= 0) {
            estado = "atacando";
            timer_preparacao = tempo_preparando_ataque;
            raios_lancados = 0;
            
           
        }
        break;
    
    case "atacando":
        sprite_index = spr_boss_ataque;
        invulneravel = true;
        
        timer_preparacao -= 1;
        
        if (timer_preparacao == 0 && raios_lancados < total_raios) {
            
            if (instance_exists(obj_sebastiao)) {
                var raio_x = obj_sebastiao.x;
            } else {
                var raio_x = room_width / 2;
            }
            
            var raio = instance_create_layer(raio_x, 0, "Instances", obj_raio_boss);
            
           
            
        
            
            raios_lancados += 1;
        }
        
        if (timer_preparacao < -30) {
            estado = "parado";
            timer_parado = tempo_parado;
            raios_lancados = 0;
            
          
        }
        
        break;
    
    case "morrendo":
        sprite_index = spr_boss_morrendo;
        invulneravel = true;
        
        if (image_index >= image_number - 1) {
            
            global.boss_morto = true;
            
            
            // ===== SOM DE BOSS MORRENDO =====
            audio_play_sound(snd_boss_morte, 10, false);
            
            room_goto(room_vitoria);
        }
        break;
}

// ===== VERIFICAR SE MORREU =====

if (hp_boss <= 0 && estado != "morrendo") {
    estado = "morrendo";
    image_index = 0;
    image_speed = 1;
    
}