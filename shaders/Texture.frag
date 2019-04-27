#version 330

uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

uniform sampler2D u_texture_1;
uniform sampler2D u_texture_5;
uniform sampler2D u_my_tex;

in vec4 v_position;
in vec4 v_normal;
in vec2 v_uv;

out vec4 out_color;
vec4 tex;

void main() {
  // YOUR CODE HERE
  tex = texture(u_texture_1, v_uv);
  out_color = tex;
}
