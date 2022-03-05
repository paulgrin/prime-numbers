/**
 Controls:
  W - move up, S - move down, A - move left, D - move right
  UP - zoom in, DOWN - zoom out
  1- perjungti primes, 2- perjungti paprastus, 3-mazinti tasku size, 4-didinti tasku size 
*/

class Camera2D {
  float scale = 1;
  float xPan = -700;
  float yPan = -480;


  void update() {
    checkControls();
    //atnaujinam screen
    translate(width/2, height/2);
    scale(scale);
    translate(xPan, yPan);
  }

  void checkControls() {
    if (keyPressed) {
      if (keyCode == UP)
        scale *= 1.01;
      if (keyCode == DOWN)
        scale /= 1.01;
      if (key == 'w')
        yPan += 10;
      if (key == 's')
        yPan -= 10;
      if (key == 'a')
         xPan += 10;
      if (key == 'd')
        xPan -= 10;
    }
  }
}
