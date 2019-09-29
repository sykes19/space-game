/// @description Insert description here
// You can write your code in this editor

// If asteroid size not assigned at spawn, choose one, with a 2:2:1 ratio
if sprite_index == spr_asteroid_blank sprite_index = choose(spr_asteroid_huge,spr_asteroid_huge,spr_asteroid_med,spr_asteroid_med,spr_asteroid_small);

hp = 1; // Initialize HP to something above 0. HP is determined in Begin Step
maxhp = 0;
hugehp = 30;
medhp = 20;
smallhp = 10;
direction = irandom_range(0,359);
image_angle = irandom_range(0,359);
speed = 2;


