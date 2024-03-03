shader_type canvas_item;

uniform float hit_opaciity = 0;

void fragment() {
	COLOR.rgb = texture(TEXTURE,UV).rgb * (1.0 - hit_opaciity) + vec3(1,1,1) * hit_opaciity;
	COLOR.a = texture(TEXTURE,UV).a;
}
