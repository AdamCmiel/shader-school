precision highp float;

uniform float theta;

attribute vec2 position;

mat2 rotationMatrix() {
  return mat2(cos(theta), sin(theta),
             -sin(theta), cos(theta));
}

void main() {
  vec2 returnPosition = rotationMatrix() * position;
  gl_Position = vec4(returnPosition, 0.0, 1.0);
}
