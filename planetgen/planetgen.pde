Planet planet;

color bg = color(0, 0, 0);
int plWidth = 128;
int plHeight = 128;
int paletteSize = 7;

void setup() {
  size(1000, 600, P2D);
  noStroke();
  planet = new Planet(plWidth, plHeight, paletteSize);
}

void draw() {
  background(bg);
  planet.drawPlanet(16, 16, 1);
  planet.drawPlanet(256, 32, 4);
}

void keyPressed() {
  planet = new Planet(plWidth, plHeight, paletteSize);
}
