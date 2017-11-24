//GPU Item (frame Y-location, _gpuLevel, _itemImage, _priceBTC, _priceUSD)
//Buy gpu button action identifier: "confirmGPU1USD" (1 is GPU level)

class shopItemIcon {
  boolean isPurchased;
  float priceUSD;
  float priceBTC;
  PImage itemImage;
  String itemName;
  Button buyItemPriceUSD;
  Button buyItemPriceBTC;
  int frameX, frameY, frameWidth, frameHeight;
  Alert buyItemAlert;
  int gpuLevel;

  //GPU(with usd and btc)
  shopItemIcon(int _frameX, int _gpuLevel, String _itemImage, float _priceBTC) {
    isPurchased = false;
    gpuLevel = _gpuLevel;
    frameX = _frameX;
    frameY = 203;
    frameWidth = 160;
    frameHeight = 170;
    itemName = "Level " + str(_gpuLevel);
    itemImage = loadImage(_itemImage);
    priceBTC = _priceBTC;
    buyItemPriceBTC = new Button(frameX, frameY+80, int(frameWidth*0.7), 25, 5, color(134, 221, 178), color(120, 221, 141), true, nfc(priceBTC, 3)+" BTC", 14, 3, "confirmGPU"+str(gpuLevel)+"BTC");
  }

  //Car(only with usd)
  shopItemIcon(int _frameX, String _carName, String _itemImage, float _priceUSD) {
    isPurchased = false;
    frameX = _frameX;
    frameY = 485;
    frameWidth = 282;
    frameHeight = 265;
    itemName = _carName;
    itemImage = loadImage(_itemImage);
    priceUSD = _priceUSD;
    buyItemPriceUSD = new Button(frameX, frameY+100, int(frameWidth*0.7), 34, 5, color(134, 221, 178), color(120, 221, 141), true, "$" + nfc(priceUSD, 2), 15, 3, "confirmPurchaseCarUSD");
  }

  //Methods
  //Show item

  void showGpuItem() {

    stroke(#851934);
    strokeWeight(2);
    fill(#F6A623); //Item background default
    rectMode(CENTER);
    rect(frameX, frameY, frameWidth, frameHeight, 10);
    textAlign(CENTER, CENTER);
    textFont(fontGeorgia, 25);
    fill(0);
    text(itemName, frameX, frameY-frameHeight/2+20);
    imageMode(CENTER);
    itemImage.resize(frameWidth-70, frameWidth-70);
    image(itemImage, frameX, frameY-10);
    if (isPurchased == false) {
      buyItemPriceBTC.showButton();
    } else {
      fill(#D8D8D8);
      stroke(0);
      strokeWeight(1);
      rect(frameX, frameY+63, int(frameWidth*0.7), 25, 5);
      fill(0);
      textAlign(CENTER);
      textFont(fontGeorgia, 20);
      text("Complete", frameX, frameY+70);
    }
  }


  void showCarItem() {
    stroke(#851934);
    strokeWeight(2);
    fill(#F6A623); //Item background default
    rectMode(CENTER);
    rect(frameX, frameY, frameWidth, frameHeight, 10);
    textAlign(CENTER, CENTER);
    textFont(fontGeorgia, 25);
    fill(0);
    text(itemName, frameX, frameY-frameHeight/2+17);
    imageMode(CENTER);
    itemImage.resize(frameWidth, frameWidth);
    image(itemImage, frameX, frameY-10);
    if (isPurchased == false) {
      buyItemPriceUSD.showButton();
    } else {
      fill(#D8D8D8);
      stroke(0);
      strokeWeight(1);
      rect(frameX, frameY+63, int(frameWidth*0.7), 25, 5);
      fill(0);
      textMode(CENTER);
      text("Complete", frameX, frameY+63);
    }
  }


  //Purchase item

  void purchaseGpu() {
    if (myBitcoin >= this.priceBTC) {
      this.isPurchased = true;
      myBitcoin = myBitcoin - this.priceBTC;
    }
  }
  //this.isPurchased = true

  //void purchaseCar(){}
}