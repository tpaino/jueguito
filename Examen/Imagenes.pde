PImage disco;
PImage brokenH;
PImage mejora;

PImage n;
PImage nKey;
PImage nTVCover;

PImage botas;

PImage fearlessC;
PImage fearlessKey;
PImage fearlessTVC;

PImage guitarra;

PImage jakeGyllenhaal;

PImage johnMayer;

PImage loverC;

PImage masHP;

PImage notaShoot;

PImage piso, redC, redKey, redTVC, repKey, repC, taylorSwift, scooterBraun, speakNowC, speakNowKey, speakNowTVC, debutC, lock;


void imagenes(){
  lock = loadImage("lock.png");
  disco = loadImage("disco.png");
  brokenH = loadImage("brokenH.png");
  mejora = loadImage("notaMega.png");
  
  nKey = loadImage("1989Key.png");
  nTVCover = loadImage("1989TV.png");
  
  botas = loadImage("botas.png");
  
  fearlessKey = loadImage("fearlessKey.png");
  fearlessTVC = loadImage("FearlessTV.png");
  
  guitarra = loadImage("guitarra.png");
  
  jakeGyllenhaal = loadImage("jakeGyllenhaal.png");
  
  johnMayer = loadImage("johnMayer.png");
  
  loverC = loadImage("Lover.png");
  
  masHP = loadImage("masHP.png");
  
  notaShoot = loadImage("notaShoot.png");
  
  piso = loadImage("piso.png");
  
  redKey = loadImage("redKey.png");
  redTVC = loadImage("RedTV.png");
  
  repKey = loadImage("repKey.png");
  repC = loadImage("Reputation.png");
  
  taylorSwift = loadImage("rusia.png");
  
  scooterBraun = loadImage("scooterBraun.png");
  
  speakNowKey = loadImage("speaknowKey.png");
  speakNowTVC = loadImage("SpeakNowTV.png");
  
  debutC = loadImage("TaylorSwift.png");
}

boolean showDebut = false;
boolean showSpeaknow = false;
boolean showFearless = false;
boolean showRed = false;
boolean show1989 = false;
boolean showRep = false;

void mostrarImg(){
  imageMode(CORNER);
  if (showDebut) image(debutC,10,height - 90, 80, 80);
  if (showSpeaknow) image(speakNowTVC,100,height - 90, 80, 80);
  if (showFearless) image(fearlessTVC,190,height - 90, 80, 80);
  if (showRed) image(redTVC,width - 90,height - 90, 80, 80);
  if (show1989) image(nTVCover,width - 180,height - 90, 80, 80);
  if (showRep) image(repC,width - 270,height - 90, 80, 80);
  imageMode(CENTER);
}



  
