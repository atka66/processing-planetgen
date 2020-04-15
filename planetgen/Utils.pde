static class Utils {
  public static boolean isInsideCircle(int x, int centerX, int y, int centerY, int radius) {
    return sq(x - centerX) + sq(y - centerY) < sq(radius);
  }
}
