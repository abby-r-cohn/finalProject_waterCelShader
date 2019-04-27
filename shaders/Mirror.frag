#version 330


uniform vec3 u_cam_pos;

uniform samplerCube u_texture_cubemap;

in vec4 v_position;
in vec4 v_normal;
in vec4 v_tangent;

out vec4 out_color;

vec4 cam_ray;
vec4 w_o;
vec4 w_i;

void main() {
    cam_ray = normalize(v_position - vec4(u_cam_pos, 0));
    w_o = normalize(v_normal);
    w_i = normalize(reflect(cam_ray, w_o));
    out_color = texture(u_texture_cubemap, w_i.rgb);
}
