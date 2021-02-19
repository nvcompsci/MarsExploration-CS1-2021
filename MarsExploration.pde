float[][] terrain = new float[200][200];
Rover rover;

public void setup() {
  size(600,600);
  noStroke();
  for (int i = 0; i < terrain.length; i++) {
    for (int j = 0; j < terrain[0].length; j++) {
      float xOffset = map(j, 0, 200, 0, 10);
      float yOffset = map(i, 0, 200, 0, 10);
      terrain[i][j] = noise(xOffset,yOffset);
    }
  }
}

public void draw() {
  background(200);
  
  for (int i = 0; i < 200; i++) {
    for (int j = 0; j < 200; j++) {
      drawPoint(terrain[i][j],j*3,i*3);
    }
  }
  
  if (rover != null) {
    rover.move();
    rover.draw();
  }
}

public void drawPoint(float point, int x, int y) {
  float grayscale = map(point, 0, 1, 0, 255); 
  fill(grayscale,0,100);
   square(x, y, 3);
}

public void mouseClicked() {
  rover = new Rover(mouseX, mouseY); 
}
