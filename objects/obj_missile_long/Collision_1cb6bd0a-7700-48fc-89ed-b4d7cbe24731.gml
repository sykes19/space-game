/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_hit_sm,2,0);

part_emitter_region(global.p_sys,0,x-32,x+32,y-32,y+32,ps_distr_linear,ps_shape_ellipse);
part_emitter_burst(global.p_sys,0,global.p_fire_1,150);
part_emitter_burst(global.p_sys,0,global.p_fire_2,100);

other.hp -= damage/2;

splashTarget = 0;
_othersHit = collision_circle_list(x,y,64,obj_asteroid,false,false,_splash,true);
for(i = 0; i < _othersHit; i++;)
{
	splashTarget = _splash[| i];
	splashTarget.hp -= damage/2;
}

instance_destroy();