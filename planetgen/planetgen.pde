Planet[] planets;

color bg = color(0, 0, 0); 
int paletteSize = 7;
int plScale = 3;
int maxPlSize = 4;

int gCols = 1;
int gRows = 1;

boolean showHelp = false;
boolean enableRandomSize = true;

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
    p.drawPlanet((width / gCols) * (i % gCols), (height / gRows) * (i / gCols), plScale);
  }
  if (showHelp) {
    surface.setTitle("Scale: " + plScale + " - Max size: " + (maxPlSize * 16));
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
    case 'z':
      enableRandomSize = !enableRandomSize;
      reconstructPlanets();
      break;
    case ' ':
      reconstructPlanets();
      break;
    case 'q':
      plScale++;
      reconstructPlanets();
      break;
    case 'a':
      if (plScale > 1) {
        plScale--;
      }
      reconstructPlanets();
      break;
    case 'e':
      maxPlSize++;
      reconstructPlanets();
      break;
    case 'd':
      if (maxPlSize > 1) {
        maxPlSize--;
      }
      reconstructPlanets();
      break;
  }
}

private void reconstructPlanets() {
  gCols = (width / (maxPlSize * 16)) / plScale;
  gRows = (height / (maxPlSize * 16)) / plScale;
  planets = new Planet[gCols * gRows];
  for (int i = 0; i < planets.length; i++) {
    int w = enableRandomSize ? (int(random(maxPlSize)) + 1) * 16 : maxPlSize * 16;
    int h = w;
    planets[i] = new Planet(w, h, paletteSize);
  }
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
}
