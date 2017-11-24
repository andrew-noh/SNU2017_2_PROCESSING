//Assignment 5
//Computer Vision
//Noh Ha Kyung
//2011-10053
//Title: Tracker MIDI


import processing.video.*;
import ddf.minim.*;

Minim minim;
Capture video;

PImage trackingLayer;
PFont myFont;
Trigger melody1, melody2, melody3, melody4; //Momentary
Trigger bass, drum1, drum2, guitar, vocal; //Loop

int selectionStage = 0;
color trackingColor1;
color trackingColor2;
int trackr1X = 0, trackr1Y = 0;
int trackr2X = 0, trackr2Y = 0;

void setup() {
  size(1280, 800);

  //Minim
  minim = new Minim(this);

  //List devices
  String[] cameras = Capture.list();
  printArray(cameras);

  //Camera
  video = new Capture(this, cameras[15]);
  video.start();

  //Font
  myFont = createFont("Georgia", 12, true);

  //Trigger(instrument channel, file name, label text, looping)
  //Momentary triggers
  melody1 = new Trigger(1, "C1.mp3", "C1", false);
  melody2 = new Trigger(2, "D1.mp3", "D1", false);
  melody3 = new Trigger(3, "E1.mp3", "E1", false);
  melody4 = new Trigger(4, "F1.mp3", "F1", false);

  //Loop Triggers
  drum1 = new Trigger(5, "drum1_long.mp3", "Drum", true);
  //drum2 = new Trigger(6, "drum2_long.mp3", "Drum2", true);
  bass = new Trigger(6, "bass_long.mp3", "Bass", true);
  guitar = new Trigger(7, "guitar_long.mp3", "Guitar", true);
  vocal = new Trigger(8, "vocals-1synced96.mp3", "Vocal", true);

  //Tracking colors
  trackingColor1 = color(155, 19, 229);
  trackingColor2 = color(155, 19, 229);
}


void draw() {

  //Camera
  if (video.available()) {
    video.read();
  }
  //flip();
  image(video, 0, 0);

  //Set colors text
  switch(selectionStage) {
  case 0:
    fill(255);
    textAlign(CENTER);
    textFont(myFont, 18);
    text("Select the color of first tracker \n Press 'r' to reset colors", width/2, height-50);
    break;
  case 1:
    fill(255);
    textAlign(CENTER);
    textFont(myFont, 18);
    text("Select the color of second tracker", width/2, height-50);
    break;
  case 2:
    break;
  }

  //Tracking points
  float bestPixel1 = 500;
  float bestPixel2 = 500;
  int pointerOneX = 0;
  int pointerOneY = 0;
  int pointerTwoX = 0;
  int pointerTwoY = 0;

  //Triggers
  melody1.show();
  melody1.play();

  melody2.show();
  melody2.play();

  melody3.show();
  melody3.play();  

  melody4.show();
  melody4.play();  

  drum1.show();
  drum1.play();

  bass.show();
  bass.play();

  guitar.show();
  guitar.play();

  vocal.show();
  vocal.play();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      //current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);

      float r2_1 = red(trackingColor1);
      float g2_1 = green(trackingColor1);
      float b2_1 = blue(trackingColor1);

      float r2_2 = red(trackingColor2);
      float g2_2 = green(trackingColor2);
      float b2_2 = blue(trackingColor2);

      float distOne = dist(r1, g1, b1, r2_1, g2_1, b2_1);
      float distTwo = dist(r1, g1, b1, r2_2, g2_2, b2_2);

      //Update tracker 1
      if (distOne < bestPixel1) {
        bestPixel1 = distOne;
        pointerOneX = x;
        pointerOneY = y;
        trackr1X = x;
        trackr1Y = y;
      }

      //Update tracker 2
      if (distTwo < bestPixel2) {
        bestPixel2 = distTwo;
        pointerTwoX = x;
        pointerTwoY = y;
        trackr2X = x;
        trackr2Y = y;
      }
    }
  }

  //draw tracker 1
  if (bestPixel1 < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackingColor1);
    strokeWeight(3);
    stroke(0);
    ellipse(pointerOneX, pointerOneY, 16, 16);
  }

  //draw tracker 2
  if (bestPixel2 < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackingColor2);
    strokeWeight(3);
    stroke(0);
    ellipse(pointerTwoX, pointerTwoY, 16, 16);
  }
}

void mousePressed() {
  switch(selectionStage) {
  case 0:
    int loc = mouseX + mouseY*video.width;
    trackingColor1 = video.pixels[loc];
    selectionStage += 1;
    break;
  case 1:
    int pix = mouseX + mouseY*video.width;
    trackingColor2 = video.pixels[pix];
    selectionStage += 1;
    break;
  case 2:
    break;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    selectionStage = 0;
    trackingColor1 = color(155, 19, 229);
    trackingColor2 = color(155, 19, 229);
  }
}