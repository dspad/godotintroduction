shader_type canvas_item;

//parametro modificabile da inspector
uniform vec3 color : source_color = vec3(1);
//crea un range 0-1 con intervalli di 0.1
uniform float progress : hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
	//A differenza di GDScript, qui il codice è tipizzato e C-like
	//Colora ogni pixel di bianco. I parametri sono r,g,b,a
	//COLOR = vec4(1,1,1,1);
	//float test_var = 0.1;
	
	//UV.x crea un effetto grandient
	//COLOR = vec4(UV.x,1,1,UV.y);
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(color, current_a),progress);
	COLOR = target_color;
}
