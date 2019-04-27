#version 330


uniform vec3 u_cam_pos;

uniform samplerCube u_texture_cubemap;

in vec4 v_position;
in vec4 v_normal;
in vec4 v_tangent;

out vec4 out_color;

vec4 wo;
vec4 wi;

void main() {
  // YOUR CODE HERE
    wo = vec4(u_cam_pos, 0) * v_position;
    wi = -wo + 2 * dot(wo, v_normal) * v_normal;
    out_color = texture(u_texture_cubemap, wi.xyz);
//  out_color = (vec4(1, 1, 1, 0) + v_normal) / 2;
  out_color.a = 1;
}
