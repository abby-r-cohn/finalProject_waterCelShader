
    void main()
    {
        vec4 color;
		vec3 N = psIn.worldNormal.xyz;
		vec3 Nw = N;
		vec3 V = normalize( viewInv[3].xyz - psIn.worldPosition.xyz );
		
		float opacity = 1.0f-TransparencyStd;
		

		float transparency = opacity;
		transparency = clamp(transparency, 0.0, 1.0);	// keep 0-1 range
		

		float upper_cutoff = (WaveAmplitude * CutoffSize);
		float lower_cutoff = -2 * (WaveAmplitude * CutoffSize);

		color = vec4(DiffuseColor, transparency);
		if (psIn.vDisp > upper_cutoff)
		{
			color = vec4(DiffuseColor + SpecularColor, transparency);
		}

		else if (psIn.vDisp <= lower_cutoff) {
            color = vec4(DarkColor, transparency); //vec4(DiffuseColor - DarkColor, transparency);
		}

		#if GL_ES
				gl_FragColor = color;
		#else
				colorOut = color;
		#endif
    }
