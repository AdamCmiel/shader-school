// precision highp float;

// uniform mat4 model, view, projection;
// uniform mat4 inverseModel, inverseView, inverseProjection;
// uniform vec3 ambient, diffuse, specular, lightPosition, eyeDirection;
// uniform float shininess;
// varying vec3 fragPosition, fragNormal, lightDirection;

// // void main() {
// //   vec3 eyeDirection = normalize(fragPosition);
// //   vec3 normal = normalize(fragNormal);
// //   vec3 light  = normalize(lightDirection);

// //   float lambert = max(dot(normal, light), 0.0);
// //   float phong = pow(max(dot(reflect(light, normal), eyeDirection), 0.0), shininess);

// //   vec3 lightColor = ambient + diffuse * lambert + specular * phong;
// //   gl_FragColor = vec4(lightColor, 1);
// // }

// void main() {
//   vec3 eyeDirection = normalize(fragPosition);
//   vec3 normal = normalize(fragNormal);
//   vec3 light = normalize(lightDirection);
//   float lambert = dot(normal, light);
//   float phong = pow(max(dot(reflect(light, normal), eyeDirection), 0.0), shininess);

//   vec3 lightColor = ambient + diffuse * lambert + specular * phong;
//   gl_FragColor = vec4(lightColor, 1);
// }

precision mediump float;

uniform vec3 ambient, diffuse, specular, lightPosition;
uniform float shininess;
varying vec3 fragNormal, fragPosition, lightDirection;

void main() {
  vec3 eyeDirection = normalize(fragPosition);
  vec3 normal = normalize(fragNormal);
  vec3 light = normalize(lightDirection);

  float lambert = dot(normal, light);
  float phong = pow(max(dot(reflect(light, normal), eyeDirection), 0.0), shininess);

  vec3 lightColor = ambient + diffuse * lambert + specular * phong;
  gl_FragColor = vec4(lightColor, 1);
}