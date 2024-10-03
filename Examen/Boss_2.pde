//–––––––––––––––––––––––––––––––––JAKE GYLLENHAAL–––––––––––––––––––––––––––––––––

//–––––––––––––variables–––––––––––––
int bhp2 = 100; // boss 2 health points (en general es todo muy similar al boss 1)
boolean jakeG(){
  if (roomLevel == 3 && roomNumber == 1){
    return true;
  }
  return false;
}

boolean jakeVivo(){
  if (0 < bhp2){
    return true;
  }
  return false;
}
Jake jake;

ArrayList <Bala> balas2 = new ArrayList<Bala>(); //lista que guardará las balas del boss 2


//–––––––––––––funciones–––––––––––––
void all2well() { //funcion principal que junta todas las clases relacionadas a este boss
  if (jakeG() && jakeVivo()){
    if (pausa == false){
      jake.moverJake();
    }
    jake.mostrarJake();
    
    for (int i = balas2.size() - 1; i >= 0; i--) { //para ir mostrando y actualizando la pos de las balas
      Bala bala2 = balas2.get(i); //define la variable "bala" como el objeto número i en la lista "balas"
      if (pausa == false){
        bala2.moverBala();//mueve la bala i
      }
      bala2.showBala(); //presenta la bala i
      
      if (onScreen(bala2.x, bala2.y, 15) == false){
        balas2.remove(i); //si sale de los limites, la bala desaparece
        }
        
      if ((px - hitbox() < bala2.x) && (bala2.x < px + hitbox()) && (py - hitbox() < bala2.y) && (bala2.y < py + hitbox())){
          hp -= 1;
          maxHP += 20;
          balas2.remove(i);
      }
    }
  }
  
  if (jakeG() && jakeVivo() == false){
    showRed = true;
    if (key1989){
      image(nKey, 400, 100, size, size);
      if (limite(350,0,450,100, size)) key1989 = false;
    }
    
    if (masHP2){
      image(masHP, 400, 700, size, size);
      if (limite(350,700,450,800, size)){
        masHP2 = false;
        hp += 3;
        maxHP -= 60;
      }
    }
  }
}



class Jake { //clase que define el movimiento y ataque del boss
  float bposX, bposY;
  float velboss = 12;
  float velbala = -15;
  int contador = 0;
  int contador2 = 0;
  float reset2 = random(15,30); //define cada cuanto tiempo el boss cambia de dirección
  int reset = 10; //define el intervalo de tiempo entre balas
  int mult = int(random(-2,2)); //define la dirección a la que se dirigirá el boss al cambiar de velocidad
  
  boolean limites2(float x, float y){ //no chocar con boss
    if ((bposX - size < x) && (x < bposX + size) && (bposY - size < y) && (y < bposY + size)){
      return true;
    }
    return false;
  }
  
  Jake(float bposX, float bposY){ //son las mismas funciones del boss1, pero hay algunos cambios en los números
    this.bposX = bposX;
    this.bposY = bposY;
  }
  
  void moverJake(){
    bposY += velboss;
    if (bposY < 100 || bposY > height-100){
      velboss *= -1;
  }
    
    contador++;
    if (contador > reset){
      disparar();
      contador = 0;
  }
  
    if (bposY > 200 && bposY < height - 200 ){
      contador2++;
      if (contador2 > reset2){
        
        if (mult == 0){ 
        delay(5); //se queda más tiempo pegado, así se da la oportunidad de dispararle
        mult = int(random(-2,2)); }
      
        reset2 = random(15, 30);
        velboss = random(10,15) * mult;
        contador2 = 0;
        mult = int(random(-2,2));
      }
    }
  }
  
  void disparar(){ //son 3 balas en vez de 1
    balas2.add(new Bala(bposX, bposY, velbala, velbala));
    balas2.add(new Bala(bposX, bposY, velbala - 2, 0));
    balas2.add(new Bala(bposX, bposY, velbala, -velbala));
  }
  
  void mostrarJake(){
    image(jakeGyllenhaal, bposX, bposY, size * 1.5, size * 1.5);
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(bposX - 55, bposY - 85, 110, 30);
    fill(255,0,0);
    rect(bposX - 50,bposY - 80, bhp2, 20);
    rectMode(CENTER);
  }
}
