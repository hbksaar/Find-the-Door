import processing.video.*;
PApplet app; //technically needed to create movie instances inside of a class
PImage blob;

boolean debug = false; //new: activate it to see the movies in the background

WordedImageLayer[] layers = new WordedImageLayer[7];

void movieEvent(Movie m) {
  m.read();
}

void setup() {
  size(1536, 230);
  textAlign(CENTER);
  fill(255);
  blob = loadImage("blob.png");
  app = this;

  /* new: 
   you don't need to load the movie seperately from the layer-class anymore. it loads the video itself now yay :) just give the filename as first argument.
   (changed first argument from Movie-type to String-type, added movie constructor to class)
   */
  layers[0] = new WordedImageLayer(
    "0.mov", //String, the name of the movie file we want to load in.
    "word", //String, the word it should use to write over the movie.
    0, //Integer, horizontal X-position. vertical position doesn't matter, the videos are always stretched over the whole height
    10, //Integer, brightness-threshold. look up what a threshold is if you don't know it. min: 0, max: 255. if it's 30 it will write the word for every pixel in the video that is less bright than 30 
    15 //Integer, level of detail. the higher the number, the less detail
    );
  layers[1] = new WordedImageLayer("1.mov", "door", 1000, 40, 3);
  layers[2] = new WordedImageLayer("2.mov", "a", 0, 10, 10); //new: make threshold a negative number to inverse it.
  layers[3] = new WordedImageLayer("3.mov", "water", 0, 10, 4);
  layers[4] = new WordedImageLayer("4.mov", "wave", 0, 100, 20);
  layers[5] = new WordedImageLayer("5.mov", "smoke", 0, 200, 7);
  layers[6] = new WordedImageLayer("6.mov", "smoke", 0, 200, 7);

  /* new functions:
  startPlaying, stopPlaying, togglePlaying
  */

  layers[0].startPlaying();
//  layers[1].startPlaying();
//  layers[2].startPlaying();
//  layers[3].startPlaying();
//  layers[4].startPlaying();
//  layers[5].startPlaying();
}


void draw() {
  background(0);
  for (int i = 0; i < layers.length; i++) {
    layers[i].update();
  }
}


void mousePressed() {
  for (int i = 0; i < layers.length; i++) {
    if (layers[i].hover()) {
      println("Clicked layer " + i + "!");

      //you could call the following function with a button. (are there really going to be buttons in final version?)
      layers[i].togglePlaying();
    }
  }
}

class WordedImageLayer { 
  Movie sourceMovie;
  PGraphics canvas;
  PImage getmov;
  PImage mov;
  String word;
  String movFileName;
  boolean inverse;
  boolean hover;
  boolean isPlaying;
  int threshold;
  int detailfactor;
  int movX;
  int movY = 0;
  int movW;
  int movH;
  WordedImageLayer(String MovName, String Word, int X, int thresh, int Factor) {
    movFileName = MovName;
    word = Word;
    movX = X;
    threshold = thresh;
    detailfactor = Factor;
    sourceMovie = new Movie(app, movFileName);
  }

  void startPlaying() { //new-
    sourceMovie.loop();
    isPlaying = true;
  }
  void stopPlaying() { //-functions-
    sourceMovie.stop();
    isPlaying = false;
  }
  void togglePlaying() { //-yay!
    if (isPlaying)
      stopPlaying();
    else
      startPlaying();
  }

  boolean hover() {
    if (mouseX > movX && mouseX < movX + movW && mouseY > movY && mouseY < movY + movH)
      return true;
    else
      return false;
  }

  void update() {
    if (isPlaying) { //new! check if isplaying. so you can just keep the for loops that update every video. it will break here if the video shall not be running.
      try {
        mov = sourceMovie.get();
        mov.resize(0, height);
        movW = mov.width;
        movH = mov.height;
        canvas = createGraphics(movW, movH);
        canvas.beginDraw();
        canvas.imageMode(CORNER);
        canvas.image(mov, 0, 0, canvas.width, canvas.height);
        canvas.imageMode(CENTER);
        canvas.image(blob, mouseX-movX, mouseY, height/3, height/3);
        mov = canvas.get();
        canvas.endDraw();
        mov.resize(0, height/detailfactor);
        if (debug) {
          tint(255, 60);
          image(canvas, movX, 0);  
          tint(255, 255);
        }
        mov.loadPixels();
        for (int i=0; i<mov.pixels.length; i++ ) {
          int col = mov.pixels[i];
          if (brightness(col) > threshold) {
            //int x = i%mov.width*detailfactor;
            int x = int(map(i%mov.width*detailfactor, 0, mov.width, 0, movW/detailfactor)); //new! fixes a bug where the cursor was out of place
            int y = i/mov.width*detailfactor+10;
            text(word, x+movX, y);
          }
        }
      } 
      catch (Exception e) {
      }
    }
  }
}  