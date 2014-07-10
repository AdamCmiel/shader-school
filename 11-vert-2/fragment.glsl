precision highp float;

varying vec3 colorOn;

void main() {
  gl_FragColor = vec4(colorOn, 1.0);
}