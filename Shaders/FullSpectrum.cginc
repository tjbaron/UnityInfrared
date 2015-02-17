float4 mapSpectrum(float cv) {
     float4 val = float4(0,0,0,1.0);

     // .5 to .6 to .8 to 1
     val.r = cv<0.60 ? (cv-0.50)*10 : 1;
     val.r /= 1.5;

     // .2 to .4 to .6 to .8
     val.g = cv<0.40 ? (cv-0.20)*5 : 1;
     val.g = cv>0.60 ? (0.80-cv)*5 : val.g;
     val.g /= 1.5;
     
     // 0 to .2 to .4 to .5
     val.b = cv<0.20 ? (cv-0.00)*5 : 1;
     val.b = cv>0.40 ? (0.50-cv)*10 : val.b;
     val.b /= 1.5;

     val.g = cv>0.80 ? (cv-0.80)*5 : val.g;
     val.b = cv>0.80 ? (cv-0.80)*5 : val.b;

     return val;
}