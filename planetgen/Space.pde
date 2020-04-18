class Space {
  color[] nebulaPal;
  private int[][] nebulaSurf;
  private Star[] stars;
  
  public Space(int starCount, int scale) {
    PaletteGenerator pGen = new PaletteGenerator();
    this.nebulaPal = pGen.generateNebulaPalette(paletteSize);
    SurfaceGenerator sGen = new SurfaceGenerator(10, 50, 500);
    this.nebulaSurf = sGen.generateNebulaSurface(width / scale, height / scale, paletteSize);
    
    SpaceGenerator spGen = new SpaceGenerator();
    stars = spGen.generateStars(starCount, scale);
  }
  
  public void drawSpace(int scale) {
    pushMatrix();
    scale(scale);
    for (int i = 0; i < nebulaSurf.length; i++) {
      for (int j = 0; j < nebulaSurf[i].length; j++) {
        fill(nebulaPal[nebulaSurf[i][j]]);
        square(j, i, 1);
      }
    }
    for (Star star : stars) {
      star.drawStar();
    }
    popMatrix();
  }
  
  public Star[] getStars() {
    return stars;
  }
}
