color seleccion1, seleccion2;

void escape(){ //detiene lo que está ocurriendo en el juego
  rectMode(CENTER);
  textAlign(CENTER);
  
  fill(0, 200);
  rect(width/2, height/2, 400, 200);
  
  if (scooterB() && scooterVivo() == false){ //ganas
    textFont(createFont("SansSerif", 100));
    fill(255);
    text("You win!", width/2, height/2);
  }
  else{
    textFont(createFont("SansSerif", 50));
    
    fill(seleccion1);
    text("Resume", width/2, 375);
    
    fill(seleccion2);
    text("Quit to title", width/2, 450);
    
    
    
    if (310 < mouseX && mouseX < 495 && 340 < mouseY && mouseY < 375){ //reanudas el juego
        cursor(HAND);
        seleccion1 = era;
        
        if (mousePressed){
          pausa = false;
        }
    }
    else if (260 < mouseX && mouseX < 535 && 415 < mouseY && mouseY < 450){ //vuelves a comenzar
        cursor(HAND);
        seleccion2 = era;
        if (mousePressed){
          comenzar = false;
          startOver();
        }
        
    }else {
      cursor(ARROW);
      seleccion1 = color(255);
      seleccion2 = color(255);
    }
  }
}
