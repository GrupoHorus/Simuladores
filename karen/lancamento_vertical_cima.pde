Movimento mov;

void setup() {
  mov = new Movimento(80);
  size(400, 400);
  background(0);
  noStroke();
  frameRate(60);
}

void draw() {
    mov.limpa();
    mov.equacao();
}