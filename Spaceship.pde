class Spaceship extends Floater  
{   
    public Spaceship(){
     corners = 4;
     xCorners = new int[]{-8,16,-8,-2};
     yCorners = new int[]{-8, 0, 8, 0};
     myColor = color(255,255,255);
     myCenterX = 250;
     myCenterY = 250;
     myXspeed = 0;
     myYspeed = 0;
     myPointDirection = 0;
    }
    public void setXspeed(double x){myXspeed = x;}
    public double getXspeed(){return myXspeed;}
    public void setYspeed(double y){myYspeed = y;}
    public double getYspeed(){return myYspeed;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
    public void setCenterX(int x) {myCenterX = x;}
    public int getCenterX(){return (int)myCenterX;}
    public void setCenterY(int y) {myCenterY = y;}
    public int getCenterY(){return (int)myCenterY;}
}
