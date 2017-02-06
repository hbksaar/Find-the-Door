import processing.net.*;

int port = 50000;       
Server myServer;        

void setup()
{
  size(300,300);
  background(0);
  myServer = new Server(this, port);
}


void draw()
{
  getLaser();
}
int laserX,laserY;

void getLaser() {
  Client thisClient = myServer.available();
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      String[] x = splitTokens(whatClientSaid, "(), ");
      //potentially add try and catch here if the client is not in synch
      float p1 = float(x[0]);
      float p2 = float(x[1]);
      float p3 = float(x[2]);
      if (p1 == 3.5) {
        laserX = int(map(p3, -2.3, 2.3, width/5*2, width/5*3));
      } else {
        if (p3 < 0) {
          laserX = int(map(p1, -3.5, 3.5, 0, width/5*2));
        } else {
          laserX = int(map(p1, 3.5, -3.5, width/5*3, width));
        }
      }
      laserY = int(map(p2, 4, 1, 0, height));
      laserX = constrain(laserX, 0, width);
      laserY = constrain(laserY, 0, height);
    }
  }
}