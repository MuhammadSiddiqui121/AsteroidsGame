class Star //note that this class does NOT extend Floater
{
    private float x, y; // Star position
  private int color;  // Star color

  public Star(float x, float y) {
    this.x = x;
    this.y = y;
    this.color = color(255, 255, 0); // Yellow color
  }

  public void show() {
    fill(color);
    noStroke();
    ellipse(x, y, 3, 3); // Draw a small circle for the star
  }

}
