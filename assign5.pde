final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
int status; 
  Ball ball;
  Bar bar;
  Brick []brick=new Brick[50];
  boolean going;
  int life;

  void setup(){
    status = GAME_START;
    size(640,480);
    ball=new Ball();
    bar= new Bar();
    bar.x=320;
      for(int i=0; i<50;i++){
    brick[i]=new Brick(255,255,255);
      }
      going=false;
     rectMode(CENTER);
  life=3;
   reset();
   }
  
     void draw(){
       background(0);
       noStroke();
           
        switch(status) {
          
 case GAME_START:
 textAlign(CENTER);
 textSize(60);
 text("Press ENTER to START",320,240); 
    break;
    case GAME_PLAYING:
    background(0);
       ball.display();
       bar.display();
       changeColor();
       for(int i=0; i<50;i++){
       brick[i].display();
       }
         if(going){
         ball.move();
     }
         drawLife();
           hitBar();
            checkBrickHit();
     checkWinLose();
    
      if(ball.y>=height-5){
        life--;
      }
       break;
       
       case GAME_WIN:
        textAlign(CENTER);
        textSize(60);
 text("WINNER",320,240);
  break;
  
  case GAME_LOSE:
   textAlign(CENTER);
  textSize(60);
text("You Lose",320,240);
     break;
     }
     }
  void mousePressed(){
    if(mouseButton==RIGHT ){
     going=true;
    }else{
      going=false;
    }
  }
  void drawLife() {
    textSize(15);
  fill(230, 74, 96);
  text("LIFE:",34, 458);
  for(int i=0;i<3;i++){
    int circleX=78+25*i;
      ellipse(circleX,459,15,15);
  }
  
  }
  void checkWinLose(){
  if(life==0){
    status=4;
  }
  
  if(brick==null){
     status=3;
  }
  }
  void hitBar(){
   float bottomY=ball.y+5;
    if((ball.x+5>=bar.x-25)&&(ball.x-5<=bar.x+25)&&(bottomY>=bar.y-5)&&(bottomY<=bar.y+5)){
      ball.xSpeed*=-1;
       ball.ySpeed*=-1;
  }
}
  void checkBrickHit(){
    for (int i=0; i<brick.length; i++) {
   if((ball.x+5>=brick[i].x)&&(ball.x-5<=brick[i].x+20)&&(ball.y+5>=brick[i].y)&&(ball.y-5<=brick[i].y)){
     removeBrick(brick[i]);
   }
  }
  }
  void removeBrick(Brick obj) {
  obj.gone = true;
}
void changeColor(){
  if(status==GAME_PLAYING){
    for(int i=0;i<50;i++){
  int a=int (random(3));
   int b=int (random(50));
    int c=int (random(50));
    brick[a]=new Brick(255,0,0);
     brick[b]=new Brick(255,0,0);
      brick[c]=new Brick(255,0,0);
    } 
  }
}
  void reset() {
    ball.x=320;
    ball.y=height-20;
    bar.x=320;
    bar.y=height-10;
      for(int i=0; i<50;i++){
    brick[i].display();
      }
      life=3;
  }
  void keyPressed() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      break;

     case GAME_WIN: 
   status = GAME_PLAYING;
   reset();
   break;
   
   case GAME_LOSE: 
   status = GAME_PLAYING;
   reset();
   break;
    }
  }
}
