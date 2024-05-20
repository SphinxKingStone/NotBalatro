shader_type canvas_item;
render_mode unshaded;

uniform sampler2D scales_texture; // inversed depth map
uniform float scales_strength : hint_range(3.5, 10.0) = 4.0;

void fragment() {
	vec3 new_color =  texture(scales_texture, UV).rgb;
	
	// apply scales texture
	COLOR.rgb = COLOR.rgb - new_color / scales_strength;
	
	//COLOR.rgb = COLOR.rgb * new_color * 1.1; // cool effect but not what's needed
	
	// bring up brightness
	COLOR.rgb = COLOR.rgb * (scales_strength / (scales_strength - 1.0));
	
	// fix saturation
	COLOR.w = COLOR.w * 0.8;
}