class SurfaceGenerator {
  
  private final int hillCount = 1000;
  private final int hillRadMin = 5;
  private final int hillRadMax = 20;
  private final int hillHeightMin = 2;
  private final int hillHeightMax = 5;

  public int[][] generateTerrain(int width, int height, int paletteSize) {
    int[][] result = new int[height][width];
    for (int i = 0; i < hillCount; i++) {
      result = this.applyRandomHill(result);
    }
    result = this.flattenTerrain(result, paletteSize);
    return result;
  }
  
  private int[][] applyRandomHill(int[][] terrain) {
    int hillRad = int(hillRadMin + random(hillRadMax - (hillRadMin - 1)));
    int hillX = int(random(terrain[0].length + (2 * hillRad)) - hillRad);
    int hillY = int(random(terrain.length + (2 * hillRad)) - hillRad);
    int hillHeight = int(hillHeightMin + random(hillHeightMax - (hillHeightMin - 1)));
    for (int i = hillY - hillRad; i < hillY + hillRad; i++) {
      for (int j = hillX - hillRad; j < hillX + hillRad; j++) {
        if (!isIndexOutOfBounds(i, terrain.length, j, terrain[0].length)) {
          if (sq(j - hillX) + sq(i - hillY) < sq(hillRad)) {
            terrain[i][j] += hillHeight;
          }
        }
      }
    }
    return terrain;
  }
  
  private boolean isIndexOutOfBounds(int indexX, int boundX, int indexY, int boundY) {
    return indexX < 0 || indexX >= boundX || indexY < 0 || indexY >= boundY;
  }
  
  private int[][] flattenTerrain(int[][] terrain, int paletteSize) {
    double maxHeight = this.getMaxHeight(terrain);
    double minHeight = this.getMinHeight(terrain);
    double maxMinDiff = maxHeight - minHeight;
    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[i].length; j++) {
        terrain[i][j] = (int)(((terrain[i][j] - minHeight) / maxMinDiff) * (paletteSize - 1));
      }
    }
    return terrain;
  }
  
  private int getMaxHeight(int[][] terrain) {
    int max = 0;
    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[i].length; j++) {
        if (terrain[i][j] > max) {
          max = terrain[i][j];
        }
      }
    }
    return max;
  }
  
  private int getMinHeight(int[][] terrain) {
    int min = MAX_INT;
    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[i].length; j++) {
        if (terrain[i][j] < min) {
          min = terrain[i][j];
        }
      }
    }
    return min;
  }
}
