#include "NPR_Pipeline.glsl"

uniform vec3 ambient_color = vec3(0.1,0.1,0.1);
uniform vec3 diffuse_color = vec3(1.0,0.1,0.1);
uniform vec3 specular_color = vec3(1.0,1.0,1.0);
uniform float roughness = 0.5;

uniform vec3 line_color = vec3(0.0,0.0,0.0);
uniform float line_width = 1.0;
uniform float line_depth_threshold = 0.5;
uniform float line_normal_threshold = 1.0;

void COMMON_PIXEL_SHADER(Surface S, inout PixelOutput PO)
{
    vec3 diffuse = diffuse_color * get_diffuse_half();
    vec3 specular = specular_color * get_specular(roughness);
    vec3 color = ambient_color + diffuse + specular;

    float line = get_line_simple(1, line_depth_threshold, line_normal_threshold);

    PO.color = vec4(color, 1.0);

    PO.line_color = vec4(line_color, line);
    PO.line_width = line > 0 ? line_width : 0;
}

