precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  //TODO: Apply the model-view-projection matrix to `position`

  mat4 allMatricies = projection * view * model;
  vec4 inputPosition = vec4(position, 1.0);
  vec4 outputPosition = allMatricies * inputPosition;

  gl_Position = outputPosition;
}