shader_type canvas_item;
render_mode blend_mix;
uniform sampler2D gradient;
void fragment()
{
	COLOR.a=texture (TEXTURE, UV).a;
	COLOR
	COLOR.rgb=COLOR.rgb*texture(gradient, UV).rgb;
}