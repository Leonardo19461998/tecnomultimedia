//Alumno: Leonardo Caballero
//Comision 3
//TP#2
//Profesor: David Bedoian

int cant = 15;
int i = 0;
int originalCant;

void setup() {
  size(800, 400);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  originalCant = cant;
}

void draw() {
  background(random(30), random(30), random(30));
  blendMode(DIFFERENCE);
  
  for (int i = 0; i < cant; i++) {
    int alto = height / cant / 2;
    rotate(map(mouseX, 0, width, PI / 2, PI / 1000));
    rect(width / 2, height / 2, width / 2, i * alto);
    ellipse(width / 2, height / 2, i * alto, i * alto);
  }
  
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      resetVariables();
    }
  }
}

void resetVariables() {
  cant = originalCant;
  mouseX = 0;
}

void cicloForAnidado() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < i; j++) {
      rect(j * 20, i * 20, 15, 15);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    cant = 10;
  } else if (mouseButton == RIGHT) {
    cant = 20;
  }
}

float calcularDistancia(float x1, float y1, float x2, float y2) {
  return dist(x1, y1, x2, y2);
}

float calcularAreaCirculo(float radio) {
  return PI * radio * radio;
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    float distancia = calcularDistancia(0, 0, width / 2, height / 2);
    float area = calcularAreaCirculo(distancia);
    println("El área del círculo es: " + area);
  }
}
