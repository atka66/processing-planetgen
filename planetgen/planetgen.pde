Planet[] planets;
Space space;

color bg = color(0, 0, 0); 
int paletteSize = 7;
int plScale = 3;
int maxPlSize = 4;

int starCount = 1024;

int gCols = 1;
int gRows = 1;

boolean showHelp = false;
boolean enableRandomSize = true;
boolean spotlightMode = false;

void setup() {
  size(1000, 600, P2D);
  noStroke();

  textSize(32);
  reconstructPlanets();
}

void draw() {
  background(bg);
  for (int i = 0; i < planets.length; i++) {
    Planet p = planets[i];
    if (spotlightMode) {
      space.drawSpace(plScale);
      p.drawPlanet((width / 2) - (p.getWidth() * plScale / 2), (height / 2) - (p.getHeight() * plScale / 2), plScale);
    } else {
      p.drawPlanet((width / gCols) * (i % gCols), (height / gRows) * (i / gCols), plScale);
    }
  }
  if (showHelp) {
    surface.setTitle("Scale: " + plScale + " - Max size: " + (maxPlSize * 16) + " - Star count: " + starCount);
    this.showHelp();
  } else {
    surface.setTitle("Planet generator - Press 'h' for help");
  }
}

void keyPressed() {
  switch (key) {
  case 'h':
    showHelp = !showHelp;
    break;
  case 'q':
    plScale++;
    reconstruct();
    break;
  case 'a':
    if (plScale > 1) {
      plScale--;
    }
    reconstruct();
    break;
  case 'e':
    maxPlSize++;
    reconstruct();
    break;
  case 'd':
    if (maxPlSize > 1) {
      maxPlSize--;
    }
    reconstruct();
    break;
  case 'z':
    enableRandomSize = !enableRandomSize;
    reconstruct();
    break;
  case ' ':
    reconstruct();
    break;
  case 'g':
    spotlightMode = !spotlightMode;
    reconstruct();
    break;
  case 'w':
    starCount *= 2;
    reconstruct();
    break;
  case 's':
    if (starCount > 1) {
      starCount /= 2;
    }
    reconstruct();
    break;
  }
}

private void reconstruct() {
  if (spotlightMode) {
    reconstructSpace();
    reconstructPlanet();
  } else {
    reconstructPlanets();
  }
}

private void reconstructPlanets() {
  gCols = (width / (maxPlSize * 16)) / plScale;
  gRows = (height / (maxPlSize * 16)) / plScale;
  planets = new Planet[gCols * gRows];
  for (int i = 0; i < planets.length; i++) {
    planets[i] = createRandomPlanet();
  }
}

private void reconstructPlanet() {
  gCols = 1;
  gRows = 1;
  planets = new Planet[] {
    createRandomPlanet()
  };
}

private void reconstructSpace() {
  space = new Space(starCount);
}

private Planet createRandomPlanet() {
  int w = enableRandomSize ? (int(random(maxPlSize)) + 1) * 16 : maxPlSize * 16;
  int h = w;
  return new Planet(w, h, paletteSize);
}

private void showHelp() {
  fill(255, 255, 255);
  text("'h' - show/hide help", 32, 32);
  text("'z' - enable/disable random planet sizes", 32, 64);
  text("'q' - scale up", 32, 96);
  text("'a' - scale down", 32, 128);
  text("'e' - raise max size", 32, 160);
  text("'d' - lower max size", 32, 192);
  text("SPACEBAR - reconstruct planets", 32, 224);
  text("'g' - enable/disable spotlight mode", 32, 256);
  text("'w' - double star count", 32, 288);
  text("'s' - halve star count", 32, 320);
}
