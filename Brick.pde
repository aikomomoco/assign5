class Brick{
  int x;
  int y;
  int size;
int space=30;
 boolean gone = false;
 void display(){
   for(int i=0; i<50;i++){
    int rectInRow=5;
   int row=i/rectInRow;
  int col=i%rectInRow;
    int ix=200;
   int iy=50;
     int x=ix+row*space;
    int y=iy+col*space;
   rect(x,y,size,size);
   noStroke();
   }
 }
   Brick(float v1,float v2,float v3){
    size=20;
     fill(v1,v2,v3);
   } 
   
}
