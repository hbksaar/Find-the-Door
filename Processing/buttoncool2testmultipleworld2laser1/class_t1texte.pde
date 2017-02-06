class Text {
  String w;
  int x;
  int y;
  int z;
  color colorw =color( random(0, 255)) ;
  int xspeed;
  float textw;
  float texth;
  boolean colorActif;
  boolean mouseHover;
  boolean zoomVirus;


  Text(String tempw, int tempx, int tempy, int tempz,int tempxspeed) {

    xspeed= tempxspeed;
    w=tempw;
    x=tempx;
    y=tempy;
    z=tempz;
  }



  void display() {
    if (!mouseHover) {
      textw= textWidth(w);
      texth = textAscent() + textDescent();
      fill(255);
      textFont(f1, 20);
      text(w, x, y,z);
    } 

    if (colorActif) {

      fill( int(random(2))*255, int(random(2))*255, int(random(2))*255);
      textFont(f1, 20);
      text(w, x, y,z);
    }  

    if (zoomVirus) {
      textSize(30);
     //textLeading(150);
      fill(0);
      text(w, x, y,0);
    }
  }

  void move() {
    y=y+xspeed;

    if (( y < height) && (y < 0) || (y > height) && ( y> height)) {
      xspeed=-xspeed;
    }
  }

  //interaction word dissapear
  void interact() {
    if (laserX > x && laserX < x+textw && laserY > y && laserY < y+texth) {

      mouseHover =! mouseHover;
    }
  }


  //interaction button color/stop and play.
  void apparition() {
    if (mousePressed) {
      colorActif =! colorActif;
    }
  }


  void crazy() {
    if (mousePressed) {

      zoomVirus =! zoomVirus;
    }
  }
}