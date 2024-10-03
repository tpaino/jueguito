//las siguientes son funciones base para modelar cada pieza según su ubicación

void roomL(color a, color b, int c, int d){ //left
  era = a;
  stroke(b);
  line(width,300,width,500);
  roomLevel = c;
  roomNumber = d;
  }
  
void roomC(color b, color c, int d, int e){ //center
  era = color(240, 137, 193);
  image(piso,400,400,800,800);
  stroke(b);
  line(0,300,0,500);
  stroke(c);
  line(width,300,width,500); 
  roomLevel = d;
  roomNumber = e;
}
  
  void roomC1(color b, int c, int d){ //center arriba
  era = color(240, 137, 193);
  image(piso,400,400,800,800);
  stroke(b);
  roomLevel = c;
  roomNumber = d;
  line(300,height,500,height);
  }
  
  
void roomR(color a, color b, int c, int d){ //right
  era = a;
  stroke(b);
  line(0,300,0,500); 
  roomLevel = c;
  roomNumber = d;
  }
