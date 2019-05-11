  	
	vec4 WaterRipples(vec3 worldPos, vec3 worldNormal) {
		vec4 worldPos_4 = vec4(worldPos,1);
		mat2x2 ripplemat = mat2(_DynamicRippleMatrix[0].xy, _DynamicRippleMatrix[1].xy);
		vec2 rippleCoords = ripplemat * worldPos.xy;


		rippleCoords *= (1.0 / _DynamicRippleSize);
		float rippleMask = clamp((1.0 - abs(rippleCoords.x)) * 20, 0.0, 1.0) * clamp((1.0 - abs(rippleCoords.y)) * 20 , 0.0, 1.0) * clamp(worldNormal.y, 0.0, 1.0);
		float ripple_x = clamp(rippleCoords.x * 0.5 + 0.5, 0.0, 1.0);
		float ripple_y = clamp(rippleCoords.y * 0.5 + 0.5, 0.0, 1.0);

		vec4 ripples = texture(_DynamicRippleTexture, vec2(ripple_x, ripple_y));

		ripples.x = pow(ripples.x, 0.45);
		ripples.y = pow(ripples.y, 0.45);
		ripples.z = pow(ripples.z, 0.45);

		ripples = ripples * 2.0 - 1.0;
		ripples *= rippleMask;

		return ripples;
	}

	float frac(float thing) {
		return thing - floor(thing);
	}


   void main()
    {
vec2 inTex = vec4(rsIn.worldPosition, 1.0f).xy;

vec2 t1 = inTex * texScale*.8 + vec2(0.0f, -waterSpeed * Ripple_Speed) * Tmh;

vec2 t2 = inTex * texScale + vec2(0.0f, -waterSpeed * Ripple_Speed) * Tmh;
vec2 t3 = inTex * texScale * 1.3 + vec2(0.0f, -waterSpeed * Ripple_Speed) * Tmh;
//scales the water height to right cube dimensions
vec3 c1 = texture2D(_DynamicRippleTexture, t1).xyz;
vec3 c2 = texture2D(_DynamicRippleTexture, t2).xyz;
vec3 c3 = texture2D(_DynamicRippleTexture, t3).xyz;

vec3 cTotal = (1.1 * (c1) + 0.9 * (c2) + 0.8 * (c3) )/ 3;


        //texture2D in GLSL needs a sampler2D and vec2 that corresponds to texture coordinates?
        vec4 c = texture(_DynamicRippleTexture, rsIn.worldPosition.xy + frac(Tmh * waterSpeed));

		float transparency = TransparencyStd;
		//transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range

		//vec3 col = lerp(DiffuseColor, DarkColor, height);
		//col = lerp(col, SpecularColor, foam);

if (c.x < 0.001 && c.y < 0.001 && c.z < 0.001) {
    transparency = 0;
}

		colorOut = vec4(cTotal, transparency);

    }
