//what does a cool button need?
//either trigger or bang
//bang: call a function on click
//trigger: toggle a boolean on click
//image
Button[] button = new Button[3];

void setup() {
  size(300, 300);

  button[0] = new Button(10, 10, 100, 100, "Button8.png", "print");
  button[1] = new Button(200, 100, 100, 100, "Button1.png", "switchdoormovie");
  button[2] = new Button(200, 100, 100, 100, "Button1.png", "toggle random movement");


  fill(255);
}
void draw() {
  background(0);
  for (int i = 0; i < button.length; i++) {
    button[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < button.length; i++) {
    if (button[i].hover())
      button[i].clicked();
  }
}
class Button {
  int x, y, w, h;
  String WhatToDo;
  PImage img;
  boolean hover() {
    if (mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h) {
      return true;
    } else {
      return false;
    }
  }
  Button(int X, int Y, int W, int H, String Img, String WTD) {
    x = X;
    y = Y;
    w = W;
    h = H;
    img = loadImage(Img);
    WhatToDo = WTD;
  }
  void clicked() {
    if (WhatToDo.equals("color")) {
      //call color functions shizzle
    } else if (WhatToDo.equals("print")) {
      println("Clicked!");
      
    } else if (WhatToDo.equals("something")){
      
    } else if (WhatToDo.equals("movieToggle5")){
 //     layers[5].togglePlay():
    }
  }
  void display() {
    image(img, x, y, w, h);
  }
}