A button class for creating buttons with individual position, image and action.  
The action to run is determined by its name.
```
Button(
int X, //x-position
int Y, //y-position
int W, //width
int H, //height
String Img, //image name (image must be in data-folder)
String WTD // what to do - every button carries all functions you want to be able to call. which function gets called is selected by the buttons name. THIS IS DIRTY, implement arraylist if you like, or some fancy case-table.. oh well
)
```
