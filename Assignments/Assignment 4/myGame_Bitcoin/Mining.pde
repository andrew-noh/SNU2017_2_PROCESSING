void btcClicker() {
  if (curScene == 1 && miningOn == true && alertOnScreen == false) {
    //1 Click = 0.001 btc
    myBitcoin += 0.001;

    //coin animation
    coin1.showClicker();
    coin2.showClicker();
  }
}

void gpuMining() {
  if (curScene != 0 && GPUminingOn == true) {
    myBitcoin += 0.0001;
  }
}