public class Rover {
  private int x, y;
  private final int SPEED = 3, SIZE = 15;
  private color c = #00FF00;
  
  public Rover(int x, int y) {
     this.x = x;
     this.y = y;
  }
  
  public void move() {
    x += SPEED;
    y += SPEED;
  }
  
  private PVector pickDirection(float[][] nearby) {
    PVector direction = new PVector(3,3);
    return direction;
  }
  
  public void draw() {
    fill(c);
    circle(x, y, SIZE);
  }
}
