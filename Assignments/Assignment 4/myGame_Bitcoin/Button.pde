//Button with text(position-x, position-y, width, height, roundness, color, overColor, withborders_bool, textlabel, textSize, sceneNumber to be shown in, action identifier)
//Button with image(position-x, position-y, size, roundness, color, overColor, withBorders_bool, image name, sceneIndex, actionIdentifier)
//rectMode = CENTER

class Button {

  int x, y, w, h;
  String name;
  color buttonColor;
  color overColor;
  int roundness;
  boolean withBorders;
  PFont buttonFont;
  int sceneIndex;
  String buttonAction;
  int textSize;
  PImage buttonImage;

  //Button with text
  Button(int _x, int _y, int _w, int _h, int _roundness, color _buttonColor, color _overColor, boolean _withBorders, String _name, int _textSize, int _sceneIndex, String _actionIdentifier) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    sceneIndex = _sceneIndex;
    roundness = _roundness;
    buttonColor = _buttonColor;
    overColor = _overColor;
    withBorders = _withBorders;
    name = _name;
    buttonAction = _actionIdentifier;
    textSize = _textSize;
    buttonFont = createFont("SFDisplay-Regular-48.vlw", textSize, true);
  }

  //Button with image
  Button(int _x, int _y, int _size, int _roundness, color _buttonColor, color _overColor, boolean _withBorders, String _imgName, int _sceneIndex, String _actionIdentifier) {
    x = _x;
    y = _y;
    w = _size;
    h = _size;
    sceneIndex = _sceneIndex;
    roundness = _roundness;
    buttonColor = _buttonColor;
    overColor = _overColor;
    withBorders = _withBorders;
    buttonImage = loadImage(_imgName);
    buttonAction = _actionIdentifier;
  }

  //Methods
  //Button with text
  void showButton() {
    if (sceneIndex == curScene) {
      textFont(buttonFont, textSize);
      if (over()) fill(overColor);
      else fill(buttonColor);
      if (withBorders) {
        stroke(0);
        strokeWeight(2);
      } else noStroke();
      rectMode(CENTER);
      rect(x, y, w, h, roundness);
      textAlign(CENTER, CENTER);
      fill(255);
      text(name, x, y-3);
    }
  }

  //Button with image
  void showIconButton() {
    if (sceneIndex == curScene) {
      if (over()) fill(overColor);
      else fill(buttonColor);
      if (withBorders) {
        stroke(0);
        strokeWeight(1);
      } else noStroke();
      rectMode(CENTER);
      rect(x, y, w, h, roundness);
      imageMode(CENTER);
      buttonImage.resize(w-20, h-20);
      image(buttonImage, x, y);
    }
  }

  //Button Action Method
  //To create new action: Create a new Button object with new action identifier -> add switch case to match identifier -> create void function
  //Include action in main program mousePressed()
  void action() {
    switch(buttonAction) {
    case "startGame":
      StartGameAction();
      break;
    case "goToShop":
      GoToShop();
      break;
    case "goToHome":
      GoToHome();
      break;
    case "goToMain":
      GoToMain();
      break;
    case "dismissInitialInfoAlert":
      dismissInitialInfoAlert();
      break;
    case "goToTrade":
      GoToTrade();
      break;
    case "dismissTutorial1Alert":
      dismissTutorial1Alert();
      break;
    case "confirmGPU1BTC":
      showPurchaseGPU1Confirmation();
      break;
    case "confirmPurchaseGPU1":
      gpuLevel = 1;
      GPUminingOn = true;
      myBitcoin = myBitcoin - gpu_lev1.priceBTC;
      break;
    }
  }

  //Check if mouse is over the button
  boolean over() {
    if (sceneIndex == curScene && mouseX > x-w/2 && mouseY > y-h/2 && mouseX < x+w/2 && mouseY < y+h/2) {
      return true;
    } else return false;
  }


  //Button Actions Library

  //Start Game
  //Scene 0
  void StartGameAction() {
    if (sceneIndex == curScene && over()) {
      curScene = 1;
    }
  }

  //Scene 1
  //Go to Shop
  void GoToShop() {
    if (sceneIndex == curScene && over()) {
      curScene = 3;
    }
  }

  //Go to Home
  void GoToHome() {
    if (sceneIndex == curScene && over()) {
      curScene = 0;
    }
  }

  void GoToMain() {
    if (sceneIndex == curScene && over()) {
      curScene = 1;
    }
  }

  void GoToTrade() {
    if (sceneIndex == curScene && over() && miningOn == true && alertOnScreen == false) {
      curScene = 2;
    }
  }

  //Main Scene
  void dismissInitialInfoAlert() {
    if (sceneIndex == curScene && over()) {
      initialInfo.shownOnce = true;
      initialInfo.showThisAlert = false;
      miningOn = true;
      alertOnScreen = false;
    }
  }

  void dismissTutorial1Alert() {
    if (sceneIndex == curScene && over() && int(estimateUSD) >= 1) {
      tutorial1.shownOnce = true;
      tutorial1.showThisAlert = false;
      alertOnScreen = false;
      curScene = 3;
    }
  }

  //Shop Scene
  void showPurchaseGPU1Confirmation() {
    if (sceneIndex == curScene && over()) {
      buyGpuConfirm.showThisAlert = true;
      alertOnScreen = true;
    }
  }
}