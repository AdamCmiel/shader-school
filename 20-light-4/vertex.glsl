// precision highp float;

// attribute vec4 position, normal;

// uniform mat4 model, view, projection;
// uniform mat4 inverseModel, inverseView, inverseProjection;
// uniform vec3 ambient, diffuse, specular, lightPosition;
// uniform float shininess;

// varying vec3 fragPosition, fragNormal, lightDirection;

// // void main() {
// //   vec4 viewPosition = view * model * position;
// //   vec4 viewNormal = normal * inverseModel * inverseView;
// //   vec4 viewLight = view * vec4(lightPosition, 0.0);

// //   fragNormal = viewNormal.xyz;
// //   fragPosition = viewPosition.xyz;
// //   lightDirection = viewLight.xyz - viewPosition.xyz;
// //   gl_Position = projection * viewPosition;
// // }

// void main() {
//   vec4 viewPosition = view * model * position;
//   vec4 viewNormal = normal * inverseModel * inverseView;
//   vec4 viewLight = view * vec4(lightPosition, 0.0)	;

//   gl_Position = projection * viewPosition;
//   fragNormal = viewNormal.xyz;
//   fragPosition = viewPosition.xyz;
//   lightDirection = viewLight.xyz - viewPosition.xyz;
// }

precision mediump float;

attribute vec3 position, normal;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 lightPosition;
varying vec3 fragNormal, fragPosition, lightDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vec4 viewNormal = vec4(normal, 0.0) * inverseModel * inverseView;
  vec4 viewLight = view * vec4(lightPosition, 1.0);

  gl_Position = projection * viewPosition;
  fragNormal = viewNormal.xyz;
  fragPosition = viewPosition.xyz;
  lightDirection = viewLight.xyz - viewPosition.xyz;
}