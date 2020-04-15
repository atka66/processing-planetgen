class Planet {
  
  color[] palette;
  int[][] surface;
  
  private final int ambOccBorder = 1;
  
  Planet (int planetWidth, int planetHeight, int paletteSize) {
    PaletteGenerator pGen = new PaletteGenerator();  
    this.palette = pGen.generateRandomPalette(paletteSize);
    //this.palette = pGen.generateVulcanicPalette(paletteSize);
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
    this.drawCircleShadow();
    this.drawCircleOutside();
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
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        if (!Utils.isInsideCircle(j, rad, i, rad, rad - (ambOccBorder))) {
          fill(0, 0, 0, 96);
          square(j, i, 1); 
        }
      }
    }
  }
  
  private void drawCircleShadow() {
    int rad = this.surface.length / 2;
    for (int i = 0; i < this.surface.length; i++) {
      for (int j = 0; j < this.surface[i].length; j++) {
        if (!Utils.isInsideCircle(j, rad + (rad / 4), i, 3 * rad / 4, (int)(rad * 0.9))) {
          fill(0, 0, 0, 48);
          square(j, i, 1); 
        }
      }
    }
  }
}
