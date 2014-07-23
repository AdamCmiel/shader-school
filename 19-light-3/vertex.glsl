precision highp float;

attribute vec4 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
varying vec3 fragNormal, fragPosition;

void main() {
  vec4 viewPosition = view * model * position;
  vec4 viewNormal   = normal * inverseModel * inverseView;
  fragNormal = viewNormal.xyz;
  fragPosition = viewPosition.xyz;
  gl_Position = projection * viewPosition;
}
