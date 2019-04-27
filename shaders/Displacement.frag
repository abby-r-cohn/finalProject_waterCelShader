#version 330

uniform vec3 u_cam_pos;
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

uniform vec4 u_color;

uniform sampler2D u_texture_4;
uniform vec2 u_texture_4_size;

uniform float u_normal_scaling;
uniform float u_height_scaling;

in vec4 v_position;
in vec4 v_normal;
in vec4 v_tangent;
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

float du;
float dv;
float width;
float height;
float h1;
float h2;
float h3;
vec3 b;

vec3 no;
mat3 tbn;
vec4 h_val;
vec4 l;

float r2;
vec4 nd;

float h(vec2 uv) {
    // You may want to use this helper function...
    return texture(u_texture_4, uv).r;
}



void main() {
    // BUMP SHADER CODE
    width = u_texture_4_size.x;
    height = u_texture_4_size.y;
    
    h1 = h(vec2(v_uv.x + 1/width, v_uv.y));
    h2 = h(vec2(v_uv.x, v_uv.y));
    h3 = h(vec2(v_uv.x, v_uv.y + 1/height));
    
    du = (h1 - h2) * u_height_scaling * u_normal_scaling;
    dv = (h3 - h2) * u_height_scaling * u_normal_scaling;
    
    no = vec3(-du, -dv, 1.0);
    b = cross(v_tangent.xyz, v_normal.xyz);
    tbn = mat3(v_tangent.xyz, b, v_normal.xyz);
    
    nd = vec4(tbn * no, 0);
    
    //PHONG SHADER CODE
    kd = vec4(1, 1, 1, 0);
    ka = vec4(0.1, 0.1, 0.1, 0);
    ks = vec4(4, 4, 4, 0);
    Ia = vec4(1, 1, 1, 0);
    
    light_pos = vec4(u_light_pos, 0);
    r2 = distance(light_pos, v_position);
    r2 = r2*r2;
    intensity = vec4(u_light_intensity, 0);
    norm_lpos = normalize(light_pos);
    norm_vnormal = normalize(v_normal);
    //    norm_vlPos = normalize(v_position + light_pos);
    l = normalize(light_pos - v_position);
    h_val = normalize(v_position + l);
    
    out_color = ka * Ia + kd * (intensity/r2) * max(0, dot(norm_lpos, nd)) + (ks * (intensity/r2)) * pow(max(0, dot(nd,h_val)), 32);
    
    // (Placeholder code. You will want to replace it.)
    //  out_color = (vec4(1, 1, 1, 0) + v_normal) / 2;
    out_color.a = 1;
    // (Placeholder code. You will want to replace it.)
    //  out_color = (vec4(1, 1, 1, 0) + v_normal) / 2;
}

