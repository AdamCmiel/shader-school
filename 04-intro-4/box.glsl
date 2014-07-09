bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 x) {
  
  //Test if the point x is inside the box bounded by [lo, hi]
  bvec2 greater = greaterThanEqual(x, lo);
  bvec2 lesser = lessThanEqual(x, hi);

  bvec4 isInBounds = bvec4(greater, lesser);
  return all(isInBounds);

  // return all(bvec4(greaterThanEqual(x, lo),
  //                  lessThanEqual(x, hi)));
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)