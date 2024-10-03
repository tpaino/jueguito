import ddf.minim.*;
Minim minim;
AudioPlayer estaSonando; 



//–––––––––––––––––––––––––––––––––START–––––––––––––––––––––––––––––––––
PImage start;

boolean comenzar = false;

//en que habitacion empezamos
int roomLevel = 1;
int roomNumber = 1;

//disparar
boolean merica = false;

//correr
boolean quick = false;

color colorStart;

//carátula principal
void startGame(){
  start = loadImage("start.png");
  if (comenzar == false){
    if (newRoom == false) changeMusica("YouBelongWithMe.wav"); //musica con la que parte, al comenzar el juego cambia
    newRoom = true;
    image(start,400,400,800,800);
    textAlign(CENTER);
    
    textFont(createFont("SERIF", 50));
    
    fill(colorStart);
    text("START", width/2, 730);
    
    //hacer clic para comenzar
    if (310 < mouseX && mouseX < 495 && 690 < mouseY && mouseY < 740){
        colorStart = color(188,0,0);
        cursor(HAND);
        
        if (mousePressed){
          pausa = false;
          comenzar = true;
          newRoom = false;
        }
    } else{
      cursor(ARROW);
      colorStart = color(0);
    }
  }
}
    
boolean deathScreen() { //indica cuando perdiste
  if (hp <= 0){
    return true;
  } return false;
}
  
boolean pausa = true; //cuando le pones pausa

void changeMusica(String newTrackName) {
  if (estaSonando != null) {
    estaSonando.close(); // para lo que esta sonando
  }
  
  estaSonando = minim.loadFile(newTrackName); // pone una pista nueva
  
  if (estaSonando != null){
    estaSonando.loop(); // suena en loop
  }
}

//–––––––––––––––––––––––––––––––––CASA–––––––––––––––––––––––––––––––––
color era;
boolean onScreen(float x, float y, float z){ //indica si un objeto esta en pantalla
 return z/2 < x && x < width - z/2 && z/2 < y && y < height - z/2;
}

boolean mostrarBotas = true; 
boolean mostrarGuitarra = true;
boolean mostrarMejora = true;

boolean masHP1 = true; //se puede recuperar vida matando a los bosses!!
boolean masHP2 = true;
 
 
 //–––––––––––––––––––––––––––––––––CAMBIO DE HABITACIÓN–––––––––––––––––––––––––––––––––
 
boolean permisoRtl, permisoLtr, permisoDtu, permisoUtd; //permisos para cambiar de habitación, se habilitan a medida que se avanza en el juego

boolean newRoom = false;

boolean openRtl(float x, float y){ //Rtl = right to left, es true cuando el personaje toca las puertas
if (permisoRtl){
if ((300 < y) && (y < 500) && (x < dist1)){ //si pongo dist1 = 60, se cambia solo una vez, NO HACER
  return true; }}
return false; }

boolean openLtr(float x, float y){ // Ltr = left to right
if (permisoLtr){
if ((300 < y) && (y < 500) && (width - dist1 < x)){ 
  return true; }}
return false; }

boolean openDtu(float y){ //Dtu = down to up
if (permisoDtu){
if (y < dist1){ 
  return true; }}
return false; }

boolean openUtd(float y){ //Utd = up to down
if (permisoUtd){
if (height - dist1 < y){ 
  return true; }}
return false; }

//–––––––––––––––––––––––––––––––––PERSONAJE–––––––––––––––––––––––––––––––––

float px, py, size;
int vel() {
  if (roomLevel == 5) { //cuando este en la ultima habitación, su vel cambia
    return 10;
  } else {
    return 30;
  }
}
int velActual;

float dist1;
int hp = 13; //health points
int maxHP = 12;



int hitbox(){ //pierdes vida si se realiza un ataque en este radio
  if (roomLevel == 5) {
    return 15;
  } else return 60;
}



int velShoot = 35;
int damage = 5;
boolean disparando = false;

void hpTaylor(){ //indicador visual de la vida restante
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(width - 280, 10, 270, 32);
  
  for (int i = width - 272; i < width - maxHP; i += 20){
    fill(240, 137, 193);
    rect(i, 15, 15, 22);
  }
  rectMode(CENTER);
}

  




//–––––––––––––––––––––––––––––––––MOVIMIENTO–––––––––––––––––––––––––––––––––

boolean w, a, s, d; 
boolean shift, space;

boolean limite(float x1, float y1, float x2, float y2, float tamano){ //toda interacción de taylor con un objeto fijo se puede regular con esta variable-función
  float x11 = x1 - tamano/2;
  float y11 = y1 - tamano/2;
  float x22 = x2 + tamano/2;
  float y22 = y2 + tamano/2;
  return (x11 < px && px < x22 && y11 < py && py < y22);
}
//limite(posObjetoX1,posObjetoY1,posObjetoX2,posObjetoY2, tamano personaje)

boolean limiteFinal(float px, float py, float x1, float y1, float x2, float y2, float tamano){ //toda interacción de objeto1 con objeto2 fijo se puede regular con esta variable-función
  float x11 = x1 - tamano/2;
  float y11 = y1 - tamano/2;
  float x22 = x2 + tamano/2;
  float y22 = y2 + tamano/2;
  return (x11 < px && px < x22 && y11 < py && py < y22);
}

//–––––––––––––––––––––––––––––––––BALAS BOSSES–––––––––––––––––––––––––––––––––
  
class Bala { //esta clase crea una bala para los bosses, que después se podrá almacenar en una lista para así dispararla en un momento y espacio específico
  float x, y;
  float vx, vy;
  
  Bala(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  
  void moverBala(){
    x += vx;
    y += vy;
  }

  void showBala(){
    if (johnM() || jakeG()) image(brokenH, x, y, size/1.5,size/1.5); //estos disparan corazones rotos
    else if (scooterB()) image(disco, x, y, size * 2, size * 2); //él dispara CDs
  }
}
