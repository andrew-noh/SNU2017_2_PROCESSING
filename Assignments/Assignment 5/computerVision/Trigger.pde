//Total 8 triggers (width = sketch width divided by 8)

class Trigger {

  int w, h, x, y;
  int cellWidth = width/8;
  color c, c_over;
  boolean loop, loopBlink;
  String labelText;
  AudioPlayer my_sound;
  Timer blink = new Timer(600);

  //Constructer
  //Trigger: triggerChannel: one of 8, soundName: audio file name with extension, looping: true or false
  Trigger(int _triggerChannel, String _soundName, String _label, boolean _looping) {
    w = cellWidth;
    h = cellWidth;
    y = 0;
    labelText = _label;
    loop = _looping;
    my_sound = minim.loadFile(_soundName);

    switch(_triggerChannel) {
    case 1:
      x = 0;
      c = color(242, 102, 193, 150); //Cell 1 color (pink)
      c_over = color(236, 59, 174, 150);
      break;
    case 2:
      x = 1 * cellWidth;
      c = color(139, 86, 191, 150); //Cell 2 color (purple)
      c_over = color(128, 43, 211, 150);
      break;
    case 3:
      x = 2 * cellWidth;
      c = color(113, 109, 242, 150); //Cell 3 color (dark blue)
      c_over = color(74, 70, 220, 150);
      break;
    case 4:
      x = 3 * cellWidth;
      c = color(145, 197, 242, 150); //Cell 4 color (lighter blue)
      c_over = color(70, 153, 226, 150);
      break;
    case 5:
      x = 4 * cellWidth;
      c = color(162, 242, 234, 150); //Cell 5 color (marble)
      c_over = color(84, 240, 224, 150);
      break;
    case 6:
      x = 5 * cellWidth;
      c = color(250, 226, 67, 150); //Cell 6 color (yellow)
      c_over = color(255, 222, 0, 150);
      break;
    case 7:
      x = 6 * cellWidth;
      c = color(14, 103, 130, 150); //Cell 7 color (dark green)
      c_over = color(0, 67, 88, 150);
      break;
    case 8:
      x = 7 * cellWidth;
      c = color(250, 95, 87, 150); //Cell 8 color (red)
      c_over = color(240, 67, 58, 150);
      break;
    }
  }

  //Main function (show)
  void show() {
    if (loop) {
      //looping button 
      showToggle();
    } else {
      //momentary button 
      showMomentary();
    }
  }

  //Main function (play)
  void play() {
    if (loop) {
      //Looping
      loopPlay();
    } else {
      //Momentary
      playMomentary();
    }
  }


  //Sub functions
  //Momentary button
  void showMomentary() {
    noStroke();

    if (mouseOver() || trackerOver()) {
      fill(c_over);
    } else {
      fill(c);
    }

    rect(x, y, w, h, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(labelText, x+w/2, y+h/2);
  }

  //Toggle button
  void showToggle() {
    //Main square
    noStroke();
    fill(c);
    rect(x, y, w, h, 10);
    fill(255);

    //Sub squares: play and stop buttons
    fill(46, 255, 58, 200);
    rect(x, y+h/2, w/2, h/2, 10); //STOP

    //blink play button while playing
    if (my_sound.isPlaying() == false) {
      fill(255, 46, 85, 200);
      rect(x+w/2, y+h/2, w/2, w/2, 10); //START
      fill(255);
      textFont(myFont, 11);
      text("START", x+w*0.75, y+h*0.75);
    } else {
      if (loopBlink) {
        fill(255, 46, 85, 200);
        rect(x+w/2, y+h/2, w/2, w/2, 10);
      }
      fill(255);
      textFont(myFont, 11);
      text("ON", x+w*0.75, y+h*0.75);
    }

    //Timer
    if (blink.isFinished()) {
      loopBlink = !loopBlink;
      blink.startTimer();
    }

    //Main label
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(myFont, 18);
    text(labelText, x+w/2, y+h/4);

    //Stop text
    textFont(myFont, 11);
    text("STOP", x+w*0.25, y+h*0.75);
  }

  //play one time
  void playMomentary() {
    if (mouseOver() || trackerOver()) {
      my_sound.play();
    } else {
      my_sound.pause();
      my_sound.rewind();
    }
  }

  //loop sound
  void loopPlay() {
    startLoopButton();
    stopLoopButton();
  }

  //Start button trigger
  void startLoopButton() {
    if (my_sound.isPlaying() == false && ((mouseX > x+w/2 && mouseX < x+w && mouseY > y+h/2 && mouseY < y+h) || pointerOverStartButton())) {
      my_sound.loop();
      blink.startTimer();
    }
  }

  //Stop button trigger
  void stopLoopButton() {
    if (my_sound.isPlaying() && ((mouseX > x && mouseX < x+w/2 && mouseY > y+h/2 && mouseY < y+h) || (pointerOverStopButton()))) {
      my_sound.pause();
      my_sound.rewind();
    }
  }

  //Triggering notes
  boolean mouseOver() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      return true;
    } else {
      return false;
    }
  }

  boolean trackerOver() {
    if ((trackr1X > x || trackr2X > x) && (trackr1X < x + w || trackr2X < x + w) && (trackr1Y > y || trackr2Y > y) && (trackr1Y < y + h || trackr2Y < y + h)) {
      return true;
    } else {
      return false;
    }
  }

  boolean pointerOverStartButton() {
    if ((trackr1X > x+w/2 || trackr2X > x+w/2) && (trackr1X < x+w || trackr2X < x+w) && (trackr1Y > y+h/2 || trackr2Y > y+h/2) && (trackr1Y < y+h || trackr2Y < y+h)) { 
      return true;
    } else {
      return false;
    }
  }

  boolean pointerOverStopButton() {
    if ((trackr1X > x || trackr2X > x) && (trackr1X < x+w/2 || trackr2X < x+w/2) && (trackr1Y > y+h/2 || trackr2Y > y+h/2) && (trackr1Y < y+h || trackr2Y < y+h)) {
      return true;
    } else {
      return false;
    }
  }
}