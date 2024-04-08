shader_type canvas_item;

uniform float divide = 0.4;
uniform float blur = 0.3;

void fragment(){
    COLOR.w = smoothstep(divide, divide+blur, UV.y);
}