import processing.video.*;
import ddf.minim.*;
import processing.opengl.*;
import processing.net.*;

int port = 50000;       
Server myServer;     
PApplet app; //technically needed to create movie instances inside of a class
PImage blob;
boolean debug = false; //new: activate it to see the movies in the background
WordedImageLayer[] layers = new WordedImageLayer[4];

Minim minim;
AudioPlayer song;

Button []button= new Button[8];
PFont f;
PFont f1;
PFont f2;
Text[] t1, t2, t3;
Stock[]stocks= new Stock[26];

float totalW =0 ;
float totalH=0;
int wordCount = 26;
boolean start=false;
boolean level1=false; 
boolean level2=false;
boolean level3=false;
boolean level4=false;
boolean screen;
boolean win;

PImage Buttona, Button11, Button1, Button2, Button12, ButtonMovie;

int laserX, laserY;

void movieEvent(Movie m) {
  m.read();
}

Movie door;

void setup() {
  size(2000, 300, P3D);
  myServer = new Server(this, port);
  door = new Movie (this, "part1.mov");
  //doorclicked = new Movie (this, "part2.mov");
  door.play();
  blob = loadImage("blob.png");
  app = this;
  layers[0] = new WordedImageLayer("0.mov", "door", 0, 100, 10);
  layers[1] = new WordedImageLayer("3.mov", "door", 0, 10, 40);
  layers[2] = new WordedImageLayer("wave15.mov", "DOOR", 0, 20, 30); //new: make threshold a negative number to inverse it.
  layers[3] = new WordedImageLayer("4.mov", "DOOR", 0, 100, 34);
  //layers[4] = new WordedImageLayer("4.mov", "DOOR", 0, 100, 20);
  //layers[5] = new WordedImageLayer("5.mov", "smoke", 0, 200, 7);


  layers[0].togglePlaying();
  layers[1].startPlaying();
  layers[1].stopPlaying();
  layers[2].togglePlaying();
  layers[3].togglePlaying();
  minim= new Minim(this);

  // you have to change the name of the sound and drog and drop in the sketch
  song =minim.loadFile ("door24.mp3");

  float x = 0;
  float y=0;
  f= createFont("Monospaced-48", 10);
  f1 = loadFont("Avenir-Roman-48.vlw");
  f2= loadFont("SansSerif-48.vlw");

  Button1 = loadImage("Button1.png");
  Button2 = loadImage("Button2.png");
  Buttona = loadImage("Buttona.png");
  Button11 = loadImage("Button11.png");
  Button12 = loadImage("Button12.png");
  ButtonMovie = createImage(door.width, door.height, ARGB);



  button[0]= new Button (250, 200, 100, Buttona.width/10, Buttona.height/10, 1, Buttona, "intro");
  button[1]=new Button (100, 100, 100, Button11.width/10, Button11.height/10, 1, Button11, "virus");
  button[2]=new Button (200, 150, 100, Button1.width/10, Button1.height/10, 1, Button1, "sound");
  button[3]=new Button (10, 250, 100, Button2.width/10, Button2.height/10, 1, Button2, "color");
  button[4]=new Button (350, 150, 100, Button12.width/10, Button12.height/10, 1, Button12, "levelone");
  button[5]=new Button (250, 10, 100, Buttona.width/10, Buttona.height/10, 2, Buttona, "leveltwo");
  button[7]=new Button (350, 210, 100, Buttona.width/10, Buttona.height/10, 2, Buttona, "leveltree");
  //bouton door !!666 
  button[6]=new Button (100, 100, 100, ButtonMovie.width/5, ButtonMovie.height/5, 1, ButtonMovie, "doorbutton");

  t1=new Text [wordCount];
  t2=new Text [wordCount];
  t3=new Text [wordCount];

  for (int i=0; i< wordCount; i++) {
    t1[i]=new Text ("DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR ", 0, 30*i, -30, 1);
    t2[i]=new Text ("DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR ", 0, 30*i, -10, 1);
    t3[i]=new Text ("DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR DOOR ", 0, 30*i, 10, 2);
  }
  for (int j = 0; j < stocks.length; j++) {

    stocks[j]= new Stock("DOOR DOOR DOOR DOOR DOOR", 100, 30, -100, 1);
  }

  for (int i = 0; i < stocks.length; i++) {
    stocks[i].setX(x);

    x = x + (stocks[i].textW());
    y = y + (stocks[i].textH());
  }
  totalH = y;
  totalW = x;
  start = true;
  level1 = true;
}

void draw() {
  background(0);
  getLaser();

  try {

    if ((!start)) {
      if (!screen) { 
        for (int i = 0; i < stocks.length; i++) {
          stocks[i].move();
          stocks[i].display();
        }
        if (!screen) {
          button[0].display();
          button[0].move();
         // println("je suis la");
        }
      }
      textAlign(LEFT);
      //textSize(40);
      textFont(f2);
      textLeading(10);
      String s= "FIND THE DOOR !";
      String h="click on the button to start...";
      String d="But...Can you find the good one?";
      text(s, 200, 50);
      textSize(30);
      text(h, 200, 110);

      text(d, 200, 160);
    } else if ((!level1)) {

      for (int i = 0; i < stocks.length; i++) {
        stocks[i].move();
        stocks[i].display();
      }
      for (int i =0; i<wordCount; i++) {
        t1[i].display();
        t2[i].display();
        t3[i].display();
        t1[i].move();
        t2[i].move();
        t3[i].move();
        t1[i].interact();
        t2[i].interact();
        t3[i].interact();
      }

      button[1].display();
      button[1].move();
      button[2].display();
      button[2].move();
      button[3].display();
      button[3].move();
      if (!screen) {
        button[4].display();
        button[4].move();
      }
    } else if ((!level2)) {
      for (int i = 0; i < stocks.length; i++) {
        stocks[i].move();
        stocks[i].display();
      }
      layers[1].update();
      layers[0].update();
      button[4].display();
      button[4].move();

      button[5].display();
      button[5].move();
      println("level1");
    }
   else if ((!level3)) {

  button[6].display();

  for (int i = 0; i < stocks.length; i++) {
    stocks[i].move();
    stocks[i].display();
  }

  layers[2].update();

  if (!screen) {
    println("level2");
    button[5].display();
    button[5].move();
    button[7].display();
    button[7].move();
  }
} else if ((!level4)) {

  for (int i = 0; i < stocks.length; i++) {
    stocks[i].move();
    stocks[i].display();
  }

  button[5].display();
  button[5].move();
  println("reviens");

  button[7].display();
  button[7].move();

  println("level3");
  layers[3].update();}}



catch (Exception a) {
}

if (door.time() >= door.duration()) {
  replay();
}
}
void mousePressed() {

  for (int i=0; i< button.length; i++) {
    if (button[i].hover()) {
      button[i].clicked();
    }
  }


  for (int i = 0; i < layers.length; i++) {
    if (layers[i].hover()) {
      println("Clicked layer " + i + "!");

      //you could call the following function with a button. (are there really going to be buttons in final version?)
      layers[i].togglePlaying();
    }
  }
}