float4 mapSpectrum(float cv) {
     float4 val = float4(0,0,0,1.0);

     val.r = 1.00;
     val.r = cv<0.40 ? (cv-0.20)*5 : val.r;
     val.r = cv<0.20 ? 0.00 : val.r;
     val.r /= 1.5;

     val.g = 1.00;
     val.g = cv<0.80 ? (cv-0.60)*5 : val.g;
     val.g = cv<0.60 ? 0 : val.g;
     val.g /= 1.5;

     val.b = 1.00;
     val.b = cv<1.00 ? (cv-0.80)*5 : val.b;
     val.b = cv<0.80 ? 0.00 : val.b;
     val.b = cv<0.60 ? (0.60-cv)*5 : val.b;
     val.b = cv<0.40 ? 1.00 : val.b;
     val.b = cv<0.20 ? (cv-0.00)*5 : val.b;
     val.b /= 1.5;

     return val;
} 