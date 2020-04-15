class PaletteGenerator {
  public color[] generateRandomPalette(int paletteSize) {
    color[] result = new color[paletteSize];
    
    result[paletteSize - 1] = color(random(256), random(256), random(256));
    
    float dim = 0.9;
    for (int i = paletteSize - 2; i >= 0; i--) {
      result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);     
    }
    if (random(1) > 0.2) {  
      int liquidStartIndex = int(random(paletteSize) - 1);
      result[liquidStartIndex] = color(random(256), random(256), random(256));
      
      for (int i = liquidStartIndex - 1; i >= 0; i--) {
        result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);
      }
    }
    return result;
  }
  
  public color[] generateVulcanicPalette(int paletteSize) {
    color[] result = new color[paletteSize];
    
    result[paletteSize - 1] = color(random(32) + 32, random(32) + 32, random(32) + 64);
    
    float dim = 0.9;
    for (int i = paletteSize - 2; i >= 0; i--) {
      result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);     
    }
    if (random(1) > 0.2) {
      int liquidStartIndex = int(random(paletteSize));
      result[liquidStartIndex] = color(random(32) + 224, random(64) + 64, random(32) + 0);
      
      for (int i = liquidStartIndex - 1; i >= 0; i--) {
        result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);
      }
    }
    return result;
  }
}
