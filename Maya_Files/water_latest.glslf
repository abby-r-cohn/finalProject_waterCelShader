
    void main()
    {
        vec4 color;
		vec3 N = psIn.worldNormal.xyz;
		vec3 Nw = N;
		vec3 V = normalize( viewInv[3].xyz - psIn.worldPosition.xyz );
		
		float opacity = 1.0f-TransparencyStd;
		
		//float spec = dot(clamp(SpecularColor, 0.0, 1.0), vec3(0.3f, 0.6f, 0.1f));
		//float transparency = (spec) + opacity;
		float transparency = opacity;
		transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range
		

		float upper_cutoff = (WaveAmplitude * .03);
		float lower_cutoff = -1 * (WaveAmplitude * .03);

		color = vec4(DiffuseColor, transparency);
		if (psIn.vDisp >= upper_cutoff)
		{
			color = vec4(SpecularColor, transparency);
		}

		else if (psIn.vDisp < lower_cutoff) {
			color = vec4(DarkColor, transparency);
		}

		#if GL_ES
				gl_FragColor = color;
		#else
				colorOut = color;
		#endif
    }
