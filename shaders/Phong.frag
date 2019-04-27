#version 330

uniform vec4 u_color;
uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

in vec4 v_position;
in vec4 v_normal;
in vec2 v_uv;

out vec4 out_color;

vec4 kd;
vec4 ka;
vec4 ks;
vec4 Ia;

vec4 light_pos;
vec4 intensity;
vec4 norm_lpos;
vec4 norm_vnormal;
//vec4 norm_vlPos;
vec4 h;
vec4 l;

float r2;

void main() {
  // YOUR CODE HERE
    kd = vec4(1, 1, 1, 0);
    ka = vec4(0.1, 0.1, 0.1, 0);
    ks = vec4(10, 10, 10, 0);
    Ia = vec4(1, 1, 1, 0);
    
    light_pos = vec4(u_light_pos, 0);
    r2 = distance(light_pos, v_position);
    r2 = r2*r2;
    intensity = vec4(u_light_intensity, 0);
    norm_lpos = normalize(light_pos);
    norm_vnormal = normalize(v_normal);
//    norm_vlPos = normalize(v_position + light_pos);
    l = normalize(light_pos - v_position);
    h = normalize(v_position + l);
    
    out_color = ka * Ia + kd * (intensity/r2) * max(0, dot(norm_vnormal, norm_lpos)) + (ks * (intensity/r2)) * pow(max(0, dot(norm_vnormal,h)), 32);
  
  // (Placeholder code. You will want to replace it.)
//  out_color = (vec4(1, 1, 1, 0) + v_normal) / 2;
  out_color.a = 1;
}

