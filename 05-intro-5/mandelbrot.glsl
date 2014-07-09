vec2 mandelbrotIteration(vec2 z, vec2 c) {
  return vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
}

bool mandelbrot(highp vec2 c) {

  //Test if the point c is inside the mandelbrot set after 100 iterations
  vec2 z = vec2(0.0, 0.0);

  for (int iterations = 100; iterations > 0; --iterations) {
    z = mandelbrotIteration(z, c);
    if (length(z) > 2.0) {
      return false;
    }
  }

  if (length(z) < 2.0) {
    return true;
  } else {
    return false;
  }
}


//Do not change this line or the name of the above function
#pragma glslify: export(mandelbrot)
