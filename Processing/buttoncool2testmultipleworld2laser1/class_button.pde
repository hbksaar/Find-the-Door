class Button { 
  int x, y, z, w, h;
  int xspeed;
  PImage img;
  String WhatToDo;
  boolean hover() {

    if (laserX>x && laserX< x +w&& laserY>y && laserY<y+h) {

      return true;
    } else {
      return false;
    }
  }


  Button (int X, int Y, int Z, int W, int H, int Xspeed, PImage Img, String WTD) {
    x= X;
    y = Y;
    z=Z;
    xspeed=Xspeed;
    w = W;
    h = H;
    img = Img.get();
    WhatToDo = WTD;
  }

  void clicked() {
    if (WhatToDo.equals("color")) {
      for (int i=0; i< t1.length; i++) {
        t1[i].apparition();
        t2[i].apparition();
        t3[i].apparition();
        stocks[i].apparition();
      }
    } 
    if (WhatToDo.equals("virus")) {
      for (int i=0; i< t1.length; i++) {
        t1[i].crazy();
        t2[i].crazy();
        t3[i].crazy();
      }
    }
    if (WhatToDo.equals("sound")) {
      song =minim.loadFile ("door24.mp3");
      song.play();
    }
    if (WhatToDo.equals("intro")) {
      start = true;
    }
    if (WhatToDo.equals("levelone")) {

      level1 =! level1;
    }

    if (WhatToDo.equals("leveltwo")) {
      level2 =! level2;
    }
    if (WhatToDo.equals("leveltree")) {
      level3 =! level3;
    }

    if (WhatToDo.equals("doorbutton")) {
      //THIS IS THE GAMES ENDING!! YOU CLICKED THE DOOR!! WHAT HAPPENS NOW?
      win = true;
      //play second door video.
      door.stop();
      door = new Movie (app, "part2.mov");
      door.play();
    }
  }

  void display() {
    if (WhatToDo.equals("doorbutton")) {
      img = door.get();
      println(img.width);
    }
    image(img, x, y, w, h);
  }

  void randomPosition() {
    x = int(random(0, width - w));
    y = int(random(0, height - h));
  }


  void move() {
    x=x+xspeed;

    if (x < 0 || x > width-w) {
      xspeed=-xspeed;
    }
  }
}