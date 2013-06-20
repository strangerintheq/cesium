varying vec3 v_positionEC;
varying vec3 v_normalEC;
varying vec2 v_st;

void main()
{
    vec3 positionToEyeEC = -v_positionEC; 

    czm_materialInput materialInput;
    materialInput.normalEC = normalize(v_normalEC);
    materialInput.positionToEyeEC = positionToEyeEC;
    materialInput.st = v_st;
    czm_material material = czm_getMaterial(materialInput);
    
#ifdef FLAT    
    gl_FragColor = vec4(material.diffuse + material.emission, material.alpha);
#else
    gl_FragColor = czm_phong(normalize(positionToEyeEC), material);
#endif
}
