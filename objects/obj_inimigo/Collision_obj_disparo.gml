/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var dano_tiro = 25; // ajuste ou pegue de other.dano se projéteis tiverem atributo
if (variable_instance_exists(other, "dano")) dano_tiro = other.dano;

// chama a função centralizada de dano
if (instance_exists(obj_controlador)) {
    with (obj_controlador) tomar_dano(id, dano_tiro);
} else {
    // fallback: aplica direto
    vida -= dano_tiro;
    if (vida <= 0) {
        instance_destroy(id);
    }
}

// destrói o projétil
if (instance_exists(other)) with(other) instance_destroy();