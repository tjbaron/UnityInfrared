Shader "TwoFront/Infrared/NoGreen" {
    Properties {
        _TempGrad("Temperature Gradient", 2D) = "black" {}
        _HighTemp("Object High Temperature", Float) = 10
        _LowTemp("Object Low Temperature", Float) = 5
    }
 
  SubShader {
        Pass {
            Cull Back

            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
 
                #include "UnityCG.cginc"
                #include "Assets/TwoFront/Infrared/Shaders/NoGreenSpectrum.cginc"
                #include "Assets/TwoFront/Infrared/Shaders/CoreShading.cginc"
            ENDCG
        }
   }
}