//Class: Timer
//Create object with interval Timer(int _seconds)
//Methods: .run() -> start repeating timer, bool _isFinished() -> time elapsed

class Timer {
  
  int savedTime;
  int interval = 0;
  int curTime = 0;

  Timer(int _interval) {
    interval = _interval * 1000;
    savedTime = millis();
  }
  
  void run(){
   savedTime = millis();
  }
  
  boolean isFinished(){
   if(millis() - savedTime > interval) return true;
   else return false;
  } 
}