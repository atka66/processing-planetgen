Planet[] planets;

color bg = color(0, 0, 0);
int plSize = 64;
int paletteSize = 10;
int plScale = 3;

int gCols = 4;
int gRows = 5;

void setup() {
  size(800, 1000, P2D);
  noStroke();
  planets = new Planet[gCols * gRows];
  reconstructPlanets();
}

void draw() {
  background(bg);
  for (int i = 0; i < planets.length; i++) {
    Planet p = planets[i];
    p.drawPlanet((width / gCols) * (i % gCols), (height / gRows) * (i / gCols), plScale);
  }
}

void keyPressed() {
  if (key == ' ') {
    reconstructPlanets();
  }
}

private void reconstructPlanets() {
  for (int i = 0; i < planets.length; i++) {
    int w = int(random(32) + (plSize - 32));
    int h = w;
    planets[i] = new Planet(w, h, paletteSize);
  }
}
