//Alumno: Leonardo Caballero
//Legajo: 91520/2
//Profesor: David Bedoian
//Comision 3
//TP#1 Variables y Condicionales
// Obra de arte electrónico

int slide = 0;
int slideDuration = 7000; // Duración de cada diapositiva (milisegundos)
int startTime;

PImage[] images = new PImage[4];
String[] texts = new String[4];

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  textSize(24);

  images[0] = loadImage("imagen1.jpg");
  images[1] = loadImage("imagen2.jpg");
  images[2] = loadImage("imagen3.jpg");
  images[3] = loadImage("imagen4.jpg");

  texts[0] = "Mike Winkelmann: Beeple";
  texts[1] = "La pieza de arte que revolucionó el sistema se llama “Everydays: The First 5000 Days” y, efectivamente, se trata de un NFT. Es decir, una pieza digital -imagen, video, texto o código- autenticada con tecnología blockchain";
  texts[2] = "La tradicional casa de subastas Christie’s, vendió un collage digital por USD 69.3 millones.";
  texts[3] = "Presentación finalizada. Haz clic en Reiniciar para empezar de nuevo.";
}

void draw() {
  background(0);

  if (slide == 0) {
    // Pantalla de inicio con botón para iniciar la presentación
    textSize(32);
    text("Bienvenido a mí presentación", width/2, height/2);
    textSize(24);
    text("Haz clic para empezar", width/2, height/2 + 50);

    if (mousePressed && millis() - startTime > slideDuration) {
      startTime = millis();
      slide = 1;
    }
  } else if (slide >= 1 && slide <= 4) {
    // Diapositivas principales con imágenes y texto
    imageMode(CORNER);
    image(images[slide-1], 0, 0, width, height);

    float textWidth = textWidth(texts[slide-1]);
    float textX = width/2;

    // Animación del texto
    float progress = (millis() - startTime) / (float)slideDuration;
    float startX = width; // Posición inicial del texto en el borde derecho de la ventana
    float endX = -textWidth - 20; // Posición final del texto fuera de la ventana hacia la izquierda, considerando un margen de 20 píxeles
    float textOffset = map(progress, 0, 1, startX, endX);
    textX = textOffset + textWidth/2;

    // fondo blanco atras del texto
    fill(255);
    rectMode(CENTER);
    float rectWidth = textWidth + 20; // Ancho del rectángulo
    float rectHeight = 40; // Alto del rectángulo
    rect(textX, height/2, rectWidth, rectHeight);

    // texto centrado en rectangulo
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(createFont("Arial", 24));
    text(texts[slide-1], textX, height/2);

    if (millis() - startTime > slideDuration) {
      startTime = millis();
      slide++;

      // Ajuste de la duración del segundo texto de la segunda diapositiva
      if (slide == 2) {
        slideDuration = 35000; // Velocidad del texto
      }
    }

    // Boton de reinicio en la ultima imagen
    if (slide == 4) {
      imageMode(CORNER);
      image(images[3], 0, 0, width, height);

      rectMode(CENTER);
      fill(255, 0, 0);
      rect(width/2, height/2, 100, 50);

      textSize(18);
      fill(255);
      text("Reiniciar", width/2, height/2);
    }
  }
}

void mousePressed() {
  if (slide == 0) {
    startTime = millis();
    slide = 1;
  } else if (slide == 4 && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
    // Boton de reinicio
    slide = 1;
    startTime = millis();
    background(255);
  }
}
