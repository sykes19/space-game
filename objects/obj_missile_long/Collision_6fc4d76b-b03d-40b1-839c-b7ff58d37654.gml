/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_hit_sm,2,0);

// Sexy explosion
instance_create_layer(x,y,"InstancesLow",obj_explosionSphere);
part_particles_create(global.p_sys,x,y,global.p_cross,1);
part_emitter_region(global.p_sys,ID,x-180,x+180,y-180,y+180,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.p_sys,ID,global.p_klk_primer, irandom_range(5,6));
part_emitter_region(global.p_sys,ID,x-80,x+80,y-80,y+80,ps_shape_line,ps_distr_linear);
part_emitter_burst(global.p_sys,ID,global.p_sparkle, 30);
part_emitter_region(global.p_sys,ID,x-80,x+80,y+80,y-80,ps_shape_line,ps_distr_linear);
part_emitter_burst(global.p_sys,ID,global.p_sparkle, 30);


other.dBuffer += damage;

splashTarget = 0;
_othersHit = collision_circle_list(x,y,64,obj_asteroid,false,false,_splash,true);
for(i = 0; i < _othersHit; i++;)
{
	splashTarget = _splash[| i];
	splashTarget.dBuffer += damage/2;
}

instance_destroy();