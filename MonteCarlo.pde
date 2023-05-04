final int COUNT = 1000;
final int RADIUS = 256;
final int CENTER = 384;

ArrayList<Circle> circles = new ArrayList<Circle>();
ArrayList<Circle> circlesInside = new ArrayList<Circle>();
ArrayList<Circle> circlesOutside = new ArrayList<Circle>();

class Circle {
  int x;
  int y;
  boolean inside;
  
  Circle(int x, int y, boolean inside){
    this.x = x;
    this.y = y;
    this.inside = inside;
  }
  
  public void draw(){
    color c = this.inside ? color(0,255,0) : color(255,0,0);
    fill(c);
    noStroke();
    circle(this.x, this.y, 5);
  }
}

void setup() {
  size(768, 768, P2D);
  background(0);
  
  rect(CENTER-RADIUS,CENTER-RADIUS,RADIUS*2,RADIUS*2);
  circle(CENTER,CENTER,RADIUS*2);
  noLoop();
}

void draw() {
  for(int count = 0; count < COUNT; count++){
    int randx = (int) random(CENTER-RADIUS,CENTER+RADIUS);
    int randy = (int) random(CENTER-RADIUS,CENTER+RADIUS);
    
    boolean isInside = sqrt(pow((randx-(CENTER)),2)+pow((randy-(CENTER)),2)) <= RADIUS;
    
    Circle circle = new Circle(randx, randy, isInside);
    circle.draw();
    circles.add(circle);
    
    if(isInside){
      circlesInside.add(circle);
    } else {
      circlesOutside.add(circle);
    }
  }
  
  fill(0,45,45);
  rect(0,0,768,120);
  fill(255,255,255);
  textSize(56);
  text(circles.size(), 10, 50);
  fill(0,255,0);
  text(circlesInside.size(), 250, 50);
  fill(255,0,0);
  text(circlesOutside.size(), 500, 50);
  fill(255,255,255);
  
  String text = str(4*((float) circlesInside.size()/ (float) circles.size()));
  
  text(text, 10, 100);
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}
