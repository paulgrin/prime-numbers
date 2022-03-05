//zoom kontrole

Camera2D camera = new Camera2D();

//prime ir sudetiniai taskai

Point[] points;
int numPoints;

//kintamieji valdikliai

boolean showPrimes = true;
boolean showComposites = true;
int DESIRED_AMOUNT = 1400;  //norimu pirminiu ir sudetiniu tasku kiekis [maksimalus 1400]

void setup() {
  size(1400, 900);
  background(0);
  //uzkraunam skaicius
  String[] primeNums = loadStrings("prime numbers.txt");
  String[] compositeNums = loadStrings("composite numbers.txt");

  //patikrinam ribas, sleksčius
  
  if ((primeNums.length - DESIRED_AMOUNT) < 0 ||( compositeNums.length - DESIRED_AMOUNT) < 0) {
    println("Norimas kiekis virsija galimu skaiciu ribas. (Max kiekis yra 1400)");
    exit();
  }
  //inicijuojam taškus
  
  points = new Point[(DESIRED_AMOUNT*2)];

  //priskirime spinduli ir poline kordinate su tuo patčiu prime skaiciu ar sudetiniu skaičiu
  //inicijuojam pirminius skaicius 
  
  for (int i = 0; i < DESIRED_AMOUNT; i++)
    points[i] = new Point(float(primeNums[i]), float(primeNums[i]), true);
  //tinicijuojam sudetinius skaicius
  for (int i = 0; i < DESIRED_AMOUNT; i++)
    points[i + DESIRED_AMOUNT] = new Point(float(compositeNums[i]), float(compositeNums[i]), false);
}

void draw() {
  background(0);
  //atnaujinam kamera
  camera.update();

  //atvaizduojam taskus
  
  for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
    pushMatrix();
    //translate i ekrano centra, kad butu rodomi taskai
    translate(width/2, height/2);
    if ((showPrimes && points[i].isPrime) || (showComposites && !points[i].isPrime))
      points[i].display();
    popMatrix();
  }
}

void keyPressed() {
  if (keyCode == '1')
    showPrimes = !showPrimes;
  else if (keyCode == '2')
    showComposites = !showComposites;
  else if(keyCode == '3'){
     for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
       points[i].w -= 1;
     }
  }
  else if(keyCode == '4'){
     for (int i = 0; i < (DESIRED_AMOUNT*2); i++) {
       points[i].w += 1;
     }
  }
}
