Shader "CustomRP/Particles/ParticlesStandard" {
	Properties {
		[KeywordEnum(NONE,ADD,GRAB)] TEX0_OP ("Texture0 Operator", Float) = 0
		_Texture0 ("Texture", 2D) = "white" { }
		_Power0 ("Power", Vector) = (1,0,0,0)
		_UVParams0 ("UV Params", Vector) = (0,0,0,1)
		_UVScroll0 ("UV Scroll", Vector) = (0,0,0,1)
		_UVGrid0 ("UV Grid", Vector) = (4,4,0,15)
		_UVFlipbook0 ("UV Flipbook", Vector) = (1,1,0,0)
		_UVClamp0 ("UV Clamp", Vector) = (0,0,0,0)
		_UVFlip0 ("UV Flip", Vector) = (0,0,0,0)
		[Toggle(TEX0_UV_GRID)] _Tex0Grid ("Texture0 Grid", Float) = 0
		[Toggle(TEX0_UV_FLIPBOOK)] _Tex0Flipbook ("Texture0 Flipbook", Float) = 0
		[Toggle(TEX0_LERPCOLOR)] _Tex0LC ("Texture0 LerpColor", Float) = 0
		[HDR]_WhiteColor0 ("White Color", Color) = (1,0.8,0.8,1)
		[HDR]_MiddleColor0 ("Middle Color", Color) = (0.65,0.4,0.4,1)
		[HDR]_BlackColor0 ("Black Color", Color) = (0.3,0,0,1)
		_ColorPoints0 ("Color Points", Vector) = (0,0.5,1,0)
		[Toggle(TEX0_CLUT)] _bCLUT0 ("CLUT", Float) = 0
		_CLUT0 ("Color Lookup Texture", 2D) = "white" { }
		[KeywordEnum(NONE,ADD,MUL,SUB,BUMPOFFSET)] TEX1_OP ("Texture1 Operator", Float) = 0
		_Texture1 ("Texture", 2D) = "white" { }
		_Power1 ("Power", Vector) = (1,0,0,0)
		_UVParams1 ("UV Params", Vector) = (0,0,0,1)
		_UVScroll1 ("UV Scroll", Vector) = (0,0,0,1)
		_UVGrid1 ("UV Grid", Vector) = (4,4,0,15)
		_UVFlipbook1 ("UV Flipbook", Vector) = (1,1,0,0)
		_UVClamp1 ("UV Clamp", Vector) = (0,0,0,0)
		_UVFlip1 ("UV Flip", Vector) = (0,0,0,0)
		[Toggle(TEX1_UV_GRID)] _Tex1Grid ("Texture1 Grid", Float) = 0
		[Toggle(TEX1_LERPCOLOR)] _Tex1LC ("Texture1 LerpColor", Float) = 0
		[HDR]_WhiteColor1 ("White Color", Color) = (0.7,1,0.7,1)
		[HDR]_MiddleColor1 ("Middle Color", Color) = (0.35,0.65,0.35,1)
		[HDR]_BlackColor1 ("Black Color", Color) = (0,0.3,0,1)
		_ColorPoints1 ("Lerp Color Points", Vector) = (0,0.5,1,0)
		[KeywordEnum(NONE,ADD,MUL,SUB)] TEX2_OP ("Texture2 Operator", Float) = 0
		_Texture2 ("Texture", 2D) = "white" { }
		_Power2 ("Power", Vector) = (1,0,0,0)
		_UVParams2 ("UV Params", Vector) = (0,0,0,1)
		_UVScroll2 ("UV Scroll", Vector) = (0,0,0,1)
		_UVGrid2 ("UV Grid", Vector) = (4,4,0,15)
		_UVFlipbook2 ("UV Flipbook", Vector) = (1,1,0,0)
		_UVClamp2 ("UV Clamp", Vector) = (0,0,0,0)
		_UVFlip2 ("UV Flip", Vector) = (0,0,0,0)
		[Toggle(TEX2_UV_GRID)] _Tex2Grid ("Texture2 Grid", Float) = 0
		[Toggle(TEX2_LERPCOLOR)] _Tex2LC ("Texture2 LerpColor", Float) = 0
		[HDR]_WhiteColor2 ("White Color", Color) = (0.8,0.8,1,1)
		[HDR]_MiddleColor2 ("Middle Color", Color) = (0.4,0.4,0.6,1)
		[HDR]_BlackColor2 ("Black Color", Color) = (0,0,0.2,1)
		_ColorPoints2 ("Lerp Color Points", Vector) = (0,0.5,1,0)
		_EdgeFade_SoftPtcl ("_EdgeFade_SoftPtcl", Vector) = (0,0.7071068,1,0)
		_AC_Params0 ("AC Params 0", Vector) = (0.5,0.5,0,0.2)
		_AC_Params1 ("AC Params 1", Vector) = (0.5,0.5,0.8,1)
		_AC_Params2 ("AC Params 2", Vector) = (0,0,0,0)
		[HDR]_AC_MiddleColor ("AC MiddleColor", Color) = (1,0,0,1)
		[HDR]_GameColor ("Game Color", Color) = (1,1,1,1)
		[HDR]_EnvColor ("Environment Color", Color) = (1,1,1,1)
		[Toggle(APPLY_SUN_OCCLUSION)] _ApplySunOcclusion ("Apply Sun Occlusion", Float) = 0
		[Enum(UnityEngine.Rendering.BlendOp)] _BlendOp ("Blend Operation", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("Blend Source", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("Blend Destination", Float) = 10
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTestMode ("Z-Test Equation", Float) = 4
		[Toggle] _ZWriteParam ("Z-Write", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 2
		[Enum(RGBA,15,RGB,14)] _ColorMask ("Color Mask", Float) = 15
		_Version ("Version", Float) = 2
		_MiscValue ("MiscValue", Vector) = (0,0,0,0)
		_LuminanceScale ("LuminanceScale", Vector) = (1,1,1,1)
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _Texture1;

        struct Input
        {
            float2 uv_Texture1;
        };

        fixed4 _WhiteColor1;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_Texture1, IN.uv_Texture1);
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
