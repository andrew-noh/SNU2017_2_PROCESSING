//Assignment 2
//Clicker
//Noh Ha Kyung
//2011-10053
//Title: "Save money"

//Variables
PFont myFont1;
PFont myFont2;
PImage greatImg;
PImage stupidImg;
String strCurBalance; //Current Balance in Strings
int curBalance;
int curLine;
String textSpace1 = "                        "; //from today to Withdrawal
String textSpace2 = "                                                          "; //from today to Deposit
String textSpace3 = "              "; //from Deposits to balance
String textSpace4 = "                                                            "; //from Withdrawals to balance
int coinPlusX, coinPlusY;
int coinMinusX, coinMinusY;
int coinSpeedPlus, coinSpeedMinus;
boolean showGreat, showStupid, showCoinMinus;
color btnColor;
int increaseBy;
int decreaseBy;
int timePressed;
int timeDelay;
int curGreatSound = 0;
int curStupidSound = 0;


//Time
int d = day();
int y = year();
int m = month();
int h = hour();
int mm = minute();
String today;

String[] greatText = {"정기 적금", "책 구매", "주택청약 적금", "저금", "친구 안 만남", "자동이체 적금", "또 적금", "저축", "적금"}; //temp
String[] stupidText = {"택시", "친구와 술자리", "명품 가방", "카드값", "최신형 핸드폰", "해외여행", "먹방", "면세점", "지름신", "택시비"};
int greatTextRand = 0;
int stupidTextRand = 0;

//Audio
import ddf.minim.*;
Minim minim;
AudioPlayer coin_sound;
AudioPlayer alarm_sound;
AudioPlayer great1, great2, great3, great4;
AudioPlayer stupid1, stupid2, stupid3, stupid4, stupid5, stupid6, stupid7, stupid8;

void setup() {
  //Init
  today = y + "/" + m + "/" + d;
  curBalance = 0;
  curLine = 0;
  strCurBalance = "";
  coinPlusX = 115;
  coinPlusY = 580;
  coinMinusX = 540;
  coinMinusY = 440;
  coinSpeedPlus = 0;
  coinSpeedMinus = 0;
  showCoinMinus = false;
  showGreat = false;
  showStupid = false;
  increaseBy = 100000;
  decreaseBy = 100000;
  timePressed = 0;
  timeDelay = 500; //Sticker show time 0.5 sec

  //Font
  myFont1 = createFont("Arial", 11, true);
  myFont2 = createFont("Georgia", 11, true);
  size(650, 650);

  //Audio
  minim = new Minim(this);
  coin_sound = minim.loadFile("coinSound.mp3");
  alarm_sound = minim.loadFile("alarmSound.mp3");
  great1 = minim.loadFile("great1.mp3");
  great2 = minim.loadFile("great2.mp3");
  great3 = minim.loadFile("great3.mp3");
  great4 = minim.loadFile("great4.mp3");
  stupid1 = minim.loadFile("stupid1.mp3");
  stupid2 = minim.loadFile("stupid2.mp3");
  stupid3 = minim.loadFile("stupid3.mp3");
  stupid4 = minim.loadFile("stupid4.mp3");
  stupid5 = minim.loadFile("stupid5.mp3");
  stupid6 = minim.loadFile("stupid6.mp3");
  stupid7 = minim.loadFile("stupid7.mp3");
  stupid8 = minim.loadFile("stupid8.mp3");


  //Image
  greatImg = loadImage("greatImg.png");
  stupidImg = loadImage("stupidImg.png");
}


void playGreatSound() {

  if (curGreatSound == 0) {
    great1.rewind();
    great1.play();
  }
  if (curGreatSound == 1) {
    great2.rewind();
    great2.play();
  }
  if (curGreatSound == 2) {
    great3.rewind();
    great3.play();
  }
  if (curGreatSound == 3) {
    great4.rewind();
    great4.play();
  }
}

void playStupidSound() {

  if (curStupidSound == 0) {
    stupid1.rewind();
    stupid1.play();
  }
  if (curStupidSound == 1) {
    stupid2.rewind();
    stupid2.play();
  }
  if (curStupidSound == 2) {
    stupid3.rewind();
    stupid3.play();
  }
  if (curStupidSound == 3) {
    stupid4.rewind();
    stupid4.play();
  }  
  if (curStupidSound == 4) {
    stupid5.rewind();
    stupid5.play();
  }  
  if (curStupidSound == 5) {
    stupid6.rewind();
    stupid6.play();
  }  
  if (curStupidSound == 6) {
    stupid7.rewind();
    stupid7.play();
  }  
  if (curStupidSound == 7) {
    stupid8.rewind();
    stupid8.play();
  }
}

void draw() {
  background(248, 231, 162);

  //TITLE
  fill(0);
  textFont(myFont2, 32);
  text("\"돈은 안 쓰는 것이다\"", 190, 70);
  textFont(myFont2, 18);
  text("-김생민", 420, 100);

  //Bankbook Image
  stroke(0);
  fill(23, 87, 134);
  rect(136, 115, 370, 415, 10);
  fill(255);
  rect(140, 475, 360, 50, 10);
  rect(140, 475, 360, 48, 10);
  rect(140, 120, 360, 400, 10);
  stroke(67, 147, 206);
  strokeWeight(2);
  line(141, 165, 499, 165);
  line(141, 185, 499, 185);
  line(141, 473, 499, 473);
  line(207, 166, 207, 473);
  line(247, 166, 247, 473);
  line(350, 166, 350, 473);
  line(453, 166, 453, 473);
  //Bankbook text
  fill(0);
  textFont(myFont1, 13);
  text("DATE", 160, 180);
  text("WITHDRAWALS", 250, 180);
  text("DEPOSITS", 370, 180);
  textFont(myFont1, 9);
  text("DESCR", 211, 179);
  text("BALANCE", 456, 179);
  textFont(myFont1, 20);
  fill(14, 39, 175);
  text("내 텅장", 430, 150);
  fill(0);
  text("Balance:", 150, 505);
  strCurBalance = nfc(curBalance);
  text(strCurBalance, 370, 505);
  text("₩", 475, 505);

  //Coins
  fill(255, 207, 75); //yellow
  strokeWeight(2);
  stroke(255, 244, 21); //bright yellow
  ellipse(coinPlusX, coinPlusY, 40, 40); //Coin plus
  coinPlusY -= coinSpeedPlus;
  if (coinPlusY < 410) {
    coinPlusY = 580; 
    coinSpeedPlus = 0;
  }
  if (showCoinMinus) {
    ellipse(coinMinusX, coinMinusY, 40, 40); //Coin minus
    coinMinusY += coinSpeedMinus;
    if (coinMinusY > 585) {
      coinMinusY = 440;
      coinSpeedMinus = 0;
      showCoinMinus = false;
    }
  }

  //Buttons
  //Plus
  strokeWeight(2);
  stroke(100);
  fill(134, 221, 178);
  rect(43, 560, 140, 50, 5);
  noStroke();
  fill(255);
  rect(110, 567, 7, 35);
  rect(96, 582, 35, 7);

  //Minus
  stroke(100);
  fill(229, 118, 97);
  rect(470, 560, 140, 50, 5);
  fill(255);
  noStroke();
  rect(525, 582, 35, 7);

  //Text
  textFont(myFont1, 11);
  fill(0);

  //text1
  text(today+textSpace1+stupidText[0]+textSpace4, 148, 204);
  //text2
  text(today+textSpace2+greatText[2]+textSpace3, 148, 244);
  //text3
  text(today+textSpace2+greatText[1]+textSpace3, 148, 284);
  //text4
  text(today+textSpace1+stupidText[3]+textSpace4, 148, 324);
  //text5
  text(today+textSpace1+stupidText[4]+textSpace4, 148, 364);
  //text6
  text(today+textSpace2+greatText[5]+textSpace3, 148, 404);
  //text7
  text(today+textSpace2+greatText[6]+textSpace3, 148, 444);



  //Show sticker
  if (showGreat) {
    image(greatImg, 5, 160);
    if (millis() - timePressed > timeDelay) {
      showGreat = false;
    }
  }

  if (showStupid) {
    image(stupidImg, 540, 160);
    if (millis() - timePressed > timeDelay) {
      showStupid = false;
    }
  }
}

void mousePressed() {
  //Plus Button
  if (mouseX > 43 && mouseX < 183 && mouseY > 560 && mouseY < 610) {
    curBalance += increaseBy;
    coin_sound.rewind();
    coin_sound.play();
    showGreat = true;
    timePressed = millis();
    coinSpeedPlus = 15;
    curLine += 1;
    curGreatSound = int(random(0, 5));
    playGreatSound();
  }

  //Minus Button
  if (mouseX > 470 && mouseX < 610 && mouseY > 560 && mouseY < 610) {
    curBalance -= decreaseBy;
    alarm_sound.rewind();
    alarm_sound.play();
    showStupid = true;
    timePressed = millis();
    showCoinMinus = true;
    coinSpeedMinus = 15;
    curLine += 1;
    curStupidSound = int(random(0, 9));
    playStupidSound();
  }
}