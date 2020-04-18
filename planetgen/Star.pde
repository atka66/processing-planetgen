class Star {
  private int x;
  private int y;
  private int alpha;
  public Star (int x, int y) {
    this.x = x;
    this.y = y;
    this.alpha = int(random(255));
  }
  
  public void drawStar() {
    pushMatrix();
    //translate(x, y);
    fill(255, 255, 255, alpha);
    square(x, y, 1);
    popMatrix();
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getAlpha() {
    return alpha;
  }
  
}
