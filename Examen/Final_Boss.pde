//–––––––––––––––––––––––––––––––––SCOOTER BRAUN–––––––––––––––––––––––––––––––––

//–––––––––––––variables–––––––––––––
int bhp3 = 200; // boss 3 health points (también muy similar a los otros bosses
boolean scooterB(){
  if (roomLevel == 5 && roomNumber == 2){
    return true;
  }
  return false;
}

boolean scooterVivo(){
  if (0 < bhp3){
    return true;
  }
  return false;
}
Scooter scooter;


ArrayList <Bala> balas3 = new ArrayList<Bala>(); //lista que guardará las balas del boss 3


//–––––––––––––funciones–––––––––––––
void kingOfThieves(){ //funcion principal que junta todas las clases relacionadas a este boss
  if (scooterB() && scooterVivo()){
    if (pausa == false){
      scooter.moverScooterX();
      scooter.moverScooterY();
    }
    scooter.mostrarScooter();
    
    for (int i = balas3.size() - 1; i >= 0; i--) { //para ir mostrando y actualizando la pos de las balas
      Bala bala3 = balas3.get(i); //define la variable "bala" como el objeto número i en la lista "balas"
      if (pausa == false){
        bala3.moverBala();//mueve la bala i
      }
      bala3.showBala(); //presenta la bala 
      float limitBala = limitTriang(bala3.x, bala3.y, 50, 300, 400, 0);
      
      if (limiteFinal(bala3.x,bala3.y,0,300,50,700,size)||limiteFinal(bala3.x,bala3.y,0,700,300,800,size)||limiteFinal(bala3.x,bala3.y,750,300,800,700,size)||limiteFinal(bala3.x, bala3.y, 500,700,800,800, size)){
        balas3.remove(i);
      }
      
      if (onScreen(bala3.x, bala3.y, 15) == false || limitBala < 17.7){
        balas3.remove(i); //si sale de los limites, la bala desaparece
      }
        
      if ((px - hitbox() < bala3.x + 20) && (bala3.x - 20 < px + hitbox()) && (py - hitbox() < bala3.y + 20) && (bala3.y - 20 < py + hitbox())){
          hp -= 2;
          maxHP += 40;
          balas3.remove(i);
      }
    }
  }
  if (scooterB() && scooterVivo() == false){ //termina el juego!!
    showRep = true;
    pausa = true;
  }
    
}



class Scooter { //clase que define el movimiento y ataque del boss
  float bposX, bposY;
  float velbossX = 6;
  float velbossY = 6;
  float velbala = -9;
  int contador = 0;
  int contador1 = 0;
  int contador2 = 0;
  float reset1 = random(20, 40);
  float reset2 = random(30,40); //define cada cuanto tiempo el boss cambia de dirección
  int reset = 20; //define el intervalo de tiempo entre balas
  int multX = int(random(-2,2)); //define la dirección a la que se dirigirá el boss al cambiar de velocidad
  int multY = int(random(-2,2));
  
  boolean limites2(float x, float y){ //no chocar con boss
    if ((bposX - size*2 < x) && (x < bposX + size*2) && (bposY - size*2 < y) && (y < bposY + size*2)){
      return true;
    }
    return false;
  }
  
  Scooter(float bposX, float bposY){ //son las mismas funciones del boss1, pero hay algunos cambios en los números
    this.bposX = bposX;
    this.bposY = bposY;
  }
  
  void moverScooterX(){
    bposX += velbossX;
    if (bposX < 100 || bposX > height-100){
      velbossX *= -1;
  }
    
    contador++;
    if (contador > reset){
      disparar();
      contador = 0;
  }
  
    if (bposX > 200 && bposX < height - 200 ){
      contador1++;
      if (contador1 > reset1){
        
        if (multX == 0){
          multY = 0;
          delay(5); //se queda más tiempo pegado, así se da la oportunidad de dispararle
          multX = int(random(-2,2)); 
          multY = int(random(-2,2)); 
        }
      
        reset1 = random(20, 30);
        velbossX = random(5,8) * multX;
        contador1 = 0;
        multX = int(random(-2,2));
      }
    }
  }
  
  void moverScooterY(){
    bposY += velbossY;
    if (bposY < 400 || bposY > height - 200){
      velbossY *= -1;
  }
  
    if (bposY > 500 && bposY < height - 300 ){
      contador2++;
      if (contador2 > reset2){
        
        if (multY == 0){
          multX = 0;
        }
      
        reset2 = random(30, 40);
        velbossY = random(5,8) * multY;
        contador2 = 0;
        multY = int(random(-2,2));
      }
    }
  }
  
  void disparar(){ //son 8 balas
    balas3.add(new Bala(bposX, bposY, velbala, velbala));
    balas3.add(new Bala(bposX, bposY, velbala - 1, 0));
    balas3.add(new Bala(bposX, bposY, velbala, -velbala));
    
    balas3.add(new Bala(bposX, bposY, -velbala, -velbala));
    balas3.add(new Bala(bposX, bposY, -velbala + 1, 0));
    balas3.add(new Bala(bposX, bposY, -velbala, velbala));
    
    balas3.add(new Bala(bposX, bposY, 0,velbala - 1));
    balas3.add(new Bala(bposX, bposY, 0, -velbala + 1));
  }
  
  void mostrarScooter(){
    image(scooterBraun, bposX, bposY, size * 4, size * 4);
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(bposX - 55, bposY - 85, 110, 30);
    fill(255,0,0);
    rect(bposX - 50,bposY - 80, bhp3/2, 20);
    rectMode(CENTER);
  }}
