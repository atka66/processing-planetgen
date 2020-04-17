class PaletteGenerator {
  final int r = 192;
  final int g = 192;
  final int b = 192;
  
  final int rL = 192;
  final int gL = 192;
  final int bL = 192;
  
  public color[] generateRandomPalette(int paletteSize) {
    color[] result = new color[paletteSize];
    
    result[paletteSize - 1] = color(random(r), random(g), random(b));
    
    float dim = 0.9;
    for (int i = paletteSize - 2; i >= 0; i--) {
      result[i] = color(red(result[i + 1]) * dim, green(result[i + 1]) * dim, blue(result[i + 1]) * dim);     
    }
    if (random(1) > 0.2) {  
      int liquidStartIndex = int(random(paletteSize - 4) + 2);
      System.out.println(liquidStartIndex + " - " + paletteSize);
      result[liquidStartIndex] = color(random(rL), random(gL), random(bL));
      
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
