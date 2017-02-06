void getLaser() {
  Client thisClient = myServer.available();
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      String[] x = splitTokens(whatClientSaid, "(), ");
      //float(x[0]) = PVector1, float(x[1]) = PVector2, float(x[2]) = PVector3
      try {
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
        laserY = int(map(p2, 1, 4, height, 0));
        laserX = int(map(constrain(laserX, 0, width),0,width,width,0));
        laserY = constrain(laserY, 0, height);
        println(p1, p2, p3);
      } 
      catch(Exception e) {
      }
      println(laserX, laserY);
    }
  }
}