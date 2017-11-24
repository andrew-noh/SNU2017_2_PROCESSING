//Scene Index: 0


//Intro animation Images
animationImage image1;
animationImage image2;
animationImage image3;

//Buttons
Button startButton;

//Alerts


//Initialize objects
void initIntroSceneObjects() {
  startButton = new Button(width/2, height/2, 160, 50, 5, color(242, 190, 34), color(242, 222, 105), true, "Start", 30, 0, "startGame");
}

void intro_scene() {

  background(154, 229, 223); //marble

  //Draw background image
  backgroundAnimation();

  //Title
  fill(#2874CC);
  textAlign(LEFT);
  textFont(fontSF, 38);
  text("I bought a Lamborghini with bitcoin", 191, 204);
  textFont(fontSF, 24);
  text("Mining and trading simulator", 505, 265);

  //Buttons
  startButton.showButton();

  credit();
}


void createAnimationImg() {
  image1 = new animationImage(int(random(width, height)), int(random(width, height)));
  image2 = new animationImage(int(random(-1000, 1000)), int(random(-1000, 1000)));
  image3 = new animationImage(int(random(-1000, 1000)), int(random(-1000, 1000)));
}

void backgroundAnimation() {
  for (int i = 0; i < 10; i +=12) {
    image1.showImage();
    image1.animate();
    image2.showImage();
    image2.animate();
    image3.showImage();
    image3.animate();
  }
}

void credit() {
  fill(40);
  textFont(fontSF, 13);
  text("2017.11.09 v1.0", 810, 620);
}