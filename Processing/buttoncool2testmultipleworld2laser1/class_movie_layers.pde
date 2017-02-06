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
    if (laserX > movX && laserX < movX + movW && laserY > movY && laserY < movY + movH)
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
        canvas.image(blob, laserX-movX, laserY, height/3, height/3);
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