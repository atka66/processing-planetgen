Planet planet;

void setup() {
  size(1000, 600, P2D);
  noStroke();
  planet = new Planet();
}

void draw() {
  background(192);
  planet.drawPlanet(16, 16, 1);
  planet.drawPlanet(384, 64, 3);
}

void keyPressed() {
  planet = new Planet();
}
