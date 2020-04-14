class Planet {
  
  color[] palette;
  int[][] surface;
  
  Planet () {
    int planetSize = 32 * (1 + int(random(4)));
    int paletteSize = (3 + int(random(2)));
    
    SurfaceGenerator generator = new SurfaceGenerator();
    
    this.surface = generator.generateTerrain(planetSize, planetSize);
    
    boolean hasLiquid = random(1) > 0.5;
  }
  
  void drawPlanet(int x, int y, int scale) {
    translate(x, y);
    scale(scale);
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        fill(this.surface[i][j] * 10);
        square(i, j, 1);
      }
    }
  }
}
