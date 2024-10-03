//mostrar llaves
boolean keySpeaknow = true; 
boolean keyFearless = true;
boolean keyRed = true;
boolean key1989 = true;
boolean keyRep = true;



//–––––––––––––––––––––––––––––––––PRIMER PISO–––––––––––––––––––––––––––––––––
void lover(){
  if (newRoom == false) changeMusica("CruelSummer.wav");
  newRoom = true;
  
  size = 100;
  permisoRtl = true;
  permisoLtr = false;
  permisoDtu = false;
  permisoUtd = false;
  roomR(color(255, 176, 204), color(201, 91, 134), 1, 1); 
}
  
void pasillo1(){
  newRoom = true;
  
  size = 100;
  permisoRtl = true;
  permisoLtr = true;
  if (keySpeaknow == true) permisoDtu = false; //debe conseguir la llave para poder atravesar
  else permisoDtu = true;
  permisoUtd = false;
  roomC(color(165, 201, 165),color(255, 176, 204),1,2); // room(color fondo, color izquierda, color derecha, número de piso, número de habitación)
  newDtu();
  
  if (permisoDtu == false && newRoom){ //muro con candado
    fill(180, 93, 227);
    noStroke();
    rect(400,50,width,100);
    image(lock,400,50,80,80);
    if (limite(0,0,width,100,size)){
      px -= dirX * velActual;
      py -= dirY * velActual;
    }
  } 
}

void debut(){
  if (newRoom == false) changeMusica("PictureToBurn.wav");
  newRoom = true;
  
  size = 100;
  permisoRtl = false;
  permisoLtr = true;
  permisoDtu = false;
  permisoUtd = false;
  roomL(color(165, 201, 165), color(121, 166, 121),1,3);
  
  if (keySpeaknow){
    image(speakNowKey, 200, 400, size, size);
  }
  
  if (limite(150, 350, 250, 450, size)){ //te da la llave y aparece el power up
    if (keySpeaknow){
      keySpeaknow = false;
      mostrarGuitarra = true;
    }
  }
  
  if (mostrarGuitarra && keySpeaknow == false){
    image(guitarra, 700, 400, size, size);
  
  if (limite(650, 350, 750, 450, size)){ //te da el power up de disparar
    mostrarGuitarra = false;
    merica = true;
    showDebut = true;
  }
  }
}

//–––––––––––––––––––––––––––––––––SEGUNDO PISO–––––––––––––––––––––––––––––––––
void speaknow(){
  if (newRoom == false) changeMusica("Haunted.wav");
  newRoom = true;
  
  size = 100;
  if (johnM() && johnVivo() == false) permisoRtl = true;
  else permisoRtl = false;
  permisoLtr = false;
  permisoDtu = false;
  permisoUtd = false;
  roomR(color(199, 168, 203), color(148, 89, 156), 2, 1); 
}

void pasillo2(){
  newRoom = true;
  
  size = 100;
  if (keyFearless == true) permisoRtl = false;
  else permisoRtl = true;
  permisoLtr = true;
  if (keyRed == true) permisoDtu = false;
  else permisoDtu = true;
  permisoUtd = true;
  roomC(color(239, 193, 128),color(199, 168, 203),2,2);
  newUtd();
  newDtu();
  
  if (permisoRtl == false && newRoom){
    fill(239, 193, 128);
    noStroke();
    rect(50,400,100,500);
    image(lock,50,400,80,80);
    if (limite(0,150,100,650,size)){
      px -= dirX * velActual;
      py -= dirY * velActual;
    }
  }
  
  if (permisoDtu == false && newRoom){
    fill(207, 89, 106);
    noStroke();
    rect(400,50,width,100);
    image(lock,400,50,80,80);
    if (limite(0,0,width,100,size)){
      px -= dirX * velActual;
      py -= dirY * velActual;
    }
  } 
}

void fearless(){
  if (newRoom == false) changeMusica("Fearless.wav");
  newRoom = true;
  
  size = 100;
  permisoRtl = false;
  permisoLtr = true;
  permisoDtu = false;
  permisoUtd = false;
  
  roomL(color(239, 193, 128), color(189, 141, 74),2,3);
  
  if (keyRed){
    image(redKey, 200, 400, size, size);
  }
  
  if (limite(150, 350, 250, 450, size)){ //te da el power up de disparar
    if (keyRed){
      keyRed = false;
      mostrarBotas = true;
    }
  }
  
  if (mostrarBotas && keyRed == false){
    image(botas, 700, 400, size, size);
  
  if (limite(650, 350, 750, 450, size)){ //te da el power up de disparar
    mostrarBotas = false;
    quick = true;
    showFearless = true;
  }
  }
}

//–––––––––––––––––––––––––––––––––TERCER PISO–––––––––––––––––––––––––––––––––

void redts(){
  if (newRoom == false) changeMusica("AllTooWell.wav");
  newRoom = true;
  
  size = 100;
  if (jakeG() && jakeVivo() == false) permisoRtl = true;
  else permisoRtl = false;
  permisoLtr = false;
  permisoDtu = false;
  permisoUtd = false;
  roomR(color(207, 89, 106), color(122, 46, 57), 3, 1); 
}

void pasillo3(){
  newRoom = true;
  
  size = 100;
  
  if (key1989 == true) permisoRtl = false;
  else permisoRtl = true;
  
  permisoLtr = true;
  
  if (keyRep == true) permisoDtu = false;
  else permisoDtu = true;
  
  permisoUtd = true;
  roomC(color(181, 229, 248),color(207, 89, 106),3,2);
  newUtd();
  newDtu();
  
  if (permisoRtl == false && newRoom){
    fill(181, 229, 248);
    noStroke();
    rect(50,400,100,500);
    image(lock,50,400,80,80);
    if (limite(0,150,100,650,size)){
      px -= dirX * velActual;
      py -= dirY * velActual;
    }
  }
  
  if (permisoDtu == false && newRoom){
    fill(0);
    noStroke();
    rect(400,50,width,100);
    image(lock,400,50,80,80);
    if (limite(0,0,width,100,size)){
      px -= dirX * velActual;
      py -= dirY * velActual;
    }
  } 
  
}

void n1989(){
  if (newRoom == false) changeMusica("BadBlood.wav");
  newRoom = true;
  
  size = 100;
  permisoRtl = false;
  permisoLtr = true;
  permisoDtu = false;
  permisoUtd = false;
  roomL(color(181, 229, 248), color(106, 163, 186),3,3);
  
  if (keyRep){
    image(repKey, 200, 400, size, size);
  }
  
  if (limite(150, 350, 250, 450, size)){ //te da el power up de mejora
    if (keyRep){
      keyRep = false;
      mostrarMejora = true;
    }
  }
  
  if (mostrarMejora && keyRep == false){
    image(mejora, 700, 400, size, size);
  
  if (limite(650, 350, 750, 450, size) ){ //te da el power up de mejora
    mostrarMejora = false;
    notaShoot = mejora;
    damage = 10;
    show1989 = true;
    velShoot = 25;
    }
  }
}

//–––––––––––––––––––––––––––––––––CUARTO PISO–––––––––––––––––––––––––––––––––

void pasillo4(){
  newRoom = true;
  
  size = 100;
  permisoRtl = false;
  permisoLtr = false;
  permisoDtu = true;
  permisoUtd = true;
  roomC1(color(255),4,2);
  noStroke();
  fill(0);
  rect(400,200,800,400);
  stroke(255);
  line(300,0,500,0); 
  
  newUtd();
  
  if (300 < px && px < 500) newDtu();
  
}

//–––––––––––––––––––––––––––––––––QUINTO PISO–––––––––––––––––––––––––––––––––

void reputation(){
  if (newRoom == false) changeMusica("ReadyForIt.wav");
  newRoom = true;
  
  size = 40;

  permisoRtl = false;
  permisoLtr = false;
  permisoDtu = false;
  if (scooterB() && scooterVivo() == false) permisoUtd = true;
  else permisoUtd = false;

  
  roomC1(color(0),5,2);
  noStroke();
  fill(6, 0, 89);
  rect(400,400,width,height);
  rectMode(CORNER);
  fill(93, 118, 128);
  rect(50,700,300,100);
  fill(99, 43, 51);
  rect(450,700,300,100);
  rectMode(CENTER);
  
  
  fill(0);
  triangle(50,300,400,0,750,300);
  rect(400,500,700,400);
  rect(400,750,200,100);
  
  float distTriang1 = limitTriang(px, py, 50, 300, 400, 0);
  float distTriang2 = limitTriang(px, py, 400, 0, 750, 300);
  
  newUtd();
  
  if (limite(0, 300, 50, 700, size) || limite(0,700,300,800, size) || limite(750, 300, 800, 700, size) || limite(500,700,800,800, size)) px -= dirX * velActual;
  if (limite(0, 700, 300, 800, size) || limite(500,700,800,800, size)) py -= dirY * velActual;
  if (distTriang1 < 17.7 || distTriang2 < 17.7){
    px -= dirX * velActual;
    py -= dirY * velActual;
  }
}
    
  
