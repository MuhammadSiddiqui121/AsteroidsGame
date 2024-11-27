class Spaceship extends Floater  
{   
    
  public Spaceship() {
    // Initialize all inherited variables
    corners = 3; // Triangle-shaped spaceship
    xCorners = new int[]{0, 10, -10}; // X-coordinates of the triangle
    yCorners = new int[]{-15, 10, 10}; // Y-coordinates of the triangle
    myColor = color(255, 255, 255); // White color
    myCenterX = width / 2; // Start at center of screen
    myCenterY = height / 2;
    myXspeed = 0; // Initial speed
    myYspeed = 0;
    myPointDirection = 0; // Facing upward
  }

  @Override
  public void hyperspace() {
    myCenterX = Math.random() * width; // Random X position
    myCenterY = Math.random() * height; // Random Y position
    myXspeed = 0; // Stop horizontal movement
    myYspeed = 0; // Stop vertical movement
    myPointDirection = Math.random() * 360; // Random direction
  }

}
