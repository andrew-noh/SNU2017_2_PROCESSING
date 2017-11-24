//Alert(positionX, positionY, width, height, alertText, dismiss time, sceneNumber to be shown in, action identifier)

class Alert {

  int x, y, w, h;
  int autoDismissTime;
  int showStartTime;
  int sceneIndex;
  String alertText;
  String dismissAlertAction;
  String cancelAlertAction;
  String confirmAlertAction;
  Button dismissAlert;
  Button cancelAlert;
  Button confirmAlert;
  color dismissButtonColor = color(#F6A623);
  color dismissButtonOverColor = color(#F3C06B);
  color cancelButtonColor = color(#F2A072);
  color cancelButtonOverColor = color(#FE8C4A);
  color confirmButtonColor = color(#85DC26);
  color confirmButtonOverColor = color(#7DE110);
  color alertBgColor = color(#D8D8D8);
  int infoAlertButtonFontSize = 24;
  int infoAlertTextSize = 0;
  boolean showThisAlert;
  boolean shownOnce;

  //Tutorial Alert(one button, shown one time only)
  Alert(int _x, int _y, int _w, int _h, String _alertText, int _textSize, int _sceneIndex, String _dismissAlertAction) {
    showThisAlert = true;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    alertText = _alertText;
    sceneIndex = _sceneIndex;
    dismissAlertAction = _dismissAlertAction;
    infoAlertTextSize = _textSize;
    shownOnce = false;
    dismissAlert = new Button(x, y+h/2-30, 120, 45, 5, dismissButtonColor, dismissButtonOverColor, false, "OK", infoAlertButtonFontSize, sceneIndex, dismissAlertAction);
  }

  //Confirmation Alert(two buttons, no auto dismiss)
  Alert(int _x, int _y, int _w, int _h, String _alertText, int _textSize, int _sceneIndex, String _cancelAlertAction, String _confirmAlertAction) {
    showThisAlert = false;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    alertText = _alertText;
    sceneIndex = _sceneIndex;
    cancelAlertAction = _cancelAlertAction;
    confirmAlertAction = _confirmAlertAction;
    infoAlertTextSize = _textSize;
    cancelAlert = new Button(x-w/4, y+h/2-40, 120, 45, 5, cancelButtonColor, cancelButtonOverColor, false, "NO", infoAlertButtonFontSize, sceneIndex, cancelAlertAction);
    confirmAlert = new Button(x+w/4, y+h/2-40, 120, 45, 5, confirmButtonColor, confirmButtonOverColor, false, "YES", infoAlertButtonFontSize, sceneIndex, confirmAlertAction);
  }


  void showInfoAlert() {
    if (this.showThisAlert && !this.shownOnce) {
      alertOnScreen = true;
      rectMode(CENTER);
      fill(alertBgColor, 230);
      stroke(0);
      strokeWeight(1);
      rect(x, y, w, h, 20);
      textFont(fontGeorgia, infoAlertTextSize);
      fill(0);
      textAlign(CENTER, CENTER);
      text(alertText, x, y);
      dismissAlert.showButton();
    }
  }

  void showConfirmAlert() {
    if (this.showThisAlert) {
      alertOnScreen = true;
      rectMode(CENTER);
      fill(alertBgColor, 230);
      stroke(0);
      strokeWeight(1);
      rect(x, y, w, h, 20);
      textFont(fontGeorgia, infoAlertTextSize);
      fill(0);
      textAlign(CENTER, CENTER);
      text(alertText, x, y);
      cancelAlert.showButton();
      confirmAlert.showButton();
    }
  }

  void dismissAlert() {
    if (curScene == sceneIndex && this.cancelAlert.over()) {
      this.showThisAlert = false;
    }
  }

  void confirmAlert() {
    if (curScene == sceneIndex && this.confirmAlert.over()) {
      this.confirmAlert.action();
      this.showThisAlert = false;
      alertOnScreen = false;
    }
  }
}