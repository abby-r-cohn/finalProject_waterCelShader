#version 330

uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

uniform sampler2D u_texture_1;

in vec4 v_position;
in vec4 v_normal;
in vec2 v_uv;

out vec4 out_color;
vec4 tex;

void main() {
<<<<<<< HEAD:Texture.frag
  // YOUR CODE HERE
  out_color = texture(u_texture_1, v_uv);
    out_color.a = 1;
=======
    out_color = texture(u_texture_1, v_uv);
	out_color.a = 1;
>>>>>>> 5838eced0bf0a6894b01c4f7c5e3cf33405f1691:shaders/Texture.frag
}
