class Effect {
  PShape s;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float colorR;
  float colorG;
  float colorB;
  float topspeed;

  Effect (PShape _s) {
    s = _s;
    colorR = random(0, 255);
    colorG = random(0, 255);
    colorB = random(0, 255);
    location = new PVector(mouseX, mouseY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 10;
  }

  void update() {
    float xoff = 0.0;
    float yoff = 10000;
    acceleration.x = map(noise(xoff),0, 1, random(-1,1), random(-1,1));
    acceleration.y = map(noise(yoff),0, 1, random(-1,1), random(-1,1));
    xoff += 0.6;
    yoff += 0.6;
    velocity.add(acceleration);
    location.add(velocity);
//    PVector mouse = new PVector(mouseX,mouseY);
//    PVector dir = PVector.sub(mouse,location);
//    dir.normalize();
//    dir.mult(0.5);
//    acceleration = dir;
//    acceleration.x += map(noise(xoff),0, 1, random(-1,1), random(-1,1));
//    acceleration.y += map(noise(yoff),0, 1, random(-1,1), random(-1,1)); 
//    velocity.add(acceleration);
//    velocity.limit(topspeed);
//    location.add(velocity);
  }

  void display() {
    s.disableStyle();
    if (millis() - lastTime > 500) {
      float xoff = 0.0;
      float yoff = 0.0;
      xoff += 0.01;
      yoff += 0.01;
      colorB = map(noise(xoff), 0, 1, 0, random(0, 255));
      colorG = map(noise(yoff), 0, 1, 0, random(0, 255)); 
      lastTime = millis();
    }
    stroke(colorR, colorG, colorB);
    fill (colorR, colorG, colorB);
    strokeWeight(1);
    shapeMode(CENTER);
    shape(s, location.x, location.y);
  }
}

