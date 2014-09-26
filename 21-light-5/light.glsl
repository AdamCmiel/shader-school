//This is the light datatype
struct PointLight {
  vec3 diffuse;
  vec3 specular;
  vec3 position;
  float shininess;
  vec4 direction
};

//Export the point light data type
#pragma glslify: export(PointLight)