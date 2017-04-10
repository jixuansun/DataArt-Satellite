class Satellite {

  int perigee;
  int apogee;
  int a = 0;
  //int b = 100;
  float b = map(mouseY,0,720,5,100);
  int x = width/2;
  int y = height/2;
  
  float step = 0.05;
  float arc = 0;

  PVector pos = new PVector();
  PVector tpos = new PVector();

  Satellite(int inputPerigee, int inputApogee) {
      perigee = (inputPerigee/50);
      apogee = (inputApogee/200);
      
      a = (perigee + apogee)/2;
      println(a);
      
  }

  void render() {
    
    arc += step;
    b +=step*3;
    
    if(arc >= 2*PI ){
      arc = 0;
    }
    
    x = (a - perigee) + width/2 + round(a * cos(arc));
    y = height/2 + round(b * sin(arc));
    
    //strokeWeight(2);
    //point(x,y);
    
    //color[]colors = {#9e9ac8, #756bb1, #cbc9e2, #f2f0f7};
    fill(random(100,240),random(39,240),random(143,247));
    noStroke();
    ellipse(x,y,4,2);

  }
  
}