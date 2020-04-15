class PaletteGenerator {
  
  float dim = 0.9;
  
  public color[] generatePalette(int paletteSize) {
    color[] result = new color[paletteSize];
    
    //result[paletteSize - 1] = color(random(196), random(256), random(196));
    result[paletteSize - 1] = color(random(96), random(128), random(196));
    
    for (int i = paletteSize - 2; i >= 0; i--) {
      result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);     
    }
    
    if (random(1) > 0.2) {
      
      //int liquidStartIndex = int(random(paletteSize) - 1);
      //result[liquidStartIndex] = color(random(128), random(128), random(196));
      int liquidStartIndex = int(random(paletteSize));
      result[liquidStartIndex] = color(random(256), random(192), random(96));
      
      for (int i = liquidStartIndex - 1; i >= 0; i--) {
        result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);
      }
    }
    
    return result;
  }
}
