precision mediump float;

uniform sampler2D prevState[2];
uniform vec2 stateSize;
uniform float kdiffuse, kdamping;


float state0(vec2 x) {
  return texture2D(prevState[0], fract(x / stateSize)).r;
}
float state1(vec2 x) {
  return texture2D(prevState[1], fract(x / stateSize)).r;
}

float laplacian(vec2 x) {
  return (state0(x+vec2(-1,0)) + state0(x+vec2(1,0)) + state0(x+vec2(0,1)) + state0(x+vec2(0,-1))) - 4.0 * state0(x);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Solve for next state using a 5-point Laplacian stencil and the explicit Euler rule
  float w = laplacian(coord);
  float p = state0(coord);
  float z = state1(coord);
  float y = (1. - kdamping) * (kdiffuse * w + 2. * p) - z;

  gl_FragColor = vec4(y,y,y,1);
}

// f(x,y,t+1) = (1 - kdamping) * (
//   kdiffuse * laplace(f)(x, y, t) +
//   2 * f(x,y,t)
// ) - f(x,y,t-1)
