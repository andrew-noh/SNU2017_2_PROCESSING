void generateNewPrice() {

  curCoinIndex = btcPrice.length - 1;

  if (timer.isFinished()) {
    newValue = random(btcPrice[curCoinIndex]-4, btcPrice[curCoinIndex] + 20);
    btcPrice = append(btcPrice, newValue);
    timer.run();
  }
  curBitcoinPrice = btcPrice[curCoinIndex];
}