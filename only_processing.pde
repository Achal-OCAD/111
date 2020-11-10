float theta = 0;
float perspective = 0.95; 
float band = 7;



void setup() {
  size(1080, 1080);

}



void draw() 
{
 
  
  background(255);
  translate(width/2, height/2);
  float dia = width*(1/perspective); 
  theta = theta - TWO_PI/45;

        for (int j = 0; j<200; j++) {
          rectMode(CENTER);
          noStroke();
          //Change value in fill to play with colurs and visual
          fill(HSB, 200*(sin(theta+TWO_PI*j/band)*2), 100*(1+sin(theta+TWO_PI*j/band)), 
            140*(1+sin(theta+TWO_PI*j/band)/2));
          //rotate(100);
          rect(0, 0, dia, dia);
          dia = dia * perspective;
        }
      } 


      


      
