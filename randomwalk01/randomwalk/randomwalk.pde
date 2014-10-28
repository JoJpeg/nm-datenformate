
ArrayList<walker> walkers;
int step = 50;
int size = 50;


void setup() {
  walkers = new ArrayList<walker>();
  size(1300, 1000);
}

void draw() {

  for (int i = 0; i < walkers.size (); i++) {
    walkers.get(i).update();
  }
  println(walkers.size());
}


void mouseClicked() {
  int gerastertX = mouseX;
  int gerastertY = mouseY;
  boolean imRaster = false;
  while (imRaster==false)
  {
    if (gerastertX%step!=0) {
      gerastertX = gerastertX -1;
    } else if (gerastertY%step!=0) {
      gerastertY = gerastertY -1;
    } else {
      imRaster = true;
    }
  }
  walkers.add(new walker(gerastertX, gerastertY));
}

void keyReleased() {
  if ( key == 's') {
    saveFrame("save-#####" + day());
  }
}




