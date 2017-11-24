//coin animation

class clickerCoin {

  PImage coin = loadImage("bitcoin_small.png");
  int maxHeight;
  float x, y, initialY;
  int speed;
  boolean showCoin;

  clickerCoin() {
    x = width/2;
    y = height/2;
    initialY = 0;
    speed = -6;
    maxHeight = 150;
    showCoin = false;
    coin.resize(50, 50);
  }

  void present() {
    if (showCoin) {
      imageMode(CENTER);
      image(coin, x, y);
      y+=speed;
    }
    if (y< initialY - maxHeight) {
      showCoin = false;
    }
  }

  void showClicker() {
    showCoin = true;
    x = int(random(mouseX-150, mouseX+150));
    initialY = y = int(random(mouseY-150, mouseY+150));
  }
}