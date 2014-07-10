precision highp float;

attribute vec4 position;
attribute vec3 color;
varying vec3 colorOn;

void main() {
  gl_Position = position;
  colorOn = color;
}
