Processing 3 Class that renders a Movie or Image in a PGraphic, looping through each pixel, determining its brightness value.  
If the brightness of a pixel is above / below a threshold, it writes a text on the pixel.  
```
WordedImageLayer(
  String MovName, //movie to load
  String Word, //word to write on pixel
  int X, //x-position of the movie on media-theatre screen
  int thresh, //brightness-threshold
  int Factor //level of detail - the higher, the more pixelated (less words)
  )
```
