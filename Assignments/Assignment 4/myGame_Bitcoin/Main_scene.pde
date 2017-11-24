//Scene Index: 1


//Buttons
Button goToShop;
Button goToHome;
Button saveGame;
Button goToTrade;

//Alerts
Alert initialInfo;
Alert tutorial1; //First tutorial: buy gpu

//Clicker animation
clickerCoin coin1;
clickerCoin coin2;

//Image
PImage background;

//Initialize objects
void initMainSceneObjects() {
  bitcoinImage = loadImage("bitcoin_small.png");
  gpuImage = loadImage("gpu_icon.png");

  //Configure buttons
  goToShop = new Button(890, 590, 75, 10, color(134, 221, 178), color(120, 221, 141), false, "shop.png", 1, "goToShop");
  goToHome = new Button(50, 600, 60, 8, color(134, 221, 178), color(120, 221, 141), false, "home.png", 1, "goToHome");
  saveGame = new Button(902, 50, 50, 8, color(134, 221, 178), color(120, 221, 141), false, "save.png", 1, "saveGame");
  goToTrade = new Button(483, 351, 227, 52, 8, color(134, 221, 178), color(120, 221, 141), false, "Trade BTC", 20, 1, "goToTrade");

  //Configure alert
  initialInfo = new Alert(width/2, height/2, 500, 200, "Hello. Welcome to the bitcoin Simulator. \n Click mouse to mine some bitcoins.", 24, 1, "dismissInitialInfoAlert");
  tutorial1 = new Alert(width/2, height/2, 500, 200, "Congratulations! Now you have more than 0.02 bitcoins. \n Click shop icon and buy a GPU, \n and you will get bitcoins automatically!", 17, 1, "dismissTutorial1Alert");

  //Clicker coins
  coin1 = new clickerCoin();
  coin2 = new clickerCoin();

  //Image
  background = loadImage("background_image.jpg");
  carImage = loadImage("gallardo_shop.png");
}


void main_scene() {
  background(248, 197, 140); //orange
  imageMode(CENTER);
  image(background, width/2, height/2);

  //My wallet

  //Wallet BG
  rectMode(CENTER);
  fill(#7ED321);
  noStroke();
  rect(145, 106, 258, 156, 10);
  if(showMyCar){
   image(carImage, 215, 500); 
  }

  //Bitcoin balance
  bitcoinImage.resize(35, 35);
  imageMode(CORNER);
  image(bitcoinImage, 28, 44);
  textAlign(CENTER, CENTER);
  textFont(fontSF, 25);
  fill(255);
  text(myBitcoinText + " BTC", 160, 60);
  textFont(fontSF, 19);
  textAlign(RIGHT);
  text("Estimate USD: $" + estimateUsdText, 210, 100);
  //Dollar balance
  mainDollarIcon();
  textAlign(LEFT);
  textFont(fontSF, 25);
  text("$"+myDollarText, 112, 136);

  //Chart area
  fill(100);
  rectMode(CENTER);
  noStroke();
  rect(480, 140, 390, 230);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Chart Area", 480, 140);

  //Current price display
  fill(255);
  textFont(fontSF, 24);
  text("Bitcoin price: $"+curBitcoinPriceText, 471, 200);

  //GPU icon
  gpuImage.resize(95, 64);
  imageMode(CORNER);
  image(gpuImage, 686, 29);
  imageMode(CENTER);
  fill(255);
  textFont(fontSF, 23);
  text("Lev. "+str(gpuLevel), 810, 57);

  //Draw Buttons
  goToShop.showIconButton();
  saveGame.showIconButton();
  goToHome.showIconButton();
  goToTrade.showButton();

  //Clicker
  coin1.present();
  coin2.present();


  //Alerts
  //Initial alert (first alert)
  initialInfo.showInfoAlert();

  //Tutorial 1 (when estimate USD is more than $1)
  if (int(estimateUSD) >= 1 && tutorial1.shownOnce == false) {
    tutorial1.showInfoAlert();
  }
}