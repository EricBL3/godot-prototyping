shader_type spatial;

uniform vec4 glow_color : source_color;
uniform float glow_intensity;

void fragment() {
    EMISSION = glow_color.rgb * glow_intensity;
}