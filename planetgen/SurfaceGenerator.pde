class SurfaceGenerator {
  
  private int hillRadMin;
  private int hillRadMax;
  private int hillCount;
  
  public SurfaceGenerator(int hillRadMin, int hillRadMax, int hillCount) {
    this.hillRadMin = hillRadMin;
    this.hillRadMax = hillRadMax;
    this.hillCount = hillCount;
  }

  public int[][] generatePlanetSurface(int w, int h, int paletteSize) {
    int[][] result = new int[h][w];
    for (int i = 0; i < hillCount; i++) {
      result = this.applyRandomHill(result);
    }
    result = this.flattenTerrain(result, paletteSize);
    return result;
  }
  
  public int[][] generateNebulaSurface(int w, int h, int paletteSize) {
    int[][] result = new int[h][w];
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
    for (int k = 1; k < hillRad; k++) {
      for (int i = hillY - k; i < hillY + k; i++) {
        for (int j = hillX - k; j < hillX + k; j++) {
          if (!isIndexOutOfBounds(i, terrain.length, j, terrain[0].length)) {
            if (Utils.isInsideCircle(j, hillX, i, hillY, hillRad)) {
              terrain[i][j] += 1;
            }
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
