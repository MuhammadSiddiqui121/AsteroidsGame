class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
Spaceship ship; // Declare a variable of type Spaceship
Star[] stars;   // Array to hold stars
int numStars = 100; // Number of stars

void setup() {
  size(800, 800); // Screen dimensions
  ship = new Spaceship(); // Initialize the spaceship
  stars = new Star[numStars]; // Initialize stars array
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star((float)(Math.random() * width), (float)(Math.random() * height)); // Random star positions
  }
}

void draw() {
  background(0); // Clear the screen (black)
  for (Star star : stars) { // Draw all stars
    star.show();
  }
  ship.move(); // Move the spaceship
  ship.show(); // Show the spaceship
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-5); // Turn left
  } else if (keyCode == RIGHT) {
    ship.turn(5); // Turn right
  } else if (keyCode == UP) {
    ship.accelerate(0.1); // Accelerate forward
  } else if (key == ' ') {
    ship.hyperspace(); // Activate hyperspace
  }
}

class Spaceship extends Floater {
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

class Star {
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


