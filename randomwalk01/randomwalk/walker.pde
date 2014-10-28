class walker {

  float offsetX;
  float offsetY;
  int x;
  int y;
  int offset;
  int stepSize =4;
  int r; 

  walker(int posx, int posy) {
    x =  posx;
    y =  posy;
    r = millis();
  }

  void update() {   
    generatePoint();   
    //checkMate();
  }

  void generatePoint() {

    stepSize = step;
    int newx = pointPos( random(-1, 1));
    int newy = pointPos( random(-1, 1)); 


    println(x +":"+ y +"  "+ newx + ":" + newy);
    if (x+newx > 0 && x+newx < width && y+newy > 0 && y+newy < height) {

      x += newx;
      y += newy; 
      stroke((millis() + r) % 255, frameCount % 155, frameCount % 155 );
      strokeWeight(random(size));
      point(x, y);
    } else {
      generatePoint();
    }
  }
  void checkMate() {

    for (int i = 0; i < walkers.size (); i++) {
      if ( x == walkers.get(i).x && y == walkers.get(i).y ) {
        walkers.add(new walker(x, y));
      }
    }
  }


  int pointPos(float position) {

    println(position);

    if (position > 0) {
      offset = stepSize;
    } else {
      offset = -stepSize;
    }

    return offset;
  }
}
