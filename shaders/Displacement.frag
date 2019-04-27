#version 330

uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

uniform vec4 u_color;

uniform sampler2D u_texture_3;
uniform vec2 u_texture_3_size;

uniform float u_normal_scaling;
uniform float u_height_scaling;

in vec4 v_position;
in vec4 v_normal;
in vec4 v_tangent;
in vec2 v_uv;

out vec4 out_color;

float du;
float dv;
vec3 no;
vec4 nd;
mat3 tbn;

vec4 l;
float h2;
vec4 ka;
vec4 ks;
vec4 ia;
vec4 kd;
vec4 intensity;
float r;
float maximum;
vec4 maximum2;

float h(vec2 uv) {
    // You may want to use this helper function...
    return texture(u_texture_3, uv).r;
}

//vec2 new_uv;

void main() {
    
    du = (h(vec2(v_uv.x + (1/u_texture_3_size.x), v_uv.y)) - h(vec2(v_uv.x, v_uv.y))) * u_height_scaling * u_normal_scaling;
    dv = (h(vec2(v_uv.x, v_uv.y + (1/u_texture_3_size.y))) - h(vec2(v_uv.x, v_uv.y))) * u_height_scaling * u_normal_scaling;
    no = vec3(-du, -dv, 1.0);
    tbn = mat3(v_tangent.xyz, cross(v_tangent.xyz, v_normal.xyz), v_normal.xyz);
    nd = vec4(tbn * no, 0);
    
    ka = vec4(.1, .1, .1, 0);
    ks = vec4(1, 1, 1, 0);
    ia = vec4(1, 1, 1, 0);
    kd = vec4(1, 1, 1, 0);
    r = distance(vec4(u_light_pos, 0), v_position);
    l = normalize(vec4(u_light_pos, 0) - v_position);
    intensity = vec4(u_light_intensity, 0);
    maximum = dot(normalize(vec4(u_light_pos, 0)), normalize(nd));
    maximum2 = normalize(v_position + l);
    h2 = dot(normalize(nd), maximum2);
    
    out_color = ka * ia + kd * (intensity/(r*r)) * u_color * max(0, maximum) + (ks * (intensity/(r*r))) * pow(max(0, h2), 32);
    out_color.a = 1;
}



