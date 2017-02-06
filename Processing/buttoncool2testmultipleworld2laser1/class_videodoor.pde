void replay() {
  /*
  instead of using loop. this way we can do stuff when the movie restarts without
   nasty frame calculation or duration / time comparison (there is a movie.duration() and movie.time() function)
   */
  door.stop();
  if (!win) {
    button[6].randomPosition();
    door.play();
  }
}