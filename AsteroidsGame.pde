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



