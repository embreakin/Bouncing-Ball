float circleX;
float circleY;
float speedX;
float speedY;
float exspeedX;
float exspeedY;
float diameterX;
float diameterY;
float maxspeedX;
float maxspeedY;
float minspeedX;
float minspeedY;
float ndiameterX;
float ndiameterY;
float elasticity;
float absspeed;
float minapsspeed;
float maxapsspeed;
float interval;
float colordivisionnumber;
float speedincreasingrate;
float speeddecreasingrate;
boolean xumxum = true;
boolean yumyum = true;
a
void setup() {
  size(1200, 680);
  frameRate(80);
  circleX = random(width);
  circleY = random(height);
  speedX = 2;
  speedY = 2;
  exspeedX = 2;
  exspeedY = 2;
  maxspeedX = 50;
  maxspeedY = 50;
  minspeedX = 5;
  minspeedY = 5;
  colordivisionnumber = 5; // blue/green/yellow/red/gray
  minapsspeed = sqrt(pow(abs(minspeedX), 2) + pow(abs(minspeedY), 2));
  maxapsspeed = sqrt(pow(abs(maxspeedX), 2) + pow(abs(maxspeedY), 2));
  interval = (maxapsspeed-minapsspeed)/(colordivisionnumber-1);
  elasticity = 1;
  ndiameterX = 100;
  ndiameterY = 100;
  speedincreasingrate = 1.2;
  speeddecreasingrate = 0.8;
}


void draw() {
  
  absspeed = sqrt(pow(abs(speedX), 2) + pow(abs(speedY), 2));
  
  if (minapsspeed < absspeed && absspeed <= minapsspeed+interval) {
    background(0, 0, 255); // blue
  } else if (minapsspeed+interval < absspeed && absspeed <= minapsspeed+2*interval) {
    background(0, 255, 0); // green
  } else if (minapsspeed+2*interval < absspeed &&  absspeed <= minapsspeed+3*interval) {
    background(255, 255, 0); // yellow
  } else if ( absspeed > minapsspeed+3*interval) {
    background(255, 0, 0); // red
  } else {
    background(50); // gray
  }

  diameterX = ndiameterX-abs(speedX)*elasticity;
  diameterY = ndiameterY-abs(speedY)*elasticity;
  fill(255);
  ellipse(circleX, circleY, diameterX, diameterY);

  circleX = circleX + speedX ;
  circleY = circleY + speedY ;

   if (circleX-diameterX/2<=0 || circleX+diameterX/2>=width) {

    if (xumxum) {

      if (abs(speedX)> maxspeedX || abs(speedX)< minspeedX ) {
        exspeedX = speedX;
      }
      if (abs(exspeedX)> maxspeedX) {
        speedX = -speeddecreasingrate*speedX;
      } else {
        speedX = -speedincreasingrate*speedX;
      }

      diameterX = ndiameterX-abs(speedX)*elasticity;

      if (circleX-diameterX/2 + speedX<=0 || circleX+diameterX/2 + speedX>= width) {
        xumxum = !xumxum;
      }
    } else {
      if (circleX-diameterX/2 + speedX>0 && circleX+diameterX/2 + speedX < width) {
        xumxum = !xumxum;
      }
    }
  }


  if (circleY-diameterY/2<=0 || circleY+diameterY/2>=height) {
    if (yumyum) {

      if (abs(speedY)> maxspeedY || abs(speedY)< minspeedY) {
        exspeedY = speedY;
      }
      if (abs(exspeedY)>maxspeedY) {
        speedY = -speeddecreasingrate*speedY;
      } else {
        speedY = -speedincreasingrate*speedY;
      }

      diameterY = ndiameterY-abs(speedY)*elasticity;

      if (circleY-diameterY/2 + speedY<=0 || circleY+diameterY/2 + speedY>=height) {
        yumyum = !yumyum;
      }
    } else {
      if (circleY-diameterY/2 + speedY>0 && circleY+diameterY/2 + speedY <height) {
        yumyum = !yumyum;
      }
    }
  }

 
}
