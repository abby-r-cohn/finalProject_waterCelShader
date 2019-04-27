#version 330

// The camera's position in world-space
uniform vec3 u_cam_pos;

// Color
uniform vec4 u_color;

// Properties of the single point light
uniform vec3 u_light_pos;
uniform vec3 u_light_intensity;

// We also get the uniform texture we want to use.
uniform sampler2D u_texture_1;

// These are the inputs which are the outputs of the vertex shader.
in vec4 v_position;
in vec4 v_normal;

// This is where the final pixel color is output.
// Here, we are only interested in the first 3 dimensions (xyz).
// The 4th entry in this vector is for "alpha blending" which we
// do not require you to know about. For now, just set the alpha
// to 1.
out vec4 out_color;

vec4 diffuse_num;
vec4 light_pos;
vec4 intensity;
vec4 norm_lpos;
vec4 norm_vnormal;

void main() {
  // YOUR CODE HERE
    diffuse_num = vec4(1, 1, 1, 0);
    light_pos = vec4(u_light_pos, 0);
    intensity = vec4(u_light_intensity, 0);
    norm_lpos = normalize(light_pos);
    norm_vnormal = normalize(v_normal);
    out_color = diffuse_num * normalize(intensity) * max(0, dot(norm_lpos, norm_vnormal));
    
  // (Placeholder code. You will want to replace it.)
//  out_color = (vec4(1, 1, 1, 0) + v_normal) / 2;
  out_color.a = 1;
}
