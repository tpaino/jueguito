int dirX = 0;
int dirY = 0;
int lastDirX;
int lastDirY;

void keyPressed(){
  if (key == 'w' || key == 'W'){
    dirY = -1;
    lastDirY = -1;
    lastDirX = 0;
    }
  
  if (key == 'a' || key == 'A'){
    dirX = -1;
    lastDirX = -1;
    lastDirY = 0;
  }
  
  if (key == 's' || key == 'S'){
    dirY = 1;
    lastDirY = 1;
    lastDirX = 0;
  }
  
  if (key == 'd' || key == 'D'){
    dirX = 1;
    lastDirX = 1;
    lastDirY = 0;
  }
  
  if (key == ' ' && merica) {
    disparando = true;
  }
 
  if (key == CODED){
    if (keyCode == SHIFT && quick){ //corres con shift
      velActual = 2 * vel();
    }
    
    if (keyCode == CONTROL && deathScreen() == false){
      pausa = true;
    }
  }
}

void keyReleased(){
  if (key == 'w' || key == 'W' || key == 's' || key == 'S'){
    dirY = 0;
    
  }
  
  if (key == 'a' || key == 'A' || key == 'd' || key == 'D'){
    dirX = 0;
  }
 
  if (key == CODED){ //dejas de correr al soltarlo
    if (keyCode == SHIFT && quick){
      velActual = vel();
    }
  }
  
  if (key == ' ' && merica) {
    disparando = false;
  }
}

void wasd(){
  px += dirX * velActual;
  py += dirY * velActual;
  
  px = constrain(px, size/2, width - size/2); //no puede salir de los bordes
  py = constrain(py, size/2, height - size/2);
  
  if (john.limites2(px,py) && johnM() && johnVivo()){ //si choca con los bosses, pierde vida
  px = john.bposX - 200;
  hp -= 1;
  maxHP += 20;
  }
  
  if (jake.limites2(px,py) && jakeG() && jakeVivo()){
  px = jake.bposX - 200;
  hp -= 1;
  maxHP += 20;
  }
  
  if (scooter.limites2(px,py) && scooterB() && scooterVivo()){
  px = 400;
  py = 650;
  hp -= 2;
  maxHP += 20;
  }
}


//uso de chat gpt:
float limitTriang(float px, float py, float x1, float y1, float x2, float y2){ //limite con el techo
  float diagonal = sq(x2-x1) + sq(y2 - y1); //formula matemática para encontrar la diagonal del triángulo
  
  //encontrar el punto sobre la línea más cercano para no pasarlo.
  float t = ((px - x1) * (x2 - x1) + (py - y1) * (y2 - y1)) / diagonal;
  t = constrain(t, 0, 1);
  
  //coordenadas del punto proyectado sobre la línea
  float proyX = x1 + t * (x2 - x1);
  float proyY = y1 + t * (y2 - y1);
  
  //devuelve la distancia entre el punto y su proyección
  return dist(px, py, proyX, proyY);
}
  
