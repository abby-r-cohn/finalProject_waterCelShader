#if !OGSFX
#version 330
#endif

#if OGSFX

uniform mat4 viewInv : ViewInverse;

uniform float TransparencyStd <
string UIName = "Liquid Transparency";
> = 0.0;

uniform vec3 DiffuseColor : Diffuse
<
string UIGroup = "Diffuse";
string UIName = "Diffuse Color";
string UIWidget = "ColorPicker";
int UIOrder = 203;
> = {0.0f, 0.5f, 1.0f };

uniform vec3 SpecularColor : Specular
<
string UIGroup = "Specular";
string UIName = "Specular Color";
string UIWidget = "ColorPicker";
int UIOrder = 404;
> = {1.0f, 1.0f, 1.0f };

uniform vec3 DarkColor : Dark
<
string UIGroup = "Dark";
string UIName = "Dark Color";
string UIWidget = "ColorPicker";
int UIOrder = 504;
> = {0.0f, 0.0f, 0.0f };

#endif
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
GLSLShader PS_Wave
{
//pixel shader
    void main()
    {
        vec4 color;
        vec3 N = psIn.worldNormal.xyz;
        vec3 Nw = N;
        vec3 V = normalize( viewInv[3].xyz - psIn.worldPosition.xyz );

        float spec = 0.0;

        float opacity = 1.0f-TransparencyStd;


        spec = dot(clamp(SpecularColor, 0.0, 1.0), vec3(0.3f, 0.6f, 0.1f));
        float transparency = (spec) + opacity;
        transparency = clamp(transparency, 0.0, 1.0);    // keep 0-1 range


color = vec4(DiffuseColor,transparency)

    #if GL_ES
    gl_FragColor = color;
    #else
    colorOut = color;
    #endif
    
    }
}



