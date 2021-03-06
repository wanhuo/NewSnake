#ifdef GL_ES
precision lowp float;                                                                
#endif                                                                                                                                    
                                                                                     
varying vec2 v_texCoord;                                                             

uniform sampler2D u_texture;                                                         
uniform vec2 u_center1;
uniform vec2 u_center2;
uniform float maskShader;
uniform float scaleWidth;

uniform float blackwhite;


void main(void) {
    vec4 outColor = texture2D(u_texture, v_texCoord);

    vec2 vc = v_texCoord;
    vc.x *= scaleWidth;

    vec2 center_1 = u_center1;
    vec2 center_2 = u_center2;

    center_1.x *= scaleWidth;
    center_2.x *= scaleWidth;

    float dist1 = (1.0 - distance(vc, center_1));
    dist1 *= dist1 * 0.9;
    float dist2 = (1.0 - distance(vc, center_2));
    dist2 *= dist2 * 0.9;

    if (maskShader == 1.0) { //magenta

        if (dist1 > dist2) {
            float dist_pow_3 = dist1*dist1*dist1;

            outColor.b = ((outColor.r * dist_pow_3*2.0) ) + (dist1 - 0.55)/* / 1.5*/;
            outColor.g =  (outColor.g * dist_pow_3)                           * dist1;
            outColor.r = ((outColor.b * dist_pow_3*2.0)       + cos(dist1) / 4.0) * dist1 * 1.3;

        }
        else {
            float dist_pow_3 = dist2*dist2*dist2;

            outColor.b = ((outColor.r * dist_pow_3*2.0)) + (dist2 - 0.55)/* / 1.5*/;
            outColor.g = ((outColor.g * dist_pow_3)) * dist2;
            outColor.r = ((outColor.b * dist_pow_3*2.0) + cos(dist2) / 4.0) * dist2 * 1.3;

        }

    }

    else if (maskShader == 2.0) { //green
        if (dist1 > dist2) {
            float dist_pow_3 = dist1*dist1*dist1;

            outColor.g = ((outColor.r * dist_pow_3 * 3.0) ) + (dist1 - 0.45)/* / 1.5*/;
            outColor.b =  (outColor.g * dist_pow_3)                          * dist1;
            outColor.r = ((outColor.b * dist_pow_3)       + cos(dist1) / 4.0) * dist1;
        }
        else {
            float dist_pow_3 = dist2*dist2*dist2;

            outColor.g = ((outColor.r * dist_pow_3 * 3.0)) + (dist2 - 0.45) /*/ 1.5*/;
            outColor.b = ((outColor.g * dist_pow_3)) * dist2;
            outColor.r = ((outColor.b * dist_pow_3) + cos(dist2) / 4.0) * dist2;
        }
    }

    else { //red
        if (dist1 > dist2) {
            float dist_pow_3 = dist1*dist1*dist1;

            outColor.r = ((outColor.r * dist_pow_3 * 3.0) ) + (dist1 - 0.45)/* / 1.5*/;
            outColor.g =  (outColor.g * dist_pow_3)                          * dist1;
            outColor.b = ((outColor.b * dist_pow_3)       + cos(dist1) / 4.0) * dist1;
        }
        else {
            float dist_pow_3 = dist2*dist2*dist2;

            outColor.r = ((outColor.r * dist_pow_3 * 3.0)) + (dist2 - 0.45)/* / 1.5*/;
            outColor.g = ((outColor.g * dist_pow_3)) * dist2;
            outColor.b = ((outColor.b * dist_pow_3) + cos(dist2) / 4.0) * dist2;
        }
    }

    float b = (outColor.r + outColor.g + outColor.b) / 2.0;
    outColor.r += (b-outColor.r)*blackwhite;
    outColor.g += (b-outColor.g)*blackwhite;
    outColor.b += (b-outColor.b)*blackwhite;

    gl_FragColor = outColor;
}

