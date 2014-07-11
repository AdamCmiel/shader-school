highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians
  n = normalize(n);

  vec4 col1 = vec4(n.x * n.x + (n.y * n.y + n.z * n.z) * cos(theta),
                   n.x * n.y * (1.0 - cos(theta)) + n.z * (sin(theta)),
                   n.x * n.z * (1.0 - cos(theta)) - n.y * (sin(theta)),
                   0);

  vec4 col2 = vec4(n.x * n.y * (1.0 - cos(theta)) - n.z * (sin(theta)),
                   n.y * n.y + (n.x * n.x + n.z * n.z) * cos(theta),
                   n.x * n.z * (1.0 - cos(theta)) + n.x * sin(theta),
                   0);

  vec4 col3 = vec4(n.x * n.z * (1.0 - cos(theta)) + n.y * sin(theta),
                   n.y * n.z * (1.0 - cos(theta)) - n.x * sin(theta),
                   n.z * n.z + (n.x * n.x + n.y * n.y) * cos(theta),
                   0);

  vec4 col4 = vec4(0,
                   0,
                   0,
                   1.0);

  return mat4(col1, col2, col3, col4);
}

#pragma glslify: export(rotation)