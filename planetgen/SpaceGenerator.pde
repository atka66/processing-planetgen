class SpaceGenerator {
  
  public Star[] generateStars(int starCount, int scale) {
    int count = starCount / scale;
    Star[] result = new Star[count];
    
    for (int i = 0; i < result.length; i++) {
      result[i] = new Star(int(random(width / scale)), int(random(height / scale)));
    }
    
    return result;
  }
}
