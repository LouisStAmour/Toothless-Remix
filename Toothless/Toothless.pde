import ddf.minim.*;

Minim minim;
AudioPlayer growl;
PImage eel;

void setup() {
  size(600, 300);
  
    // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  growl = minim.loadFile("growl.wav");
  
  eel = loadImage("eel.png");
  noCursor();
}

void draw() {
  background(#E8FFFC);
  if (mousePressed) {
    background(#E8FFFC);
  } 
  stroke(#000000);
  fill(#504C4C);//grey
  triangle(220, 50, 280, 220, 170, 250);//wing
  triangle(380, 50, 430, 250, 320, 220);//wing
  rectMode(CORNER);
  rect(260, 110, 75, 130);//body
  rect(260, 110, 25, 150, 7);//leg
  rect(315, 110, 25, 150, 7);//leg
  triangle(260, 40, 280, 100, 250, 100);//ear
  triangle(340, 40, 320, 100, 350, 100);//ear
  triangle(290, 60, 295, 100, 270, 100);//little horn
  triangle(310, 60, 305, 100, 330, 100);//little horn
  ellipseMode(CENTER);
  ellipse(300, 100, 100, 60);//head
  line(280, 120, 320, 120);

  fill(#B1C6A2);//light green
  ellipse(280, 100, 25, 20);//eye
  ellipse(320, 100, 25, 20);//eye

  fill(#000000);//black
  rectMode(CENTER);
  rect(284, 99, 11, 15, 7);//pupil
  rect(316, 99, 11, 15, 7);//pupil

  fill(#ffffff);//white
  //rect(300, 120, 80, 5);

  if (mouseY > 100 && mouseX > 200 && mouseX < 400) {//if eel nearby, toothless roars
    if(!growl.isPlaying()) {
      if ( growl.position() == growl.length() )
      {
        growl.rewind();
        growl.play();
      }
      else
      {
        growl.play();
      }
    }
    fill(#504C4C);//grey
    ellipse(300, 100, 100, 60);//head
    fill(#B1C6A2);//light green
    ellipse(280, 105, 25, 10);//eye
    ellipse(320, 105, 25, 10);//eye

    fill(#000000);//black
    rectMode(CENTER);
    rect(286, 105, 4, 10, 6);//pupil
    rect(314, 105, 4, 10, 6);//pupil
    fill(#ffffff);
    rect(300, 120, random(40, 60), random(3, 4), 3);
  } else {
    if(growl.isPlaying()) {
      growl.pause();
      growl.rewind();
    }
  }

  //fish
  /*
  stroke(#999999);
  fill(#3F908A);

  triangle(mouseX - 45, mouseY - 15, mouseX - 30, mouseY, mouseX - 45, mouseY + 15);
  fill(#999999);
  triangle(mouseX - 15, mouseY - 15, mouseX - 30, mouseY, mouseX - 15, mouseY + 15);
  rect(mouseX, mouseY, 30, 30);
  fill(#78C69B);
  triangle(mouseX + 15, mouseY - 15, mouseX + 30, mouseY, mouseX + 15, mouseY + 15);
  */
  imageMode(CENTER);
  image(eel, mouseX, mouseY, 242, 100);
}