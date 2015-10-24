import ddf.minim.*;

Minim minim;

AudioInput in;

PImage mario_pic;
void setup() {
  size(600, 600);
  mario_pic = loadImage("2.gif");
  //set up the sketch
  background(0); //optinal;
  noStroke();
  //initialize the library
  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw() {
  background(0);
  //image(mario_pic, 0, 0);
  mario_pic.loadPixels();
  for (int y = 0; y<mario_pic.height; y++) {
    for (int x = 0; x<mario_pic.width; x++) {
      color pickcolor = mario_pic.get(x, y);
      fill(pickcolor);
      float modifier = in.left.get(y*32+x)*7;
      ellipse(x*width/32, y*height/32, modifier*width/32, modifier*height/32);
    }
  }
  mario_pic.updatePixels();
}

