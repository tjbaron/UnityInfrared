Shader "TwoFront/Infrared/Particles/FullSpectrum" {
    Properties {
        _TempGrad("Temperature Gradient", 2D) = "black" {}
        _HighTemp("Object High Temperature", Float) = 10
        _LowTemp("Object Low Temperature", Float) = 5
    }
 
  SubShader {
        Tags {"Queue" = "Transparent" }

        Pass {
            ZWrite Off
            Cull Back

            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                #include "UnityCG.cginc"
                #include "Assets/TwoFront/Infrared/Shaders/FullSpectrum.cginc"
                #include "Assets/TwoFront/Infrared/Shaders/CoreShading.cginc"
            ENDCG
        }
   }
}