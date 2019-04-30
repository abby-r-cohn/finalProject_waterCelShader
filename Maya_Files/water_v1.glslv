#if !OGSFX
#version 330
#endif

#if OGSFX

/************* DATA STRUCTS **************/

/* data from application vertex buffer */
attribute appdata {
vec3 Position    : POSITION;
vec2 UV        : TEXCOORD0;
vec3 Normal    : NORMAL;
};

/* data passed from vertex shader to pixel shader */
attribute waterVertexOutput {
vec3 WorldNormal    : TEXCOORD1;
vec3 WorldEyeVec    : TEXCOORD2;
vec4 ObjPos    : TEXCOORD3;
vec4 DCol : COLOR0;
float WaveAmplitude :   AMPLITUDE1;
float vDisp :   DISP1;
};


attribute vs_input {
vec3 DiffuseColor;
vec3 SpecularColor;
vec3 DarkColor;
mat4 wp_matrix;
texture2D gHeightMap;
sampler2D gHeightMapSamp;
vec2 in_texcoord;
float WaveAmplitude;
float Tmh;
float texScale;
float waterSpeed;
mat4 w_matrix;
float TransparencyStd;
};

attribute vs_to_ps {
vec2 texcoord;
vec3 diffuse;
vec3 specular;
mat4 wp;
float t;
float amp;
vec3 dark;
float vDisp;
};

#else

//in vec3 Position;
//in vec2 UV;
//in vec3 Normal;

in vec3 DiffuseColor;
in vec3 SpecularColor;
in vec3 DarkColor;
in mat4 wp_matrix;
in texture2D gHeightMap;
in sampler2D gHeightMapSamp;
in vec2 in_texcoord;
in float WaveAmplitude;
in float Tmh;
in float texScale;
in float waterSpeed;
in mat4 w_matrix;
in float TransparencyStd;

out float amp;
//out vec3 WorldNormal;
//out vec3 WorldEyeVec;
//out vec4 ObjPos;
//out vec4 DCol;
out float vDisp;
out vec3 diffuse;
out mat4 wp;
out vec3 specular;
out vec3 dark;
out vec2 texcoord;
out float t;

#endif

    void main()
    {
        vec4 INP = vec4(in_position, 1.0f);
        //the normal value is read from the .dds in the range [0,1]. We need the normal components
        //to be in the range [-1,1]
        vec3 normalCorrector = vec3(0.5,0.5,0.5);
        
        vec2 inTex = INP.xz;
        vec2 t1 = 0.1*inTex*texScale * 0.8 + vec2(0.0f, -waterSpeed * 0.6) * Tmh;
        vec2 t2 = 0.1*inTex*texScale      +  vec2(0.0f, -waterSpeed)       * Tmh;
        vec2 t3 = 0.1*inTex*texScale * 1.3 + vec2(0.0f, -waterSpeed * 1.3) * Tmh;
        //scales the water height to right cube dimensions
        vec3 vDisp1 = texture2D(gHeightMapSamp, t1).xyz;
        vec3 vDisp2 = texture2D(gHeightMapSamp, t2).xyz;
        vec3 vDisp3 = texture2D(gHeightMapSamp, t3).xyz;
        vDisp = 1.1 * WaveAmplitude * (vDisp1.x  -0.5 )
        + 0.9 * WaveAmplitude * (vDisp2.x -0.5)
        + 0.8 * WaveAmplitude * (vDisp3.x -0.5);
        
    if (in_position.y > 0) {
            INP.y += (vDisp);
            //consider adding x and z for presentation purposes
            //height displacement happens here
    }
        
        vsOut.HPos = wp_matrix * INP;
        gl_Position = vsOut.HPos;
        
        vec4 worldPos = w_matrix * INP;
        vsOut.worldPosition.xyz = worldPos.xyz;
        
        //Out.texCoord0 = In.texCoord0;
        
//        vsOut.worldNormal = (gWXf * vec4(vNormalTotal,0.0)).xyz;
        vsOut.worldTangent = normalize( w_matrix * vec4(in_tangent,0.0) );
        vsOut.amCol = vec4(vNormalTotal, vDisp);
        vsOut.col_col0 = in_color0;
    }



