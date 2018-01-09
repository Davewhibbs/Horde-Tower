//-----------DRAW TOWER
draw_sprite(s_tower, life, x, y);

//-----------DRAW COMBO BARS
if (combo < combo_length) draw_sprite(s_tower_combo, combo / 2, x, y);
else draw_sprite(s_tower_combo_filled, image_index, x, y);

//-----------DRAW GUN
draw_sprite_ext(s_gun, 0, x, y, 1, 1, dir, image_blend, image_alpha);