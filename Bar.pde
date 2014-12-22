class Bar{
  float x;
  float y;
  float len;
  float thickness;
  Bar(){
    x=mouseX;
    y=height-10;
    len=50;
    thickness=10;
  }
  void display(){
    rectMode(CENTER);
    rect(mouseX,height-10,len,thickness);
noStroke();  
 fill(255);
}
}  
 
  
