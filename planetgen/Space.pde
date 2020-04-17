class Space {
  private color bgColor;
  private Star[] stars;
  
  public Space(int starCount) {
    SpaceGenerator spGen = new SpaceGenerator();
    
    bgColor = color(random(8), random(8), random(8));
    stars = spGen.generateStars(starCount);
  }
  
  public void drawSpace(int scale) {
    pushMatrix();
    scale(scale);
    for (Star star : stars) {
      star.drawStar();
    }
    popMatrix();
  }
  
  public color getBgColor() {
    return bgColor;
  }
  
  public Star[] getStars() {
    return stars;
  }
}
