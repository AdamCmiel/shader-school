precision highp float;

attribute vec4 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 diffuse, lightDirection;
uniform float numBands;

varying vec3 fragNormal;

void main() {
  vec4 worldPosition = model * position;
  vec4 worldNormal = normal * inverseModel;

  gl_Position = projection * view * worldPosition;
  fragNormal = worldNormal.xyz;
}

// void main() {
//   vec4 worldPosition = model * position;
//   vec4 worldNormal = normal * inverseModel;

//   gl_Position = projection * view * worldPosition;
//   fragNormal = worldNormal.xyz;
// }
