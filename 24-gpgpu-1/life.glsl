precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

void main() {
  vec2 vUv = gl_FragCoord.xy / stateSize;
  float s = texture2D(prevState, vUv).r;
  float count = 0.0;

  for (int x = -1; x <= 1; x++)
  for (int y = -1; y <= 1; y++)
    count += texture2D(prevState, fract(vUv + vec2(x, y) / stateSize)).r;

  gl_FragColor.rgb = vec3(count > 3.0+s || count < 3.0 ? 0.0 : 1.0);
  gl_FragColor.a = 1.0;
}
