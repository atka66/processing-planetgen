class SpaceGenerator {
  
  public Star[] generateStars(int starCount) {
    Star[] result = new Star[starCount];
    
    for (int i = 0; i < result.length; i++) {
      int r = int(random(255));
      int g = r;
      int b = r;
      result[i] = new Star(int(random(width)), int(random(height)), color(r, g, b));
    }
    
    return result;
  }
}
