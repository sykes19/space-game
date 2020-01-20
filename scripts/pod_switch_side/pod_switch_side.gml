if podSide == 0 {
	podSide = 1;
	array_set(pod, 0, 100);
	array_set(pod, 1, 260);
	array_set(pod, 2, 80);
	array_set(pod, 3, 280);
	array_set(pod, 4, 60);
	array_set(pod, 5, 300);
}
else {
	podSide = 0;
	array_set(pod, 1, 100);
	array_set(pod, 0, 260);
	array_set(pod, 3, 80);
	array_set(pod, 2, 280);
	array_set(pod, 5, 60);
	array_set(pod, 4, 300);
}