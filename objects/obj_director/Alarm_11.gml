/// @description Boredom generation
// You can write your code in this editor

// Passive boredom income. This currency gets exhausted by events, like deaths and spawn waves.
global.dir_boredom += 1/stress;
alarm[11] = boredom_crawl;