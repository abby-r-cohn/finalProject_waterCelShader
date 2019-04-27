#version 330

uniform vec4 u_color;
uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

in vec4 v_position;
in vec4 v_normal;
in vec2 v_uv;

out vec4 out_color;
float maximum;
vec4 maximum2;

vec4 l;
float h;
vec4 ka;
vec4 ks;
vec4 ia;
vec4 kd;
vec4 intensity;
float r;

void main() {

    ka = vec4(.1, .1, .1, 0);
    ks = vec4(7, 7, 7, 0);
    ia = vec4(1, 1, 1, 0);
    kd = vec4(1, 1, 1, 0);
    r = distance(vec4(u_light_pos, 0), v_position);
    l = normalize(vec4(u_light_pos, 0) - v_position);
    intensity = vec4(u_light_intensity, 0);
    maximum = dot(normalize(vec4(u_light_pos, 0)), normalize(v_normal));
    maximum2 = normalize(v_position + l);
    h = dot(normalize(v_normal), maximum2);
    
    out_color = ka * ia + kd * (intensity/(r*r)) * u_color * max(0, maximum) + (ks * (intensity/(r*r))) * pow(max(0, h), 32);
    out_color.a = 1;
}

