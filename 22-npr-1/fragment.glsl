precision highp float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 diffuse, lightDirection;
uniform float numBands;

varying vec3 fragNormal;

void main() {
  float brightness = dot(fragNormal, lightDirection);
  vec3 color_vector = diffuse * max(brightness, 0.0);
  vec3 color_out_vector = ceil(numBands * color_vector) / numBands;
  gl_FragColor = vec4(color_out_vector, 1.0);
}

// void main() {
//   float brightness = dot(fragNormal, lightDirection);
//   gl_FragColor = vec4(ambient + diffuse * max(brightness, 0.0), 1);
// }