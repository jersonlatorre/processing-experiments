#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// uniform vec2 mouse;
varying vec4 vertColor;

void main() {
	// vec3 color = vertColor.xyz;
	gl_FragColor = vertColor;
}