precision highp float;

varying vec3 fragColor;

void main() {
  vec2 coord = gl_PointCoord.xy - vec2(0.5, 0.5);
  if (length(coord) > 0.5) {
      discard;
  }
  gl_FragColor = vec4(fragColor, 1.);
}