#if !OGSFX
#version 330
#endif

#if OGSFX

// Pixel shader for normal visualization.
GLSLShader PS_Normal
{
    void main()
    {
        vec4 color;
        color = vec4(psIn.amCol.xyz * 0.5 + vec3(0.5,0.5,0.5) ,1.0);
        
#if GL_ES
        gl_FragColor = color;
#else
        colorOut = color;
#endif
    }
}

#endif
