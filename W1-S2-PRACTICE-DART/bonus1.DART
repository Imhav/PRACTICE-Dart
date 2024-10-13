class Robot {
  double x;
  double y;
  String currentDirection;
  List<String> directions = ["North", "East", "South", "West"];

  Robot(this.x, this.y, this.currentDirection);

  void turn(String turnDirection) {
    if (turnDirection == 'R') {
      turnRight();
    } else if (turnDirection == 'L') {
      turnLeft();
    }
  }

  void turnRight() {
    currentDirection =
        directions[(directions.indexOf(currentDirection) + 1) % 4];
  }

  void turnLeft() {
    currentDirection =
        directions[(directions.indexOf(currentDirection) - 1 + 4) % 4];
  }

  void move() {
    if (currentDirection == 'North') {
      y += 1;
    } else if (currentDirection == 'East') {
      x += 1;
    } else if (currentDirection == 'South') {
      y -= 1;
    } else if (currentDirection == 'West') {
      x -= 1;
    }
  }

  void processCommand(String command) {
    if (command == 'A') {
      move();
    } else {
      turn(command);
    }
  }

  void executeInstructions(String instructions) {
    for (var command in instructions.split('')) {
      processCommand(command);
    }
  }

  void displayPosition() {
    print("[$x, $y, $currentDirection]");
  }
}

void main() {
  var robot = Robot(7, 3, "North");
  robot.executeInstructions("RAALAAAL");
  robot.displayPosition();
}
