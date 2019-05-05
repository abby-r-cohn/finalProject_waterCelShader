  	
	vec4 WaterRipples(vec3 worldPos, vec3 worldNormal) {
		vec4 worldPos_4 = vec4(worldPos,1);
		mat2x2 ripplemat = mat2(_DynamicRippleMatrix[0].xy, _DynamicRippleMatrix[1].xy);
		vec2 rippleCoords = ripplemat * worldPos.xy;


		rippleCoords *= (1.0 / _DynamicRippleSize);
		float rippleMask = clamp((1.0 - abs(rippleCoords.x)) * 20, 0.0, 1.0) * clamp((1.0 - abs(rippleCoords.y)) * 20 , 0.0, 1.0) * clamp(worldNormal.y, 0.0, 1.0);
		float ripple_x = clamp(rippleCoords.x * 0.5 + 0.5, 0.0, 1.0);
		float ripple_y = clamp(rippleCoords.y * 0.5 + 0.5, 0.0, 1.0);

		vec4 ripples = texture2D(_DynamicRippleTexture, vec2(ripple_x, ripple_y));

		ripple.x = pow(ripples.x, 0.45);
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
		vec4 c = texture2D(_MainTex, IN.uv_MainTex  + frac(Tmh * waterSpeed));
		vec4 c2 = texture2D(_MainTex, IN.uv_MainTex * 1.3 + frac(Tmh * waterSpeed));

		c = (C + c2) * 0.5;
		vec3 normal = vec3(c.x, c.y, 1) * 2.0 - 1.0;
		normal.z = sqrt(1 - clamp(dot(normal.xy, normal.xy), 0.0, 1.0) );
		float foam = lerp(0.4, 0.6, c.z * c.z);
		float height = c.w;

			// "#ifdef DYNAMIC_RIPPLES_ON"
				vec3 worldNormal;
				vec3 worldTangent;
				vec3 worldBinormal;

				vec4 ripples = WaterRipples(In.worldPos, worldNormal);
		
				vec2 rippleNormal;
				rippleNormal.x = dot(worldTangent, vec3(ripples.x, 0, ripples.y));
				rippleNormal.y = dot(worldBinormal, vec3(ripples.x, 0, ripples.y));

				normal.xy += rippleNormal;
				foam += ripples.z * 5.0;
				height += ripples.w;


		foam = lerp(0.45, 0.55, foam);
		height = height + (normal.x * 0.5) - (normal.y * 0.5);
		height = lerp(0.5, 0.55, height);



		float transparency = opacity;
		transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range

		vec3 col = lerp(_Color.rgb, _Color2.rgb, height);
		col = lerp(waterColor, _FoamColor.rgb, foam);

		colorOut = vec4(col, transparency);

    }
