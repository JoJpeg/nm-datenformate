
ArrayList<walker> walkers;

void setup() {

  size(500, 700);
  walkers.add(new walker(width/2, height/2));
}

void draw() {
  
  for (int i = 0; i < walkers.size(); i++) {
    walkers.get(i).update();
  }
}

void mouseClicked(){  
  walkers.add(new walker(mouseX, mouseY));
}
  
  
class walker {

  float offsetX;
  float offsetY;
  int x;
  int y;
  int offset;
  int stepSize =4;

  walker(int posx,int posy) {
    x =  posx;
    y =  posy;
  }

  void update() {  
    generatePoint();
  }

  void generatePoint() {

    stepSize = (int) random(30);
    int newx = pointPos( random(-1, 1));
    int newy = pointPos( random(-1, 1)); 


    println(x +":"+ y +"  "+ newx + ":" + newy);
    if (x+newx > 0 && x+newx < width && y+newy > 0 && y+newy < height) {

      x += newx;
      y += newy; 
      stroke(frameCount/width/2, frameCount/height/9, frameCount/width/20);
      strokeWeight(random(5, 10));
      point(x, y);
    } else {

      generatePoint();
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



