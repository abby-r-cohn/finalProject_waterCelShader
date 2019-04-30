
    void main()
    {
        vec4 color;
		vec3 N = psIn.worldNormal.xyz;
		vec3 Nw = N;
		vec3 V = normalize( viewInv[3].xyz - psIn.worldPosition.xyz );
		
		float opacity = 1.0f-TransparencyStd;
		
		float spec = dot(clamp(SpecularColor, 0.0, 1.0), vec3(0.3f, 0.6f, 0.1f));
		float transparency = (spec) + opacity;
		transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range
		
		
		color = vec4(DiffuseColor,transparency);

		#if GL_ES
				gl_FragColor = color;
		#else
				colorOut = color;
		#endif
    }
