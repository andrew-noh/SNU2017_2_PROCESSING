//Scene Index: 3

//Buttons
Button goShop2Home;


//Alerts
Alert buyGpuConfirm;
Alert buyCarConfirm;


//Items
shopItemIcon gpu_lev1;
shopItemIcon gpu_lev2;
shopItemIcon gpu_lev3;
shopItemIcon gpu_lev4;
shopItemIcon gpu_lev5;

shopItemIcon gallardo;

//Item icon(position-x, position-y, frame width, frame height, item name, item image, price in usd)

//Initialize objects
void initShopSceneObjects() {

  //Buttons
  goShop2Home = new Button(50, 50, 60, 8, color(134, 221, 178), color(120, 221, 141), false, "home.png", 3, "goToMain");

  //Items
  gpu_lev1 = new shopItemIcon(121, 1, "gpu_lev1.png", 0.02);
  gpu_lev2 = new shopItemIcon(303, 2, "gpu_lev2.png", 0.04);
  gpu_lev3 = new shopItemIcon(485, 3, "gpu_lev3.png", 0.08);
  gpu_lev4 = new shopItemIcon(667, 4, "gpu_lev4.png", 0.16);
  gpu_lev5 = new shopItemIcon(849, 5, "gpu_lev5.png", 0.32);

  gallardo = new shopItemIcon(165, "Gallardo", "gallardo_shop.png", 100000000);

  //Alerts
  buyGpuConfirm = new Alert(width/2, height/2, 625, 246, "You are going to spend "+str(gpu_lev1.priceBTC)+"BTC \n and buy a Level "+str(gpu_lev1.gpuLevel)+" GPU", 24, 3, "cancelPurchaceGPU1", "confirmPurchaseGPU1");
  buyCarConfirm = new Alert(width/2, height/2, 625, 246, "You are going to spend $100M and buy Gallardo.", 24, 3, "cancelPurchaceCar", "confirmPurchaseCar");

}

void shop_scene() {
  background(#507EB5);

  //Display current balance
  fill(0);
  textFont(fontSF, 32);
  text("Balance: "+myBitcoinText+" BTC  | $"+myDollarText, 650, 45);
  textFont(fontSF, 25);
  text("My Level: "+str(gpuLevel), 160, 35);


  //Display buttons
  goShop2Home.showIconButton();

  //Display items
  gpu_lev1.showGpuItem();
  gpu_lev2.showGpuItem();
  gpu_lev3.showGpuItem();
  gpu_lev4.showGpuItem();
  gpu_lev5.showGpuItem();

  gallardo.showCarItem();

  //Alert
  buyGpuConfirm.showConfirmAlert();
  buyCarConfirm.showConfirmAlert();
}