Planet[] planets;

int plCount = 5;
color bg = color(0, 0, 0);
int plWidth = 64;
int plHeight = 64;
int paletteSize = 10;
int plScale = 3;

void setup() {
  size(1200, 600, P2D);
  noStroke();
  planets = new Planet[plCount];
  reconstructPlanets();
}

void draw() {
  background(bg);
  for (int i = 0; i < plCount; i++) {
    planets[i].drawPlanet(((i + 1) * 16) + (i * plWidth * plScale), 16, 1);
    planets[i].drawPlanet(((i + 1) * 16) + (i * plWidth * plScale), 192, plScale);
  }
}

void keyPressed() {
  if (key == ' ') {
    reconstructPlanets();
  }
}

private void reconstructPlanets() {
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(plWidth, plHeight, paletteSize);
  }
}
