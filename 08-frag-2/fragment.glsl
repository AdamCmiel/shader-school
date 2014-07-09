precision highp float;

#define WHITE vec4(1,1,1,1)

void main() {

  //TODO: Replace this with a function that draws a checkerboard
  vec2 cell = step(0.5, fract(gl_FragCoord.xy/32.0));
  if(cell.x + cell.y == 1.0) {
    discard;
  } else {
    gl_FragColor = WHITE;
  }
}