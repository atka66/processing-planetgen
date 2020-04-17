class Star {
  private int x;
  private int y;
  private color col;
  public Star (int x, int y, int col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }
  
  public void drawStar() {
    pushMatrix();
    //translate(x, y);
    fill(col);
    square(x, y, 1);
    popMatrix();
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public color getCol() {
    return col;
  }
  
}
