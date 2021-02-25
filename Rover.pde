public class Rover {
  private int x, y;
  private final int SPEED = 3, SIZE = 15;
  private color c = #00FF00;
  
  public Rover(int x, int y) {
     this.x = x;
     this.y = y;
  }
  
  public void move(float[][] world) {
    PVector direction = pickDirection(getNearby(world));
    x += direction.x * SPEED;
    y += direction.y * SPEED;
  }
  
  public float[][] getNearby(float[][] world) {
    //location of Rover in the matrix
    int r = y / 3;
    int c = x / 3;
    
    float[][] nearby = new float[3][3];
    for (int i = 0; i < nearby.length; i++) {
      for (int j = 0; j < nearby[0].length; j++) {
        nearby[i][j] = world[r+i-1][c+j-1];
      }
    }
    return nearby;
  }
  
  private PVector pickDirection(float[][] nearby) {
    //convert nearby matrix to diffs matrix
    float[][] diffs = new float[nearby.length][nearby[0].length];
    float myHeight = nearby[1][1];
    for (int row = 0; row < nearby.length; row++) {
      for (int col = 0; col < nearby[0].length; col++) {
         diffs[row][col] = abs(nearby[row][col] - myHeight);
      }
    }
    
    //find lowest value in matrix diffs
    float min = 255;
    PVector direction = null;
    for (int row = 0; row < diffs.length; row++) {
      for (int col = 0; col < diffs[0].length; col++) {
        //ignore middle spot
        if (row == 1 && col == 1) continue;
        
        float diff = diffs[row][col];
        if (diff < min) { 
          min = diff;
          direction = new PVector(col-1, row-1);
        }
      }
    }
    
    return direction;
  }
  
  public void draw() {
    fill(c);
    circle(x, y, SIZE);
  }
}
