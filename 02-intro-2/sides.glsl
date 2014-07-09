void sideLengths(
  highp float hypotenuse, 
  highp float angleInDegrees, 
  out highp float opposite, 
  out highp float adjacent) {

	highp float angleInRadians = radians(angleInDegrees);
    
  opposite = sin(angleInRadians) * hypotenuse;
  adjacent = cos(angleInRadians) * hypotenuse;
}

//Do not change this line
#pragma glslify: export(sideLengths)