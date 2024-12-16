class Bullet extends Floater{
 public Bullet(Spaceship bob){
   myCenterX = bob.getCenterX();
   myCenterY = bob.getCenterY();
   myPointDirection = bob.getPointDirection();
   accelerate(2);
 }
 public void show(){
   fill(255,0,255);
   ellipse((float)myCenterX, (float)myCenterY, 10, 10);
 }
    public void setCenterX(int x) {myCenterX = x;}
    public int getCenterX(){return (int)myCenterX;}
    public void setCenterY(int y) {myCenterY = y;}
    public int getCenterY(){return (int)myCenterY;}
}
