// Obstacle class

class Obstacle {
  float x, y, size, speedX, speedY; // Define postion, size and speed

  // Constructor for Obstacle class
  Obstacle(float x, float y, float size, float speedX, float speedY) {
    this.x = x; // X position
    this.y = y; // Y position
    this.size = size; // Size of obstacle
    this.speedX = speedX; // X axis speed
    this.speedY = speedY; // Y axis speed
  }

  // Update the position of the obstacle based on the speed
  void update() {
    x += speedX; // Move x by speedX
    y += speedY; // Move y by speedY


    // Make obstacle wrap around the edges of the screen
    if (x < 0) x = width; // Reappear on the right if it goes of the left side of the screen
    if (x > width) x = 0; // Reappear on the left side if it goes off the right side of the screen
    if (y < 0) y = height; // Reappear at the bottom if it goes off the top of the screen
    if (y > height) y = 0; // Reappear at the top if it goes off the bottom of the screen
  }

  // Set obstacle to yellow circle
  void render() {
    fill(255, 255, 0); // Set colour to yellow
    ellipse(x, y, size, size); // Draw the obstacle as a circle
  }

  // Shift the obstacle's position by a given amount
  void shift(float dx, float dy) {
    x += dx; // Adjust x by dx
    y += dy; // Adjust y by dy
  }
}
