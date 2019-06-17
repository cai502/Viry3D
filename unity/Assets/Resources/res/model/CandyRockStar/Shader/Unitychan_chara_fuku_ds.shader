Shader "UnityChan/Clothing - Double-sided"
{
	Properties
	{
		_Color ("Main Color", Color) = (1, 1, 1, 1)
		_ShadowColor ("Shadow Color", Color) = (0.8, 0.8, 1, 1)
		_SpecularPower ("Specular Power", Float) = 20
		_EdgeThickness ("Outline Thickness", Float) = 1
				
		_MainTex ("Diffuse", 2D) = "white" {}
		_FalloffSampler ("Falloff Control", 2D) = "white" {}
		_RimLightSampler ("RimLight Control", 2D) = "white" {}
		_SpecularReflectionSampler ("Specular / Reflection Mask", 2D) = "white" {}
		_EnvMapSampler ("Environment Map", 2D) = "" {} 
		_NormalMapSampler ("Normal Map", 2D) = "" {} 
	}

CGINCLUDE
#include "UnityCG.cginc"
#include "AutoLight.cginc"
ENDCG

	SubShader
	{
		Tags
		{
			"RenderType"="OpaqueDoubleSided"
			"Queue"="Geometry"
			"LightMode"="ForwardBase"
		}		

		Pass
		{
			Cull Off
			ZTest LEqual
CGPROGRAM
#pragma multi_compile_fwdbase
#pragma vertex vert
#pragma fragment frag
#define ENABLE_CAST_SHADOWS
#define ENABLE_NORMAL_MAP
#define ENABLE_SPECULAR
#define ENABLE_REFLECTION
#define ENABLE_RIMLIGHT
#include "CharaMain.cg"
ENDCG
		}
	}
}

