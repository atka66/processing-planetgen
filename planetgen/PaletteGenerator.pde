class PaletteGenerator {
  public color[] generatePalette(int paletteSize) {
    color[] result = new color[paletteSize];
    result[paletteSize - 1] = color(random(196), random(256), random(196));
    for (int i = paletteSize - 2; i >= 0; i--) {
      result[i] = color(red(result[i + 1]) * 0.8, green(result[i + 1]) * 0.8, blue(result[i + 1]) * 0.8);     
    }
    
    if (random(1) > 0.2) {
      int liquidStartIndex = int(random(paletteSize) - 1);
      result[liquidStartIndex] = color(random(128), random(128), random(196));
      for (int i = liquidStartIndex - 1; i >= 0; i--) {
        result[i] = color(red(result[i + 1]) * 0.8, green(result[i + 1]) * 0.8, blue(result[i + 1]) * 0.8);
      }
    }
    
    return result;
  }
}
