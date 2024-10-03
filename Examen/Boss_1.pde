//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––JOHN MEYER––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

//–––––––––––––variables–––––––––––––
int bhp1 = 50; // boss 1 health points 
boolean johnM(){ //indica si estamos en la habitacion del boss
  if (roomLevel == 2 && roomNumber == 1){
    return true;
  }
  return false;
}

boolean johnVivo(){ //indica si el boss esta vivo
  if (0 < bhp1){
    return true;
  }
  return false;
}

John john; //crea el objeto john en la clase John

ArrayList <Bala> balas1 = new ArrayList<Bala>(); //lista que guardará las balas del boss 1


//–––––––––––––funciones–––––––––––––
void dearjohn() { //funcion principal que junta todas las clases relacionadas a este boss
  if (johnM() && johnVivo()){ //debe estar en la pieza de speak now
    if (pausa == false){
      john.moverJohn();
    }
    john.mostrarJohn();
    
    for (int i = balas1.size() - 1; i >= 0; i--) { //para ir mostrando y actualizando la pos de las balas
      Bala bala1 = balas1.get(i); //define la variable "bala" como el objeto número i en la lista "balas"
      if (pausa == false){
        bala1.moverBala();//mueve la bala i
      }
      bala1.showBala(); //presenta la bala i
      
      if (onScreen(bala1.x, bala1.y, 15) == false){
        balas1.remove(i); //si sale de los limites, la bala desaparece
      }
        
      if ((px - hitbox() < bala1.x) && (bala1.x < px + hitbox()) && (py - hitbox() < bala1.y) && (bala1.y < py + hitbox())){ //si le pega al personaje, éste pierde vida
          hp -= 1;
          maxHP += 20;
          balas1.remove(i);
      }
    }
  }
    
  if (johnM() && johnVivo() == false){ //si el boss muere, se gana un album y aparece la llave del siguiente nivel. tb se regalan 3 vidas
    showSpeaknow = true;
    if (keyFearless){
      image(fearlessKey, 400, 100, size, size);
      if (limite(350,0,450,100, size)) keyFearless = false;
    }
    
    if (masHP1){
      image(masHP, 400, 700, size, size);
      if (limite(350,700,450,800, size)){
        masHP1 = false;
        hp += 3;
        maxHP -= 60;
      }
    }
  }
}




class John { //clase que define el movimiento y ataque del boss
  float bposX, bposY;
  float velboss = 12;
  float velbala = -12;
  int contador = 0;
  int contador2 = 0;
  float reset2 = random(15,30); //define cada cuanto tiempo el boss cambia de dirección
  int reset = 15; //define el intervalo de tiempo entre balas
  int mult = int(random(-2,2));
  
  boolean limites2(float x, float y){ //no chocar con boss
    if ((bposX - size < x) && (x < bposX + size) && (bposY - size < y) && (y < bposY + size)){
      return true;
    }
    return false;
  }
  
  John(float bposX, float bposY){
    this.bposX = bposX;
    this.bposY = bposY;
  }
  
  void moverJohn(){
    bposY += velboss;
    if (bposY < 100 || bposY > height-100){
      velboss *= -1;
  }
      
    contador++; //regula que las balas se vuelvan a disparar luego de un tiempo determinado
    if (contador > reset){
      disparar();
      contador = 0;
    }

    
    if (bposY > 200 && bposY < height - 200 ){
      contador2++; 
      if (contador2 > reset2){
        
        if (mult == 0){ 
        delay(1);
        mult = int(random(-2,2)); }
      
        reset2 = random(15,30);
        velboss = random(10, 15) * mult;
        contador2 = 0;
        mult = int(random(-2,2));
      }
    }//este último 'if' hace que el boss cambie de velocidad y dirección aleatoriamente para dificultar el nivel
  }
  
  void disparar(){ //suma una bala a la lista, para luego dispararla en el loop de la funcion principal
    balas1.add(new Bala(bposX, bposY, velbala, 0));
  }
  
  void mostrarJohn(){ //hace que aparezca el boss
    image(johnMayer, bposX, bposY, size * 1.5, size * 1.5);
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(bposX - 55, bposY - 85, 110, 30);
    fill(255,0,0);
    rect(bposX - 50,bposY - 80, bhp1 * 2, 20);
    rectMode(CENTER);
  }
}
  
  
