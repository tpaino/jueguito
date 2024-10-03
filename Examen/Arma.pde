ArrayList <Shoot> disparo = new ArrayList<Shoot>(); //lista que almacenará las balas que disparamos
int lastShoot = 0; //último disparo
int newShoot = 200; //milisegundos entre disparos

void asesinar(){
  
    
  if (disparando && millis() - lastShoot > newShoot) { //si la barra espaciadora está presionada y ha pasado suficiente tiempo, dispara
    disparo.add(new Shoot(px, py, lastDirX, lastDirY));
    lastShoot = millis(); //actualiza el tiempo del último disparo
  }
  
  for (int i = disparo.size() - 1; i >= 0; i--){ //itera sobre los elementos que están dentro de la lista 'disparo'
    Shoot shoot = disparo.get(i); //define la variable "shoot" como el objeto número i en la lista "disparo"
    if (pausa == false){
      shoot.updateShoot();
      shoot.showShoot();
    }
    if (onScreen(shoot.x,shoot.y,20)){
      if (johnM()){
        if (john.limites2(shoot.x, shoot.y)){ //si choca con los bosses, el disparo se remueve
          disparo.remove(i);
        }
      }
      
      else if (jakeG()){
        if (jake.limites2(shoot.x, shoot.y)){
          disparo.remove(i);
        }
      }
      
      else if (scooterB()){
        shoot.showShoot();
        if (scooter.limites2(shoot.x, shoot.y)){
          disparo.remove(i);
        }
      }
    }
  }

  if (newRoom == false){ // si cambia la pieza las balas desaparecen
    disparo.clear();
  }
}

class Shoot { //esta clase crea una bala para el jugador, que después se podrá almacenar en una lista para así dispararla en un momento y espacio específico
  float x, y;
  int vx, vy;
  int dmg;
  boolean limitShoot(){
      return 30 < x && x < width + 30 && -30 < y && y < height + 30;
    }
  
  Shoot(float inicioX, float inicioY, int dirX, int dirY) {
    x = inicioX;
    y = inicioY;
    vx = dirX * (velShoot);
    vy = dirY * (velShoot);
    dmg = damage;
    
    if (vx == 0 && vy == 0 || johnM() || jakeG() || scooterB()) {
      vx = velShoot;
      vy = 0;
    }
    
    if (scooterB()){
      vx = 0;
      if (py < scooter.bposY) vy = (velActual + 1);
      else vy = -(velShoot);
    }
  }
  
  void updateShoot(){ //actualizar la posición
    x += vx;
    y += vy;
    if (john.limites2(x, y) && johnM()){
      bhp1 -= dmg;
      dmg = 0;
    }
    
    if (jake.limites2(x, y) && jakeG()){
      bhp2 -= dmg;
      dmg = 0;
    }
    
    if (scooter.limites2(x, y) && scooterB()){
      bhp3 -= dmg;
      dmg = 0;
    }
  }

  void showShoot(){
    fill(255,255,0);
    noStroke();
    
    if (mostrarMejora == false) image(notaShoot, x, y, size*1.5, size*1.5);
    else image(notaShoot, x, y, size/1.5, size/1.5);
  }
}
