precision highp float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;

uniform vec3 ambient
uniform PointLight lights[4];
varying vec3 fragNormal, fragPosition, lightDirection;

float phong(vec3 lightPosition,
	        vec3 surfaceNormal,
	        vec3 eyeDirection,
	        float shininess) {
	vec4 lightDirection =
}

void main() {
  vec3 eyeDirection = normalize(fragPosition);
  vec3 normal = normalize(fragNormal);
  vec3 light = normalize(lightDirection);

  float lambert = dot(normal, light);
  float phong = pow(max(dot(reflect(light, normal), eyeDirection), 0.0), shininess);

  vec3 lightColor;
   = ambient + diffuse * lambert + specular * phong;
  gl_FragColor = vec4(lightColor, 1);
}