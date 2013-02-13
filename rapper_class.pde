class Rapper {
  PShape s;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Rapper (PShape _s, PVector _location) {
    s = _s;
    location = _location;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 1;
  }

  void update() {
    if (mousePressed && state == true) {
      // move to the right and randomly up or down
      location.y += random(-5, 5);
      location.x += random (0,10);
    } 
    else if (mousePressed && state == false) {
      // move to the left and randomly up of down
      location.y += random(-5, 5);
      location.x -= random (0,10);
    } 
  }

  void display() {
    shapeMode(CENTER);
    shape(s, location.x, location.y);
  }
}

