class SurfaceGenerator {
  private final int hillCount = 100;
  private final int hillRadMin = 3;
  private final int hillRadMax = 10;
  private final int hillHeightMin = 3;
  private final int hillHeightMax = 7;  
  
  public int[][] generateRandom(int width, int height) {
    int[][] result = new int[height][width];
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        result[i][j] = int(random(100));
      }
    }
    return result;
  }
  
  public int[][] generateTerrain(int width, int height) {
    int[][] result = new int[height][width];
    for (int i = 0; i < hillCount; i++) {
      result = this.applyRandomHill(result);
    }
    return result;
  }
  
  private int[][] applyRandomHill(int[][] terrain) {
    int hillX = int(random(terrain[0].length));
    int hillY = int(random(terrain.length));
    int hillRad = int(3 + random(8));
    int hillHeight = int(3 + random(5));
    for (int i = hillY - hillRad; i < hillY + hillRad; i++) {
      for (int j = hillX - hillRad; j < hillX + hillRad; j++) {
        if (!isIndexOutOfBounds(i, terrain.length, j, terrain[0].length)) {
          terrain[i][j] += hillHeight;
        }
      }
    }
    return terrain;
  }
  
  private boolean isIndexOutOfBounds(int indexX, int boundX, int indexY, int boundY) {
    return indexX < 0 || indexX >= boundX || indexY < 0 || indexY >= boundY;
  }
}
