//Assignment 3
//Button
//2011-10053
//Noh Ha Kyung
//Title: "King of Negotiation"
//Date submitted: 10.18.2017
//*Please install minim library before running the sketch


//Variables=============

//Scene control
int curScene = constrain(0, 0, 1);
int curPhoto = 0;
int clickedTime = 0;
boolean startPlay = false; 
//Flicker timing
int lightDelay1 = 300;
int lightDelay2 = 500;
int lightDelay3 = 700;
int startPlayDelay = 1300;
//Start button
int startButtonX = 270;
int startButtonY = 270;
int startButtonW = 160;
int startButtonH = 52;
//Buttons
//Up button
int upButtonX = 580;
int upButtonY = 193;
int arrowButtonSize = 40;
//Down button
int downButtonX = 580;
int downButtonY = 298;
//Reset button
int resetButtonX = 543;
int resetButtonY = 252;
int resetButtonW = 117;
int resetButtonH = 30;
//Dollar button
int dollarButtonX = 25;
int dollarButtonY = 111;
int dollarButtonW = 175;
int dollarButtonH = 86;
//Extra button
int xButtonX = 16;
int xButtonY = 448;
int xButtonSize = 24;
//click text
String plusString = "+$0.5";
String minusString = "-$0.5";
String convertPlacedBid = "";
//Images
PImage JDH_1;
PImage JDH_2;
PImage JDH_3;
PImage JDH_4;
PImage JDH_5;
//Numbers
float curBid = 0.0;
float increaseBy = 0.5;
float placedBid = 0.0;
String curBidString = "";
String curBidPrint = "";
int countRandom = 0;
//String
String bidText = "Bid ";
String bidTextPrint = "";
//Plus Minus Text
boolean showPlusPoint = false;
boolean showMinusPoint = false;
int plusPointX = 580;
int plusPointY = 180;
int minusPointX = 580;
int minusPointY = 363;
int animSpeed = 0;
//Dollar corners data
int[] dollarDecoTranslatesX = {-60, 90, 600, 420};
int[] dollarDecoTranslatesY = {20, 220, -80, 350};
int[] dollarDecoRotate = {-30, 30, 40, -40};
//Success message
boolean printSuccessMessage = false;


//Audio
import ddf.minim.*;
Minim minim;
AudioPlayer clickSound;
AudioPlayer resetSound;
AudioPlayer hoverSound;
AudioPlayer fourDollarsFast1;
AudioPlayer fourDollarsFast2;
//Speech
AudioPlayer fourDollars_0;
AudioPlayer case1_audio;
AudioPlayer case2_audio;
AudioPlayer case3_audio;
AudioPlayer case4_audio;
AudioPlayer case5_audio;
AudioPlayer case6_audio;
AudioPlayer case7_audio;
AudioPlayer case8_audio;
AudioPlayer case9_audio;

//Fonts
PFont myFont1;
PFont myFont2;


//Setup=============
void setup() {
  size(700, 500);
  //background(249, 173, 129);

  //Fonts
  myFont1 = createFont("Arial", 11, true);
  myFont2 = createFont("Georgia", 11, true);

  //Images
  JDH_1 = loadImage("img1.png");
  JDH_2 = loadImage("img2.png");  
  JDH_3 = loadImage("img3.png");  
  JDH_4 = loadImage("img4.png");  
  JDH_5 = loadImage("img5.png");

  //Audio
  minim = new Minim(this);
  clickSound = minim.loadFile("click.mp3");
  resetSound = minim.loadFile("reset.mp3");
  hoverSound = minim.loadFile("hover.mp3");
  fourDollarsFast1 = minim.loadFile("high_pitch_4.mp3"); //extra
  fourDollars_0 = minim.loadFile("fourDollars_0.mp3"); //intro
  case1_audio = minim.loadFile("refuse_1.mp3"); //$1 
  case2_audio = minim.loadFile("case2.mp3"); //$1.5
  case3_audio = minim.loadFile("case3.mp3"); //$2.0
  case4_audio = minim.loadFile("case4.mp3"); //$2.5
  case5_audio = minim.loadFile("case5.mp3"); //$3.0
  case6_audio = minim.loadFile("fourDollars_5.mp3"); //$3.5
  case7_audio = minim.loadFile("case6.mp3"); //$4.0
  case8_audio = minim.loadFile("movieLine.mp3"); //$4.5
  case9_audio = minim.loadFile("dramaLine.mp3"); //$5.0
}

//Draw=============
void draw() {
  switch (curScene) {
  case 0: 
    scene_0();
    break;
  case 1: 
    scene_1();
    break;
  case 2:
    scene_2();
    break;
  }
}


//Functions=============

//Scenes
//Scene 0 - Start page
void scene_0() {
  background(140, 190, 178); //marble green
  stroke(0);
  strokeWeight(2);
  fill(240, 96, 96); //Button color
  changeStartColor();
  rect(startButtonX, startButtonY, startButtonW, startButtonH, 5);
  fill(0);
  textFont(myFont2, 45);
  text("협상의 달인", 228, 205);
  fill(255);
  textFont(myFont1, 30);
  text("START", 303, 306);
  fill(0);
  textFont(myFont1, 13);
  text("v1.0", 620, 472);

  //Dollars corners
  drawDollarsCorners();

  //How to use
  //Up button
  pushMatrix();
  scale(0.6);
  translate(-130, 474);
  stroke(30);
  strokeWeight(2);
  fill(255);
  rect(upButtonX, upButtonY, arrowButtonSize, arrowButtonSize, 5);
  fill(255, 234, 0); //Yellow
  triangle(601, 200, 587, 224, 615, 224);
  popMatrix();
  //Down button
  pushMatrix();
  scale(0.6);
  translate(-60, 370);
  fill(255);
  rect(downButtonX, downButtonY, arrowButtonSize, arrowButtonSize, 5);
  fill(255, 234, 0); //Yellow
  triangle(587, 308, 601, 331, 615, 308);
  popMatrix();
  //Text 1
  fill(255);
  ;
  textFont(myFont2, 14);
  text("버튼을 클릭하여", 355, 400);
  text("협상 금액을 조절하세요", 355, 420);
  fill(0);
  //Dollar button
  pushMatrix();
  translate(263, 420);
  scale(0.3);
  drawDollarWsign();
  popMatrix();
  fill(255);
  textFont(myFont2, 14);
  text("달러를 클릭하여", 355, 460);
  text("협상을 시도하세요", 355, 480);
}

//Scene 1 - main page
void scene_1() {
  background(215, 218, 219);

  //floor
  noStroke();
  fill(153, 134, 117);
  beginShape();
  vertex(135, 328);
  vertex(700, 329);
  vertex(700, 500);
  vertex(0, 500);
  vertex(0, 492);
  endShape(CLOSE);
  stroke(180);
  strokeWeight(1);
  line(135, 328, 135, 0);
  noStroke();
  fill(249, 241, 229); //Light grey
  quad(66, 478, 152, 368, 568, 368, 635, 478);

  //Lights
  lightsOn();
  lightsOn2();
  startPlayActions();

  //Chair far
  strokeWeight(2);
  stroke(0);
  fill(160, 65, 13); //Dark brown
  rect(317, 215, 7, 72);
  rect(323, 214, 95, 25);  
  rect(418, 214, 7, 72);
  rect(277, 335, 11, 72);
  rect(374, 335, 11, 72);
  rect(314, 335, 7, 34);
  rect(414, 296, 11, 72);
  fill(249, 173, 129); //Skin color
  rect(277, 325, 109, 9);
  quad(386, 334, 386, 325, 425, 287, 425, 296);
  fill(242, 101, 34); //Orange
  quad(316, 287, 424, 287, 385, 324, 280, 324);

  //Table
  stroke(0);
  strokeWeight(2);
  //legs1
  fill(217, 151, 70); //Light brown
  rect(97, 317, 24, 156);
  rect(505, 317, 24, 156);
  rect(159, 318, 17, 103);
  rect(449, 318, 17, 103);
  //legs2
  fill(113, 43, 16); //Dark brown
  quad(121, 317, 139, 317, 139, 465, 121, 473);
  quad(487, 317, 505, 317, 505, 473, 487, 465);
  quad(178, 318, 188, 318, 188, 415, 178, 421);
  quad(436, 318, 449, 318, 449, 421, 435, 415);
  //table top
  fill(187, 91, 48);
  quad(73, 317, 67, 298, 555, 297, 549, 317);
  fill(194, 129, 0);
  quad(67, 298, 166, 263, 472, 263, 555, 297);

  //Chair near
  fill(242, 101, 34); //Orange
  quad(170, 500, 204, 452, 382, 452, 373, 500);
  fill(160, 65, 13); //Dark brown
  rect(169, 358, 14, 143);
  rect(368, 358, 14, 143);
  rect(183, 358, 185, 50);

  //Buttons

  //Up button
  stroke(30);
  strokeWeight(2);
  fill(255);
  rect(upButtonX, upButtonY, arrowButtonSize, arrowButtonSize, 5);
  fill(255, 234, 0); //Yellow
  triangle(601, 200, 587, 224, 615, 224);
  //Down button
  fill(255);
  rect(downButtonX, downButtonY, arrowButtonSize, arrowButtonSize, 5);
  fill(255, 234, 0); //Yellow
  triangle(587, 308, 601, 331, 615, 308);

  //Reset button
  fill(179, 151, 147); //Ivory
  rect(resetButtonX, resetButtonY, resetButtonW, resetButtonH, 5);
  fill(255);
  textFont(myFont1, 20);
  text("RESET", 570, 274);

  //Extra button
  fill(255, 0, 0);
  textFont(myFont1, 11);
  text("↑DO NOT PRESS!", 13, 495);

  //Home button
  noStroke();
  fill(255);
  rect(622, 13, 50, 50, 5);
  fill(0);
  rect(631, 37, 32, 20);
  triangle(647, 17, 670, 38, 624, 38);
  fill(255);
  rect(643, 44, 9, 13);
  stroke(0);

  //Show photo
  showPhoto();

  //Draw Dollar button
  drawDollarDynamic();

  //Dollar button mouse over
  if (curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    dollarMouseOver();
  }
  //Mouse over text
  bidTextPrint = bidText + curBidPrint;

  //Dollar mouse press
  dollarMousePress();

  //Bid 2 String
  prepairBid();
  bidBoundary();

  //Points animation
  plusAnimation();
  stopPlusAnim();
  minusAnimation();
  stopMinusAnim();

  //Success
  printSuccessMessage();

  //Bid actions
  convertPlacedBid = str(placedBid);
  switch(convertPlacedBid) {
  case "0.5":
    curPhoto = 1;
    break;
  case "1.0": 
    curPhoto = 1;
    break;
  case "1.5":
    curPhoto = 1;
    break;
  case "2.0":
    curPhoto = 2;
    break;
  case "2.5":
    curPhoto = 1;
    break;
  case "3.0":
    curPhoto = 3;
    break;
  case "3.5":
    curPhoto = 3;
    break;
  case "4.0":
    curPhoto = 5;
    break;
  case "4.5":
    curPhoto = 4;
    break;
  case "5.0":
    curPhoto = 4;
    break;
  }

  //Extra button mouse over
  if (mousePressed == true && curScene==1 && mouseX > 16 && mouseX < 40 && mouseY > 448 && mouseY < 472) {
    xButtonOn();
  } else {
    xButtonOff();
  }
}

//Scene 2 - bonus scene
void scene_2() {
  //Home button
  noStroke();
  fill(255);
  rect(622, 13, 50, 50, 5);
  fill(0);
  rect(631, 37, 32, 20);
  triangle(647, 17, 670, 38, 624, 38);
  fill(255);
  rect(643, 44, 9, 13);
  stroke(0);
  //Surprise page
  if (frameCount % 2 == 0 && countRandom < 300) {
    countRandom += 1;
    pushMatrix();
    rotate(radians(random(0, 300)));
    translate(random(-40, 600), random(-50, 200));
    scale(random(0.3, 2.0));
    drawDollarWfour();
    popMatrix();
  }
}

//Mouse over start button
void changeStartColor() {
  if (curScene==0 && mouseX > 270 && mouseX < 430 && mouseY > 270 && mouseY < 322) {
    fill(62, 177, 192);
    hoverSound.rewind();
    hoverSound.play();
  }
}

//Light On Effect
//Lights
void showLight() {
  noStroke();
  fill(255, 242, 0, 80); //Yellow
  quad(74, 226, 242, 0, 486, 0, 612, 234);
  stroke(255);
}
//Turn light with Effect
void lightsOn() {
  if (millis()-clickedTime > lightDelay1 && millis()-clickedTime < lightDelay2) {
    showLight();
  }
}
void lightsOn2() {
  if (millis()-clickedTime > lightDelay3) {
    showLight();
  }
}

//Play initial AV and start play
void startPlayActions() {
  if (millis()-clickedTime > startPlayDelay) {
    //curPhoto = 1;
    startPlay = true;
  }
}

//Show photo
void showPhoto() {
  switch(curPhoto) {
  case 1: 
    image(JDH_1, 286, 122);
    break;
  case 2: 
    image(JDH_2, 286, 122);
    break;
  case 3: 
    image(JDH_3, 286, 122);
    break;
  case 4: 
    image(JDH_4, 286, 122);
    break;
  case 5: 
    image(JDH_5, 286, 122);
    break;
  }
}

//Draw Dollar(base)
void drawDollarBase() {
  noStroke();
  fill(8, 131, 6); //Green
  rect(dollarButtonX, dollarButtonY, dollarButtonW, dollarButtonH);
  fill(42, 188, 43); //Light green
  rect(36, 121, 155, 67);
  fill(8, 131, 6); //Green
  ellipse(114, 154, 50, 50);
  stroke(8, 131, 6);
  strokeWeight(10);
  arc(38, 124, 26, 26, 0, PI/2, OPEN);
  arc(38, 186, 26, 26, 3*HALF_PI, TWO_PI, OPEN);
  arc(188, 124, 26, 26, HALF_PI, PI, OPEN);
  arc(188, 186, 26, 26, PI, 3*PI/2, OPEN);
  noStroke();
  fill(255);
  ellipse(40, 126, 13, 13);
  ellipse(40, 184, 13, 13);
  ellipse(186, 126, 13, 13);
  ellipse(186, 184, 13, 13);
  textFont(myFont2, 40);
}

//Dynamic dollar button
void drawDollarDynamic() {
  drawDollarBase();
  text(curBidPrint, 76, 166);
}

//Dollar button with only dollar sign
void drawDollarWsign() {
  drawDollarBase();
  text("$", 102, 166);
}

//Dollar button with $4
void drawDollarWfour() {
  drawDollarBase();
  text("$4", 98, 166);
}

//Start screen dollar corners
void drawDollarsCorners() {
  for (int i = 0; i < 4; i += 1) {
    pushMatrix();
    translate(dollarDecoTranslatesX[i], dollarDecoTranslatesY[i]);
    rotate(radians(dollarDecoRotate[i]));
    drawDollarWsign();
    popMatrix();
  }
}

//Dollar button mouse over
void dollarMouseOver() {
  noStroke();
  fill(247, 144, 30); //Orange
  rect(dollarButtonX, dollarButtonY, dollarButtonW, dollarButtonH);
  fill(255, 193, 30); //Light orange
  rect(36, 121, 155, 67); 
  fill(255);
  textFont(myFont2, 35);
  text(bidTextPrint, 50, 166);
}

//Dollar button mouse Pressed
void dollarMousePress() {
  if (mousePressed == true && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    noStroke();
    fill(0, 86, 119); //dark blue
    rect(dollarButtonX, dollarButtonY, dollarButtonW, dollarButtonH);
    fill(8, 134, 178); //Blue
    rect(36, 121, 155, 67); 
    fill(255);
    textFont(myFont2, 35);
    text(bidTextPrint, 50, 166);
  }
}

//Remove decimal points if int
void prepairBid() {
  if (curBid % 1 == 0) {
    curBidString = String.format("%.0f", curBid);
    curBidPrint = "$" + curBidString;
  } else {
    curBidString = String.format("%.1f", curBid);
    curBidPrint = "$" + curBidString;
  }
}

//Restrict bid
void bidBoundary() {
  if (curBid > 5) {
    curBid = 5;
  }
  if (curBid < 1) {
    curBid = 1;
  }
}

//Plus text animation
void plusAnimation() {
  if (showPlusPoint) {
    textFont(myFont1, 20);
    fill(170);
    text(plusString, plusPointX, plusPointY); 
    plusPointY -= animSpeed;
  }
}

//Stop plus animation
void stopPlusAnim() {
  if (plusPointY < 150) {
    plusPointY = 180;
    animSpeed = 0;
    showPlusPoint = false;
  }
}

//Minus text animation
void minusAnimation() {
  if (showMinusPoint) {
    textFont(myFont1, 20);
    fill(170);
    text(minusString, minusPointX, minusPointY); 
    minusPointY += animSpeed;
  }
}

//Stop minus animation
void stopMinusAnim() {
  if (minusPointY > 393) {
    minusPointY = 363;
    animSpeed = 0;
    showMinusPoint = false;
  }
}

//Print success
void printSuccessMessage() {
  if (printSuccessMessage == true) {
    fill(255, 0, 0);
    textFont(myFont1, 45);
    text("Success!", 300, 100);
  }
}


//Extra button
//extra button State off
void xButtonOff() {
  fill(249, 173, 129); //Skin color
  stroke(0);
  strokeWeight(1);
  rect(xButtonX+3, xButtonY+3, xButtonSize, xButtonSize, 5);
  fill(255, 0, 0); //Red
  rect(xButtonX, xButtonY, xButtonSize, xButtonSize, 5);
}

//extra button State pressed
void xButtonOn() {
  fill(255, 0, 0); //Red
  stroke(0);
  strokeWeight(1);
  rect(xButtonX+3, xButtonY+3, xButtonSize, xButtonSize, 5);
}

//Mouse Pressed
void mousePressed() {
  //Start Button Clicked
  if (curScene==0 && mouseX > 270 && mouseX < 430 && mouseY > 270 && mouseY < 322) {
    curScene = 1;
    clickedTime = millis();
    fourDollars_0.play();
  }

  //Increase Button
  if (curScene==1 && startPlay==true && mouseX > 580 && mouseX < 620 && mouseY > 193 && mouseY < 233) {
    curBid = curBid + increaseBy;
    showPlusPoint = true;
    animSpeed = 3;
    clickSound.rewind();
    clickSound.play();
  }

  //Decrease Button
  if (curScene==1 && startPlay==true && mouseX > 580 && mouseX < 620 && mouseY > 298 && mouseY < 338) {
    curBid = curBid - increaseBy;
    showMinusPoint = true;
    animSpeed = 3;
    clickSound.rewind();
    clickSound.play();
  }

  //Reset button
  if (curScene==1 && mouseX > 543 && mouseX < 660 && mouseY > 252 && mouseY < 282) {
    curBid = 1;
    resetSound.rewind();
    resetSound.play();
    printSuccessMessage = false;
  }

  //Go to menu
  if (curScene==1 && mouseX > 622 && mouseX < 672 && mouseY > 13 && mouseY < 63) {
    curScene = 0;
  }
  if (curScene==2 && mouseX > 622 && mouseX < 672 && mouseY > 13 && mouseY < 63) {
    curScene = 0;
  }

  //Make bid button
  if (curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    placedBid = curBid;
  }

  //Offer actions (9 scenarios)
  //Case 1.0
  if (placedBid == 1.0 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case1_audio.rewind();
    case1_audio.play();
    printSuccessMessage = false;
  }

  //Case 1.5
  if (placedBid == 1.5 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case2_audio.rewind();
    case2_audio.play();
    printSuccessMessage = false;
  }
  //Case 2.0
  if (placedBid == 2.0 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case3_audio.rewind();
    case3_audio.play();
    printSuccessMessage = false;
  }
  //Case 2.5
  if (placedBid == 2.5 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case4_audio.rewind();
    case4_audio.play();
    printSuccessMessage = false;
  }
  //Case 3.0
  if (placedBid == 3.0 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case5_audio.rewind();
    case5_audio.play();
    printSuccessMessage = false;
  }
  //Case 3.5
  if (placedBid == 3.5 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case6_audio.rewind();
    case6_audio.play();
    printSuccessMessage = false;
  }
  //Case 4.0
  if (placedBid == 4.0 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case7_audio.rewind();
    case7_audio.play();
    clickedTime = millis();
    printSuccessMessage = true;
  }
  //Case 4.5
  if (placedBid == 4.5 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case8_audio.rewind();
    case8_audio.play();
    printSuccessMessage = false;
  }
  //Case 5.0
  if (placedBid == 5.0 && curScene==1 && mouseX > 25 && mouseX < 200 && mouseY > 111 && mouseY < 197) {
    case9_audio.rewind();
    case9_audio.play();
    printSuccessMessage = false;
  }
}

//Mouse Released - activate bonus scene
void mouseReleased() {
  if (curScene==1 && curScene==1 && mouseX > 16 && mouseX < 40 && mouseY > 448 && mouseY < 472) {
    curScene = 2;
    fourDollarsFast1.rewind();
    fourDollarsFast1.play();
  }
}

//Keyboard pressed
//up,right=increase button, down,left=decrease button, enter(return, spacebar), home(back)
void keyPressed() {
  //Start
  if (curScene == 0 && keyPressed) {
    curScene = 1;
    clickedTime = millis();
    fourDollars_0.play();
  } else if (curScene==1 && keyCode == UP || keyCode == RIGHT) { //Increase button
    curBid = curBid + increaseBy;
    showPlusPoint = true;
    animSpeed = 3;
    clickSound.rewind();
    clickSound.play();
  } else if (curScene==1 && keyCode == DOWN || keyCode == LEFT) { //Decrease button
    curBid = curBid - increaseBy;
    showMinusPoint = true;
    animSpeed = 3;
    clickSound.rewind();
    clickSound.play();
  } else if (curScene==1 && placedBid == 1.0 && keyCode == ENTER || keyCode == RETURN) { //Place bid
    case1_audio.rewind();
    case1_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 1.5 && keyCode == ENTER || keyCode == RETURN) {
    case2_audio.rewind();
    case2_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 2.0 && keyCode == ENTER || keyCode == RETURN) {
    case3_audio.rewind();
    case3_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 2.5 && keyCode == ENTER || keyCode == RETURN) {
    case4_audio.rewind();
    case4_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 3.0 && keyCode == ENTER || keyCode == RETURN) {
    case5_audio.rewind();
    case5_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 3.5 && keyCode == ENTER || keyCode == RETURN) {
    case6_audio.rewind();
    case6_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 4.0 && keyCode == ENTER || keyCode == RETURN) {
    case7_audio.rewind();
    case7_audio.play();
    clickedTime = millis();
    printSuccessMessage = true;
  } else if (curScene==1 && placedBid == 4.5 && keyCode == ENTER || keyCode == RETURN) {
    case8_audio.rewind();
    case8_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && placedBid == 5.0 && keyCode == ENTER || keyCode == RETURN) {
    case9_audio.rewind();
    case9_audio.play();
    printSuccessMessage = false;
  } else if (curScene==1 && keyCode == BACKSPACE) { //Reset button
    curBid = 1;
    resetSound.rewind();
    resetSound.play();
    printSuccessMessage = false;
  }
}