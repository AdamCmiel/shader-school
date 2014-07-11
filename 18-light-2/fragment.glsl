precision highp float;

uniform vec3 ambient, diffuse, lightDirection;
varying vec3 fragNormal;

void main() {
  float brightness = dot(fragNormal, lightDirection);
  gl_FragColor = vec4(ambient + diffuse * max(brightness, 0.0), 1);
}