precision highp float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec4 position, normal;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient;
uniform PointLight lights[4];

varying vec3 fragNormal, fragPosition;
varying vec3 lightDirection[4];

void main() {
	vec4 viewPosition = view * model * position;
	vec4 viewNormal = normal * inverseModel * inverseView;

	for (int i = 0; i < 4; i++) {
        vec3 position = lights[i].position;
		vec4 viewLight = view * vec4(position, 1.0);
		lightDirection[i] = viewLight.xyz - viewPosition.xyz;
	}

	gl_Position = projection * viewPosition;
	fragNormal = viewNormal.xyz;
	fragPosition = viewPosition.xyz;
}
