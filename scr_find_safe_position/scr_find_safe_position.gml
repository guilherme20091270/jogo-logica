function scr_find_safe_position(){
/// scr_find_safe_position(x_in, y_in, obj_block)

// Retorna uma posição (array) [x, y] segura perto de (x_in, y_in) que não colida com obj_block

var x_in = argument0;
var y_in = argument1;
var obj_block = argument2;

var max_desloc = 32;
var pos_encontrada = false;
var new_x = x_in;
var new_y = y_in;

for (var desloc = 0; desloc <= max_desloc; desloc++) {
    // Testa cima
    if (!place_meeting(x_in, y_in - desloc, obj_block)) {
        new_x = x_in;
        new_y = y_in - desloc;
        pos_encontrada = true;
        break;
    }
    // Testa direita
    if (!place_meeting(x_in + desloc, y_in, obj_block)) {
        new_x = x_in + desloc;
        new_y = y_in;
        pos_encontrada = true;
        break;
    }
    // Testa esquerda
    if (!place_meeting(x_in - desloc, y_in, obj_block)) {
        new_x = x_in - desloc;
        new_y = y_in;
        pos_encontrada = true;
        break;
    }
}

// Retorna array com nova posição segura ou a original se não achou nada
return [new_x, new_y];
}