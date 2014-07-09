precision highp float;

#define CIRCLE_COLOR    vec4(1.0, 0.4313, 0.3411, 1.0)
#define OUTSIDE_COLOR   vec4(0.3804, 0.7647, 1.0, 1.0)
#define CIRCLE_RADIUS   float(128.0)
#define CIRCLE_CENTER   vec2(256.0, 256.0)

void main() {

  //TODO: Replace this with a function that draws a circle at (256.5,256.5) with radius 128
  vec2 position               = gl_FragCoord.xy;
  vec2 distance_from_center   = CIRCLE_CENTER - position;
  highp float distance_length = length(distance_from_center);

  if (distance_length > CIRCLE_RADIUS) {
    gl_FragColor = CIRCLE_COLOR;
  } else {
    gl_FragColor = OUTSIDE_COLOR;
  }
}