precision highp float;

uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;
varying vec3 fragNormal, fragPosition;

float phong(vec3 lightDirection,
            vec3 surfaceNormal,
            vec3 eyeDirection,
            float shininess)
{
  vec3 lightReflected = reflect(lightDirection, surfaceNormal);
  float lightMag = max(dot(lightReflected, eyeDirection), 0.0);
  return pow(lightMag, shininess);
}

float lambert(vec3 lightDirection,
              vec3 surfaceNormal)
{
  return dot(surfaceNormal, lightDirection);
}

void main() {
	vec3 eyeDirection = normalize(fragPosition);
  vec3 normal = normalize(fragNormal);
  vec3 light  = normalize(lightDirection);

  float phongWeight = phong(light,
                            normal,
                            eyeDirection,
                            shininess)

  float lambertWeight = lambert(light,
                                normal);

  vec3 lightColor = ambient +
                    diffuse * lambertWeight +
                    specular * phongWeight;

  gl_FragColor = vec4(lightColor, 1);
}