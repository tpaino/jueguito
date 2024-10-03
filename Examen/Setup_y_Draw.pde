
void setup(){
  imagenes();
  minim = new Minim(this);
  john = new John(700, 400);//posición inicial del boss
  jake = new Jake(700, 400);
  scooter = new Scooter(400,400);
  size(800,800);
  strokeWeight(50);
  strokeCap(SQUARE);
  px = width/2;
  py= height/2;
  imageMode(CENTER);
  rectMode(CENTER);
  velActual = vel();
  dist1 = 70; 
  if (estaSonando != null) estaSonando.play(); //me ayudó chatGPT con la música!!
  
}
void draw(){
  frameRate(12);  
  if (comenzar == false) startGame();
  else{ //debes apretar "start" para comenzar el juego
    showRoom();
    hp = constrain(hp,0,13);
    maxHP = constrain(maxHP,12,280);
    wasd();
    
    background(era);
    showRoom();
    
    image(taylorSwift, px, py, size, size);
    hpTaylor();
    
    all2well();
    dearjohn();
    kingOfThieves();
    
    newRtl();
    newLtr();
    asesinar();
    mostrarImg();
    
    if (pausa){
      escape();
    }
    
    if (deathScreen()){
      gameOver();
    }
  }
}


//el resto de ayuda lo obtuve entre la cheat sheet que nos dieron, 
//o de la página oficial de processing (https://processing.org/reference/ArrayList.html)--> me ayudó principalmente para las listas y clases

//la ayuda que obtuve de chatGPT esta en la carpeta "ayuda chatgpt" de este mismo trabajo
