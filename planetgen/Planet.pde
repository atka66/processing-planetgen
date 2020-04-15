class Planet {
  
  color[] palette;
  int[][] surface;
  
  private final int border = 5;
  private final int ambOccBorder = 5;
  
  Planet (int planetWidth, int planetHeight, int paletteSize) {
    PaletteGenerator pGen = new PaletteGenerator();  
    this.palette = pGen.generatePalette(paletteSize);
    SurfaceGenerator sGen = new SurfaceGenerator();
    this.surface = sGen.generateTerrain(planetWidth, planetHeight, paletteSize);
  }
  
  void drawPlanet(int x, int y, int scale) {
    pushMatrix();
    translate(x, y);
    scale(scale);
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        fill(this.palette[this.surface[i][j]]);
        square(j, i, 1);
      }
    }
    this.drawCircleAmbientOcclusion();
    this.drawCircleOutside();
    //this.drawLight();
    popMatrix();
  }
  
  private void drawCircleOutside() {
    int rad = this.surface.length / 2;
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        if (!Utils.isInsideCircle(j, rad, i, rad, rad)) {
          fill(g.backgroundColor);
          square(j, i, 1); 
        }
      }
    }
  }
  
  private void drawCircleAmbientOcclusion() {
    int rad = this.surface.length / 2;
    for (int k = 0; k < ambOccBorder; k++) {
      int alpha = (255 / (ambOccBorder * 4)) * (ambOccBorder - k);
      for (int i = 0; i < this.surface.length; i++) {
        for (int j = 0; j < this.surface[i].length; j++) {
          if (!Utils.isInsideCircle(j - (k / 2), rad - (k / 2), i - (k / 2), rad - (k / 2), rad - (k))) {
            fill(0, 0, 0, alpha);
            square(j, i, 1); 
          }
        }
      }
    }
  }
  
  private void drawLight() {
    int rad = this.surface.length / 2;
    for (int k = 0; k < ambOccBorder; k++) {
      int alpha = (255 / (ambOccBorder * 4)) * (ambOccBorder - k);
      for (int i = 0; i < this.surface.length; i++) {
        for (int j = 0; j < this.surface[i].length; j++) {
          if (!Utils.isInsideCircle(j - (k / 2), rad - (k / 2), i - (k / 2), rad - (k / 2), rad - (k))) {
            fill(0, 0, 0, alpha);
            square(j, i, 1); 
          }
        }
      }
    }
  }
}
