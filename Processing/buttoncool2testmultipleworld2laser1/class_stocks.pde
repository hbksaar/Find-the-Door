
class Stock {
  String w; // Name
  int val;     // Value
  float x;     // x position
  float y;
  float z;
  int xspeed;
  color colorw =255 ;
  String display; 
  boolean colorActif;
  Stock(String tempw, float xpos, float tempz, float ypos, int Xspeed) {
    w= tempw;
    z=tempz;
    x=xpos;
    y=ypos;
xspeed=Xspeed;
    // Concatenate the name, value and some spaces
    display = w + " " ;
  }

  // A function to set x position
  void setX(float x_) {
    x = x_;
  }

  void display() {

    for (int i = 0; i < stocks.length; i++) {
      fill(colorw);
      textFont(f);
      text(display, x, height-25*i);
    }
    if (colorActif) {
      for (int i = 0; i < stocks.length; i++) {
        fill( int(random(2))*255, int(random(2))*255, int(random(2))*255);
        textFont(f);
        text(display, x, height-25*i);
      
      }
    }
  }
  float textW() {
    textFont(f);
    return textWidth(display);
  }
  float textH() {
    textFont(f);
    return textAscent() + textDescent();
  }

  void move() {
    x = x - 1;
    y= y-1;
    if (x < width-totalW && y < height-totalH) {
      x = width;
      y= height;
    }
  }
  void apparition() {
    colorActif =! colorActif;
  }
}