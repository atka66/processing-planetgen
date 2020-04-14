class Planet {
  
  color[] palette;
  int[][] surface;
  
  private final int border = 5;
  
  Planet (int planetWidth, int planetHeight, int paletteSize) {
    PaletteGenerator pGen = new PaletteGenerator();  
    this.palette = pGen.generatePalette(paletteSize);
    SurfaceGenerator sGen = new SurfaceGenerator();
    this.surface = sGen.generateTerrain(planetWidth, planetHeight, paletteSize);
  }
  
  void drawPlanet(int x, int y, int scale) {
    translate(x, y);
    scale(scale);
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        fill(this.palette[this.surface[i][j]]);
        square(j, i, 1);
      }
    }
    drawOuter();
  }
  
  private void drawOuter() {
    int rad = this.surface.length / 2;
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        if (sq(j - rad) + sq(i - rad) >= sq(rad)) {
          fill(g.backgroundColor);
          square(j, i, 1); 
        }
      }
    }
  }
}
