
    void main()
    {
        vec4 INP = vec4(in_position, 1.0f);
        //the normal value is read from the .dds in the range [0,1]. We need the normal components
        //to be in the range [-1,1]
        
        vec2 inTex = INP.xz;
        vec2 t1 = 0.1*inTex*texScale * 0.8 + vec2(0.0f, -waterSpeed * 0.6) * Tmh;
        vec2 t2 = 0.1*inTex*texScale      +  vec2(0.0f, -waterSpeed)       * Tmh;
        vec2 t3 = 0.1*inTex*texScale * 1.3 + vec2(0.0f, -waterSpeed * 1.3) * Tmh;
        //scales the water height to right cube dimensions
        vec3 vDisp1 = texture2D(gHeightMapSamp, t1).xyz;
        vec3 vDisp2 = texture2D(gHeightMapSamp, t2).xyz;
        vec3 vDisp3 = texture2D(gHeightMapSamp, t3).xyz;

        float vDispTotal = 1.1 * WaveAmplitude * (vDisp1.x  -0.5 )
        + 0.9 * WaveAmplitude * (vDisp2.x -0.5)
        + 0.8 * WaveAmplitude * (vDisp3.x -0.5);
        
    if (in_position.y > 0) {
            INP.y += (vDispTotal);
            //consider adding x and z for presentation purposes
            //height displacement happens here
    }
        
        vsOut.HPos = wproj_matrix * INP;
        gl_Position = vsOut.HPos;
        
        vec4 worldPos = w_matrix * INP;
        vsOut.worldPosition.xyz = worldPos.xyz;
        //vsOut.uv_DynamicRippleTexture =
        
        
//        vsOut.worldNormal = (gWXf * vec4(vNormalTotal,0.0)).xyz;
        vsOut.worldNormal;
        vsOut.worldTangent = normalize( w_matrix * vec4(in_tangent,0.0) );
//        vsOut.amCol = vec4(vNormalTotal, vDispTotal);
        vsOut.amCol;
        vsOut.col_col0 = in_color0;
		//vsOut.waveamp = WaveAmplitude;
		vsOut.vDisp = vDispTotal;
    }



