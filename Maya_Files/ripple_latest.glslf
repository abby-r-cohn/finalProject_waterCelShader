  	
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


//	void surf (Input IN, input SurfaceOutputStandard o) {
//		vec4 c = texture2D(_MainTex, IN.uv_MainTex  + frac(Tmh * waterSpeed));
//		vec4 c2 = texture2D(_MainTex, IN.uv_MainTex * 1.3 + frac(Tmh * waterSpeed));

//		c = (c + c2) * 0.5;
//		vec3 normal = vec3(c.x, c.y, 1) * 2.0 - 1.0;
//		normal.z = sqrt(1 - clamp(dot(normal.xy, normal.xy), 0.0, 1.0) );
//		float foam = lerp(0.4, 0.6, c.z * c.z);
//		float height = c.w;
//	}
   

   void main()
    {
        //texture2D in GLSL needs a sampler2D and vec2 that corresponds to texture coordinates?
        vec4 c = texture(_DynamicRippleTexture, rsIn.worldPosition.xy + frac(Tmh * waterSpeed));
        vec4 c2 = texture(_DynamicRippleTexture, rsIn.worldPosition.xy * 1.3 + frac(Tmh * waterSpeed));

		c = (c + c2) * 0.5;
		vec3 normal = vec3(c.x, c.y, 1) * 2.0 - 1.0;
		normal.z = sqrt(1 - clamp(dot(normal.xy, normal.xy), 0.0, 1.0) );
		float foam = lerp(0.4, 0.6, c.z * c.z);
		float height = c.w;

			// "#ifdef DYNAMIC_RIPPLES_ON"
				vec3 worldNormal;
				vec3 worldTangent;
				vec3 worldBinormal;

				vec4 cal_ripples = WaterRipples(rsIn.worldPosition, worldNormal);
		
				vec2 rippleNormal;
				rippleNormal.x = dot(worldTangent, vec3(cal_ripples.x, 0, cal_ripples.y));
				rippleNormal.y = dot(worldBinormal, vec3(cal_ripples.x, 0, cal_ripples.y));

				normal.xy += rippleNormal;
				foam += cal_ripples.z * 5.0;
				height += cal_ripples.w;


		foam = lerp(0.45, 0.55, foam);
		height = height + (normal.x * 0.5) - (normal.y * 0.5);
		height = lerp(0.5, 0.55, height);



		float transparency = TransparencyStd;
		transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range

		vec3 col = lerp(DiffuseColor, DarkColor, height);
		col = lerp(col, SpecularColor, foam);

		colorOut = c;

    }
