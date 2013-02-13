// nature of outkast
// february 2013, by Sam Slover

/* @pjs preload="0.svg, 1.svg, 2.svg, 3.svg, 4.svg, 5.svg, andre.svg, bb.svg";*/

boolean state = false;

Rapper andre;
Rapper bigboi;
int clickTracker = 0;
float r = 26;
float g = 229;
float b = 99;
int lastTime = 0;

// array of special effect objects
ArrayList effects;
PShape[] effectshape = new PShape [6];


void setup () {
  size(980, 653);
  frameRate(30);
  // set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  //bring in outkast!
  PShape andreShape = loadShape("andre.svg");
  PShape bigboiShape = loadShape("bb.svg");
  andre = new Rapper(andreShape, new PVector(width/2+225, height/2));
  bigboi = new Rapper(bigboiShape, new PVector(width/2-225, height/2));
  // bring in the special effects
  // load images for the menu items
  for (int i = 0; i < effectshape.length; i++) {
    effectshape[i] = loadShape(i + ".svg");
  }
  //set up the empty arraylist of effects
  effects =  new ArrayList();
}

void draw() {
  setBackground();
  for (int i = effects.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing,
    // so we have to cast the object coming out.
    Effect effect = (Effect) effects.get(i);
    effect.display();
    effect.update();
  }   
    bigboi.display();
    andre.display();
    bigboi.update();
    andre.update();
}

// set bg color function
void setBackground() {
  // make bg color into perlin noise based on user mouse clicks
  float xoff = 0.0;
  float yoff = 0.0;
  xoff += 0.01;
  yoff += 0.01;
  if (mousePressed) {
    r = map(noise(xoff), 0, 1, 0, random(0, 255));
    g = map(noise(yoff), 0, 1, 0, random(0, 255));
  } 
  color col = color(r, g, b);
  background(col);
}

void mousePressed() {
  int lastTime = 0;
  int ran = (int) random(0,6);
  effects.add(new Effect(effectshape[ran])); 
  state = !state; 
  println (state);
}

