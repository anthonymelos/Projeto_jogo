/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.vidas_jogador = 3;
global.vidas_inimigo = 100;

tomar_dano = function(target, amount) {
	// target: id da instância
	// amount quantidade de vida a ser tirada;
	if (instance_exists(target)) return;	
	
	if (variable_instance_exists(target, "invunerave") & target.invuneravel) {
		return;
	}
	with(target) {
	     if (!variable_local_exists("vida")) {
			 // se a vida não for iniciaizada, ele pega a padrão;
		vida = (variable_global_exists("global.vidas_inimigo") ? global.vidas_inimigo : 100);
}
	}
	vida -= amount;
// criar tipo um pisca-pisca no objet
/*(object_index == obj_sebastiao) {
	img_apha = 0.5;
	}*/
	
	// checa se morreu, se morreu ele reinicia a fase
if (variable_instance_exists(target, "vida") && target.vida <= 0) {
	if (object_index == obj_sebastiao) {
		if (instance_exists(target)) instance_destroy(target);
		global.vidas_jogador-= 1;
		if (global.vidas_jogador <= 0) {
			room_restart();
		} else {
			room_restart();
		}
		return;
	} 
	if (instance_number(obj_inimigo) <= 0) {
		other.on_all_enemies_dead();
	}
}
}

on_all_enemies_dead = function() {
    show_message("Todos os inimigos morreram — fase encerrada!");
}