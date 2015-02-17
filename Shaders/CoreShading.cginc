
struct v2f {
    float4 pos : SV_POSITION;
    float3 normal : TEXCOORD0;
    float3 worldvertpos : TEXCOORD1;
    float2 texcoord : TEXCOORD2;
};

uniform sampler2D _TempGrad;
uniform float4 _TempGrad_ST;
uniform float _NormalWeight;
uniform float _AbsHighTemp;
uniform float _AbsLowTemp;
uniform float _HighTemp;
uniform float _LowTemp;

v2f vert(appdata_base v) {
    v2f o;

    o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
    o.normal = mul((float3x3)_Object2World, v.normal);
    o.worldvertpos = mul(_Object2World, v.vertex).xyz;
    o.texcoord = TRANSFORM_TEX(v.texcoord, _TempGrad);

    return o;
}

float4 frag(v2f i) : COLOR {
    i.normal = normalize(i.normal);
    float3 viewdir = normalize(_WorldSpaceCameraPos-i.worldvertpos);

    float4 grad = tex2D(_TempGrad, i.texcoord);
    float cv = pow(1.0-saturate(dot(viewdir, i.normal)), 0.6);
    cv = ((_LowTemp-_AbsLowTemp+(grad.r*(_HighTemp-_LowTemp)))/(_AbsHighTemp-_AbsLowTemp)) + (_NormalWeight*cv);

    float4 val = mapSpectrum(cv);
    val.a = grad.a;
    
    return val;
}
