void newRtl(){ //permiten cambiar de habitaciones
  float npx = px;
  float npy = py;
  if (openRtl(npx,npy)){
    px = width - dist1;
    roomNumber += 1;
    newRoom = false;
  }
}



void newLtr(){
  float npx = px;
  float npy = py;
  if (openLtr(npx,npy)){
    px = dist1;
    roomNumber -= 1;
    newRoom = false;
  }
}

void newDtu(){
  float npy = py;
  if (openDtu(npy)){
    roomLevel += 1;
    py = height - (dist1);
    newRoom = false;
    if (roomLevel == 5) velActual = vel();
  }
}

void newUtd(){
  float npy = py;
  if (openUtd(npy)){
    roomLevel -= 1;
    py = dist1;
    newRoom = false;
    if (roomLevel == 4) velActual = vel();
  }
}
