//Import Library
//import org.gicentre.utils.stat.*;    // For chart classes. (new chart object: XYChart lineChart;)

//Global variables
float myBitcoin = 0.0000;
String myBitcoinText = "";
float myDollar = 0.0;
String myDollarText = "";
String estimateUsdText = "";
float estimateUSD = 0;
float curBitcoinPrice = 50; //Dollars  (Temp, needs to be the latest item of array)
String curBitcoinPriceText = "";
int curScene = 0;
int gpuLevel = 0;
boolean miningOn = false;
boolean GPUminingOn = false;
boolean alertOnScreen = false;
boolean showMyCar = false;
int alertShowStartTime = 0;

//array of bitcoin price
float[] btcPrice = {50};
int curCoinIndex = 0;
float newValue = 0.0;
//Timer
Timer timer;


//GPU
//GPU myGPU = new GPU(gpuLevel);

//Fonts
PFont fontSF;
PFont fontGeorgia;

//Images
PImage bitcoinImage;
PImage gpuImage;
PImage carImage;

void setup() {
  size(950, 650);

  //Initialize objects
  initIntroSceneObjects();
  initMainSceneObjects();
  initShopSceneObjects();

  //Fonts
  fontSF = createFont("SFDisplay-Regular-48.vlw", 12, true);
  fontGeorgia = createFont("Georgia", 12, true);

  //Load images and sounds
  createAnimationImg();
  
  //Timer
  timer = new Timer(10); //10 seconds
}


void draw() {
  println(curBitcoinPrice);
  stringBTC();
  gpuMining();
  if(curScene != 0){
  generateNewPrice();
  }

  switch (curScene) {
  case 0: 
    intro_scene();
    break;
  case 1: 
    main_scene();
    break;
  case 2:
    trade_scene();
    break;
  case 3:
    shop_scene();
    break;
  }
}


void mousePressed() {
  //Intro scene buttons
  startButton.action();

  //Main scene buttons
  btcClicker();
  goToTrade.action();
  goToShop.action();
  if (curScene == 1 && goToHome.over()) {
    curScene = 0;
    GPUminingOn = false;
    myBitcoin = 0;
  }


  //Main scene tutorials
  initialInfo.dismissAlert.action();
  tutorial1.dismissAlert.action();

  //Shop scene buttons
  goShop2Home.action();
  gpu_lev1.buyItemPriceBTC.action();

  //Dismiss GPU1 purchase alert
  buyGpuConfirm.dismissAlert();
  //Confirm GPU1 purchase alert
  buyGpuConfirm.confirmAlert();
  if (curScene == 3 && buyGpuConfirm.confirmAlert.over() && myBitcoin >= gpu_lev1.priceBTC) {
    gpu_lev1.isPurchased = true;
  }

  //Buy car
  if (curScene == 3 && gallardo.buyItemPriceUSD.over()) {
    buyCarConfirm.showThisAlert = true;
  }
  //Dismiss buy car alert
  if (curScene == 3 && buyCarConfirm.cancelAlert.over()) {
    buyCarConfirm.showThisAlert = false;
  }
  //Confirm buy car alert
  if (curScene == 3 && buyCarConfirm.confirmAlert.over() && myDollar > gallardo.priceUSD) {
    buyCarConfirm.showThisAlert = false;
    gallardo.isPurchased = true;
    myDollar = myDollar - gallardo.priceUSD;
    showMyCar = true;
  }
  
}

void keyPressed() {
  switch(key) {
  case 's':
    cheatKey += key;
    break;
  case 'm':
    cheatKey += key;
    break;
  case 't':
    cheatKey += key;
    break;
  }
  if (cheatKey.equals("smtm") && keyCode == ENTER) {
    myDollar = 100000005;
  }
}



//Credits
//Home, Save icon: Icon made by Dave Gandy from www.flaticon.com, is licensed by CC 3.0 BY: https://www.flaticon.com/authors/dave-gandy
//Shop icon: Icon made by Google from www.flaticon.com, is licensed by CC 3.0 BY: https://www.flaticon.com/
//Car image: Royalty Free 3D model from TurboSquid website. Rendered in C4D