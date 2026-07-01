// Declare main variables
ArrayList<Obstacle> obstacles; // List to store obstacles
Player player;
boolean gameOver = false; // Track game state

void setup() {
  size(800, 600); // Set the window size
  player = new Player(width / 2, height / 2, 30); // Set player at centre
  obstacles = new ArrayList<>(); // List to hold obstacles
  
  // Create initial obstacles
  for (int i = 0; i < 5; i++) { // Create 5 obstacles with random position and speed
    obstacles.add(new Obstacle(random(width), random(height), 20, random(-2, 2), random(-2, 2)));
  }
}

void draw() {
  if(!gameOver){
    background(0); // Set black background
    // Render the player and obstacles
    player.render(); // Render player

    for (Obstacle o : obstacles) { 
      o.update(); // Update obstacle position
      o.render(); // Render obstacle
      
      // Check if player hits an obstacle
      if (player.collidesWith(o)) {
        gameOver = true; // Set the game over screen
      }
    }

  } else {
    background(0); // Set black background when game is over
    fill(255,0,0); // Set colour of text to red
    textSize(50); // Set text size
    textAlign(CENTER); // Set text to centre of the screen
    text("You died!", width / 2, height / 2); // Display message
  }
}

void keyPressed() {
  // Move obstacles in response to player input
  if (!gameOver) {
    for (Obstacle o : obstacles) {
      if (keyCode == UP) {
        o.shift(0, -10); // Move obstacles down if up is pressed
      } else if (keyCode == DOWN) {
        o.shift(0, 10); // Move obstacles up if down is pressed
      } else if (keyCode == LEFT) {
        o.shift(-10, 0); // Move obstacles right if left is pressed
      } else if (keyCode == RIGHT) {
        o.shift(10, 0); // Move obstacles left if right is pressed
      }
    }
  }
}
