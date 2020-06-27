/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_hit_sm,2,0);
instance_create_layer(x,y,"Instances",obj_explosion);
instance_destroy();


//for(_othersHit = 0;	_othersHit > 0; i++;)			
//_othersHit = collision_circle_list(x,y,64,obj_asteroid,false,false,_splash,true);
//_othersHit.hp -= damage;


other.hp -= damage;