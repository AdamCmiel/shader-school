precision highp float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 warm, cool, lightDirection;
varying vec3 fragNormal;

void main() {
  float weight = 0.5 * (1.0 + dot(normalize(fragNormal), normalize(lightDirection)));
  vec3 color = (1.0 - weight) * cool + weight * warm;
  gl_FragColor = vec4(color, 1);
}