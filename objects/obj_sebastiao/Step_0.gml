// ===== LIMITAR MOVIMENTO NA TELA =====

// clamp(valor, minimo, maximo)
// O que faz: Garante que valor fica entre mínimo e máximo
// Exemplo: clamp(10, 0, 5) = 5 (não pode passar de 5)
//          clamp(-5, 0, 10) = 0 (não pode ser menor que 0)

x = clamp(x, 15, room_width - 15);
// Limita posição x entre 15 e (1920-15=1905)
// Resultado: personagem não sai da tela nas laterais
// 15 pixels de margem de cada lado

// ===== ANIMAÇÃO DE TIRO (Contador Regressivo) =====

if (esta_atirando) {
    // Se está na animação de atirar
    
    timer_animacao_tiro -= 1;
    // Diminui 1 a cada frame (contagem regressiva)
    // Exemplo: 15 → 14 → 13 → ... → 1 → 0
    
    if (timer_animacao_tiro <= 0) {
        // Quando chega a 0 ou menos
        esta_atirando = false;
        // Desativa flag de atirar
        // Personagem volta às sprites normais
    }
}

// ===== MOVIMENTO HORIZONTAL =====

var movendo = false;
// Variável local (var) para saber se está se movendo
// false = parado, true = andando
// Usada para definir sprite de parado no final

// IMPORTANTE: Só permite movimento se NÃO está atirando
if (!esta_atirando) {
    // Se NÃO está na animação de tiro
    // Permite andar normalmente
    
    // keyboard_check(tecla)
    // O que faz: Verifica se tecla está PRESSIONADA
    // Retorna: true (pressionada) ou false (não pressionada)
    // Diferença de keyboard_check_pressed: check = segurar, pressed = apertar
    
    if (keyboard_check(ord("A"))) {
        // ord("A") = código ASCII da tecla A
        // Move para esquerda
        
        x -= speed_moviment;
        // -= significa x = x - speed_moviment
        // Subtrai da posição x (move para esquerda)
        
        sprite_index = spr_bastiao_mov_esquerda;
        // Troca para sprite de andar para esquerda
        
        ultima_direcao = "esquerda";
        // Atualiza direção (para o tiro)
        
        movendo = true;
        // Marca que está se movendo
        
        image_speed = 1;
        // Velocidade da animação = normal
    }
    
    if (keyboard_check(ord("D"))) {
        // Move para direita
        
        x += speed_moviment;
        // += significa x = x + speed_moviment
        // Adiciona à posição x (move para direita)
        
        sprite_index = spr_bastiao_mov_direita;
        ultima_direcao = "direita";
        movendo = true;
        image_speed = 1;
    }
    
    // ===== SPRITE PARADO =====
    
    if (!movendo) {
        // Se NÃO está movendo (não apertou A nem D)
        
        // Mantém sprite da última direção que estava olhando
        if (ultima_direcao == "esquerda") {
            sprite_index = spr_sebastiao_parado_esq;
        } else {
            sprite_index = spr_sebastiao_parado_dir;
        }
        
        image_speed = 0.3;
        // Animação mais lenta quando parado
    }
}

// ===== SPRITE DE ATIRAR =====
// IMPORTANTE: Isso fica FORA do if (!esta_atirando)
// Para sobrescrever as outras sprites quando está atirando

if (esta_atirando) {
    // Se está na animação de tiro
    // Sobrescreve qualquer sprite anterior
    
    if (ultima_direcao == "esquerda") {
        sprite_index = spr_atirando_esquerda;
    } else {
        sprite_index = spr_atirando_direita;
    }
    
    image_speed = 1;
    // Velocidade normal da animação de tiro
}

// ===== COOLDOWN DO TIRO =====

if (timer_cooldown > 0) {
    // Se o timer está contando (maior que 0)
    
    timer_cooldown -= 1;
    // Diminui 1 a cada frame (contagem regressiva)
    
    pode_atirar = false;
    // Bloqueia o tiro enquanto está em cooldown
    
} else {
    // Quando timer chega a 0
    pode_atirar = true;
    // Libera o tiro novamente
}

// ===== SISTEMA DE DISPARO =====

// keyboard_check_pressed(tecla)
// O que faz: Verifica se tecla foi APERTADA NESTE FRAME
// Diferença: check = segurar, check_pressed = apertar uma vez
// Resultado: dispara apenas 1 tiro por clique/aperto

if (keyboard_check_pressed(vk_space) && pode_atirar) {
    // vk_space = constante do GameMaker para tecla ESPAÇO
    // && = operador lógico AND (E)
    // Só executa se AMBAS condições forem true:
    //   1. Apertou espaço
    //   2. pode_atirar é true (não está em cooldown)
    
    // ===== INICIA ANIMAÇÃO DE TIRO =====
    
    esta_atirando = true;
    // Ativa flag de atirar
    
    timer_animacao_tiro = duracao_animacao_tiro;
    // Reseta o timer para 15 frames
    // Inicia contagem regressiva da animação
    
    // ===== CRIAR O TIRO =====
    
    // instance_create_layer(x, y, layer, objeto)
    // O que faz: CRIA um novo objeto na room
    // Parâmetros:
    //   x, y = posição onde criar
    //   layer = nome da layer (string)
    //   objeto = qual objeto criar
    // Retorna: id do objeto criado (para manipular)
    
    var tiro = instance_create_layer(x, y, "Instances", obj_disparo);
    // var = declara variável LOCAL (existe só neste evento)
    // tiro = guarda referência ao objeto criado
    // "Instances" = nome da layer (DEVE EXISTIR na room)
    // IMPORTANTE: Se sua layer tem nome diferente, mude aqui
    
    // ===== CONFIGURAR DIREÇÃO DO TIRO =====
    
    // tiro.variavel = acessa variável do objeto criado
    tiro.direcao_tiro = ultima_direcao;
    // Passa a direção para o tiro
    
    // ===== POSICIONAR O TIRO =====
    
    if (ultima_direcao == "direita") {
        tiro.x = x + 30;
        // Posiciona 30 pixels à FRENTE (direita) do personagem
        // Parece que sai da arma
        
        tiro.y = y - 5;
        // 5 pixels acima (ajuste conforme sua sprite)
        // Para alinhar com a arma/mão
        
        tiro.image_angle = 0;
        // Sem rotação (0 graus = horizontal direita)
        
    } else {
        // Se direção é esquerda
        tiro.x = x - 30;
        // 30 pixels à ESQUERDA do personagem
        
        tiro.y = y - 5;
        tiro.image_angle = 180;
        // Rotaciona 180 graus (aponta para esquerda)
    }
    
    // ===== INICIAR COOLDOWN =====
    
    timer_cooldown = cooldown_tiro;
    // Reseta o timer para 20 (ou valor definido)
    // Inicia contagem regressiva até poder atirar de novo
    
    // ===== OPCIONAL: SOM DE TIRO =====
    
    // audio_play_sound(som, prioridade, loop)
    // O que faz: Toca um som
    // Parâmetros:
    //   som = recurso de áudio (snd_tiro)
    //   prioridade = 1-100 (maior = mais importante)
    //   loop = true (repetir) ou false (tocar uma vez)
    
    // Descomente a linha abaixo se tiver som:
    // audio_play_sound(snd_tiro_espingarda, 10, false);
}