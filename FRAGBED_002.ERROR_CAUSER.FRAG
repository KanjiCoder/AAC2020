#version 330 core  
//:SHADERTOY_COMPATIBILITY:----------------------------------://

    #define fragCoord gl_FragCoord  
    #define fragColor FragColor
    uniform vec3  iResolution;    
    uniform float iTime      ;    
    uniform vec4  iMouse     ;    

    in  vec2   fag_tec;                        
    out vec4 FragColor;  

//:----------------------------------:SHADERTOY_COMPATIBILITY://                
void main()                             
{                                       
    //:vec2 u_v = fragCoord.xy / iResolution.xy;
    vec2 u_v = (fragCoord.xy-(.5*iResolution.xy))/iResolution.y;
    vec3 col = 0.5 + 0.5 * cos(iTime+u_v.xyx+vec3(0,2,5));
    fragColor = vec4(col,1.0);

} //:main://                                          
