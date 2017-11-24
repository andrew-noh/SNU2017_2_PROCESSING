//Intro moving coins animation

class animationImage {
  int pointX;
  int pointY;
  PImage bitcoinImage;

  animationImage(int _x, int _y) {
    bitcoinImage = loadImage("bitcoin_small.png");
    pointX = _x;
    pointY = _y;
  }

  void showImage() {
    image(bitcoinImage, pointX, pointY);
  }

  void animate() {
    pointX += 2;
    pointY -= 2;
    if (pointX  > width) {
      pointX = 0;
    }
    if (pointY < 0) {
      pointY = height-50;
    }
  }
}