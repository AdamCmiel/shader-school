highp vec2 func(highp vec2 a, highp vec2 b) {
	// Because the angle between vectors a and b is identical
	// no matter the magnitude of a and b, normalized a and b
	// can be used to compute the vector bisecting them, and 
	// the prompt expects the normalized vector
	return normalize(normalize(a) + normalize(b));
}

//Do not change this line
#pragma glslify: export(func)