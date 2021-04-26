
float x, y, r = 250;
float noiseScale = .006, noiseAmount = 75;
int N = 360;

void setup(){
  size(800,800);
  fill(32);

}


void draw() { 
  translate(width/2,height/2); 
    background(255); 
  shape(); 
}
void shape() {   
  fill(0);
  stroke(0);
  beginShape();
  for(int i=0; i<N; i++){
      x = 0 + r*cos(TWO_PI*i/N);
      y = 0 + r*sin(TWO_PI*i/N);
      x += map(noise(noiseScale*x,noiseScale*y,0),0,1,-noiseAmount,noiseAmount);
      y += map(noise(noiseScale*x,noiseScale*y,1),0,1,-noiseAmount,noiseAmount);
      vertex(x,y);
 
  }
  endShape();
}
