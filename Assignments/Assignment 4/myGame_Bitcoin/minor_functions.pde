//Stringify BTC balance
void stringBTC() {
  myBitcoinText = nfc(myBitcoin, 4);
  estimateUsdText = nfc(myBitcoin*curBitcoinPrice, 2);
  curBitcoinPriceText = nfc(curBitcoinPrice, 2);
  estimateUSD = myBitcoin*curBitcoinPrice;
  myDollarText = nfc(myDollar, 2);
}

//Draw dollar
void drawDollar() {
  rectMode(CORNER);
  noStroke();
  fill(8, 131, 6); //Green
  rect(25, 111, 175, 86);
  fill(42, 188, 43); //Light green
  rect(36, 121, 155, 67);
  fill(8, 131, 6); //Green
  ellipse(114, 154, 50, 50);
  stroke(8, 131, 6);
  strokeWeight(10);
  arc(38, 124, 26, 26, 0, PI/2, OPEN);
  arc(38, 186, 26, 26, 3*HALF_PI, TWO_PI, OPEN);
  arc(188, 124, 26, 26, HALF_PI, PI, OPEN);
  arc(188, 186, 26, 26, PI, 3*PI/2, OPEN);
  noStroke();
  fill(255);
  ellipse(40, 126, 13, 13);
  ellipse(40, 184, 13, 13);
  ellipse(186, 126, 13, 13);
  ellipse(186, 184, 13, 13);
  textAlign(CENTER, CENTER);
  textFont(fontSF, 40);
  text("$", 114, 151);
  rectMode(CENTER);
}

void mainDollarIcon(){
  pushMatrix();
  scale(0.3);
  translate(85, 280);
  drawDollar();
  popMatrix();
}

//Cheat Code: 'smtm + ENTER'
String cheatKey = "";