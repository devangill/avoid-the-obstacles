// Player class

class Player {
  float x, y, size; // Define position and size

  // Constructor for player 
  Player(float x, float y, float size) {
    this.x = x; // X postion
    this.y = y; // Y postion
    this.size = size; // Size of player
  }

  // Set player to purple circle
  void render() {
    fill(128, 0, 128); // Set colour to purple
    ellipse(x,y,size,size); // Draw the player as a circle
  }

  // Detect if player hits an obstacle
  boolean collidesWith(Obstacle o) {
    return dist(x, y, o.x, o.y) < (size / 2 + o.size / 2); // Detect collision using distance
  }
}
