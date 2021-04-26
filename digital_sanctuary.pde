PImage img;

float drawLength = 500000;
float frame; 
void setup() {
  size(1184,692);
  img = loadImage("redwoods.jpg");
  background(0);
  smooth();
  //noStroke();
}
void mousePressed() { 
  saveFrame(); 
}
void draw() {
  if (frame > drawLength) { 
    return; 
  }
  // Pick a random point
  int findX = int(random(img.width));
  int findY = int(random(img.height));
  int loc = findX + findY*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float count = map(frame, 0, drawLength, 2,80); 
  
  for (int i = 0; i < count; i++){
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    stroke(r-75,g-75,b-75,20);
    //strokeWeight(2); 
    float weight = map(frame, 0,drawLength,1,0); 
    float weight2 = map(frame, 0,drawLength,7,0); 
    float weight3 = map(frame, 0,drawLength,14,0); 
    println(weight);
    float x2, y2, r2 = weight;
    float x3, y3, r3 = weight2;
    float x4, y4, r4 = weight3;
    
    float noiseScale = .015, noiseAmount = 25;
    int N = 360; 
   // float x3, y3, r3 = random(5);
   // float x4, y4, r4 = random(20);
    beginShape(); 
    for(int q=0; q<N; q++){
      x2 = findX + r2*cos(TWO_PI*q/N);
      y2 = findY + r2*sin(TWO_PI*q/N);
      x2 += map(noise(noiseScale*x2,noiseScale*y2,0),0,1,-noiseAmount,noiseAmount);
      y2 += map(noise(noiseScale*x2,noiseScale*y2,1),0,1,-noiseAmount,noiseAmount);
      fill(r,g,b,255); 
      vertex(x2,y2);
    }
    endShape();

     beginShape(); 
     for(int q=0; q<N; q++){
      x3 = findX + r3*cos(TWO_PI*q/N);
      y3 = findY + r3*sin(TWO_PI*q/N);
      x3 += map(noise(noiseScale*x3,noiseScale*y3,0),0,1,-noiseAmount,noiseAmount);
      y3 += map(noise(noiseScale*x3,noiseScale*y3,1),0,1,-noiseAmount,noiseAmount);
      fill(r,g,b,200); 
      vertex(x3,y3);
    }
    endShape();
     beginShape(); 
    for(int q=0; q<N; q++){
      x4 = findX + r4*cos(TWO_PI*q/N);
      y4 = findY + r4*sin(TWO_PI*q/N);
      x4 += map(noise(noiseScale*x4,noiseScale*y4,0),0,1,-noiseAmount,noiseAmount);
      y4 += map(noise(noiseScale*x4,noiseScale*y4,1),0,1,-noiseAmount,noiseAmount);
      fill(r,g,b,150); 
      vertex(x4,y4);
    }
    endShape();
 frame++;
  }
}
  
  
