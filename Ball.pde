class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  Ball(){
    x=320;
    y=height-20;
     xSpeed=3;
     ySpeed=3;
     size=10;
  }
  void display(){
    ellipseMode(CENTER);
    ellipse(x,y,size,size);
    noStroke();
    fill(255);
}
void move(){
  x-=xSpeed;
  y-=ySpeed;
  if(x<size/2||x>width-size/2){
    xSpeed*=-1;
  }
  if(y<size/2||y>height-size/2){
    ySpeed*=-1;
  }
}
 
}
