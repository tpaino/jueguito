color select;

void gameOver(){
  
  pausa = false;
  
  //todo lo que es lo visual
  rectMode(CORNER);
  fill(0);
  rect(0, 0, width, height);
  rectMode(CENTER);
  fill(255);
  rect(width/2, 590, 250, 100);
  fill(0);
  rect(width/2, 590, 240, 90);
  textAlign(CENTER);
  fill(255);
  textFont(createFont("Serif", 100));
  text("GAME", width/2, 300);
  fill(select);
  textFont(createFont("SansSerif", 40));
  text("RESTART", width/2, 605);
  fill(255,0,0);
  textFont(createFont("Serif", 200));
  text("OVER", width/2, 460);
  
  if (280 < mouseX && mouseX < 520 && 545 < mouseY && mouseY < 635){ //lo interactivo
    cursor(HAND);
    select = color(255,0,0);
    if (mousePressed){
    startOver();
    setup();
    }
  }else {
  cursor(ARROW);
  select = color(255);
  }
}
  
  
void startOver(){ //resetea el juego
  imagenes();
  cursor(ARROW);
  
  px = width/2;
  py= height/2;

  roomLevel = 1;
  roomNumber = 1;
  
  pausa = true;
  
  mostrarBotas = true; 
  mostrarGuitarra = true;
  mostrarMejora = true;
  
  
  merica = false;
  
  quick = false;
  
  masHP1 = true;
  masHP2 = true;
  newRoom = false;
  hp = 13; //health points
  maxHP = 12;
  
  velShoot = 35;
  damage = 5;
  disparando = false;
  
  lastShoot = 0; //último disparo
  newShoot = 200; //milisegundos entre disparos
  
  bhp1 = 50;
  bhp2 = 100;
  bhp3 = 200;
  
  keySpeaknow = true; 
  keyFearless = true;
  keyRed = true;
  key1989 = true;
  keyRep = true;
  
  showDebut = false;
  showSpeaknow = false;
  showFearless = false;
  showRed = false;
  show1989 = false;
  showRep = false;
}
