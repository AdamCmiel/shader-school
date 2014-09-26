precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse, kdamping;

float state(vec2 x) {
  return texture2D(prevState, x / stateSize).r;
}

float laplacian(vec2 x) {
  return (state(x+vec2(-1,0)) + state(x+vec2(1,0)) + state(x+vec2(0,1)) + state(x+vec2(0,-1))) - 4.0 * state(x);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float w = laplacian(coord);
  float p = state(coord);
  float y = (1. - kdamping) * (kdiffuse * w + 2. * p);

  gl_FragColor = vec4(y,y,y,1);
}

// f(x,y,t+1) = (1 - kdamping) * (
//   kdiffuse * laplace(f)(x, y, t) +
//   2 * f(x,y,t)
// ) - f(x,y,t-1)

// void main() {
//   vec2 vUv = gl_FragCoord.xy / stateSize;
//   float s = texture2D(prevState, vUv).r;
//   float count = 0.0;

//   for (int x = -1; x <= 1; x++)
//   for (int y = -1; y <= 1; y++)
//     count += texture2D(prevState, fract(vUv + vec2(x, y) / stateSize)).r;

//   gl_FragColor.rgb = vec3(count > 3.0+s || count < 3.0 ? 0.0 : 1.0);
//   gl_FragColor.a = 1.0;
// }


// Euler integration

// One way to solve this equation is to discretize it and numerically integrate to obtain a solution. Without going too far into the details of how this works, supposing that f(x,y,t) is uniformly sampled on a unit grid, then the left hand side of the equation can be written using a stencil operation:

// float laplace(x, y) {
//   return (
//     prevState(x-1,y) +
//     prevState(x+1,y) +
//     prevState(x,y-1) +
//     prevState(x,y+1)
//   ) - 4.0 * prevState(x,y);
// }

// And with damping, the update rule for the integrator becomes:

// nextState(x,y) = (1.0 - kDamping) * (
//   kDiffuse * laplace(x,y) + prevState(x,y)
// )
