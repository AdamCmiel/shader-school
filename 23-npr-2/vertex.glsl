precision highp float;

attribute vec4 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 warm, cool, lightDirection;
varying vec3 fragNormal;

void main() {
  vec4 viewPosition = view * model * position;
  vec4 worldNormal = normal * inverseModel;

  gl_Position = projection * viewPosition;
  fragNormal = worldNormal.xyz;
}