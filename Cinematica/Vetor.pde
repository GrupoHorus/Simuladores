class Vetor {
  private PVector posicao, vetor;
  private PVector magnitude;
  private boolean mostra = true;
  private char etiqueta;
  private float lugar;
  
  /*construtores--------------------------------*/
  Vetor(char etiqueta) {
    posicao = new PVector(0, 0);
    vetor = new PVector(0, 0);
    magnitude = new PVector(0, 0);
    this.etiqueta = etiqueta;
  }
  
  Vetor(float x1, float y1, float x2, float y2, char etiqueta, float lugar) {
    posicao = new PVector(x1, y1);
    vetor = new PVector(x2, y2);
    magnitude = new PVector(0, 0);
    this.etiqueta = etiqueta;
    this.lugar = lugar;
  }
  /*construtores--------------------------------*/
  
  /*gets e sets--------------------------------*/
  void setPosicaoX(float x) {
    posicao.x = x;
  }
  
  void setPosicaoY(float y) {
    posicao.y = y;
  }
  
  void setVetorX(float x) {
    vetor.x = x;
  }
  
  void setVetorY(float y) {
    vetor.y = y;
  }
  
  void setMagnitude(float n) {
    magnitude.set(vetor.x, vetor.y);
    magnitude.sub(posicao);
    magnitude.set(magnitude.x / n, magnitude.y / n);
  }
  
  PVector getMagnitude() {
    return magnitude;
  }
  /*gets e sets--------------------------------*/
  
  /*metodos--------------------------------*/
  void desenha() {
    String unidade;
    if(mostra)
    {
      stroke(255);
      strokeWeight(2);
      line(posicao.x, posicao.y, vetor.x, vetor.y);
      text(etiqueta, posicao.x - ((posicao.x - vetor.x) / 2) + 5, posicao.y - ((posicao.y - vetor.y) / 2) - 10);
      if(etiqueta == 'V')
        unidade = "m/s";
      else
        unidade = "m/s*s";
      text(etiqueta + ": " + nf(magnitude.mag(), 2, 2) + " " + unidade, 50, lugar);
      pushMatrix();
      translate(vetor.x, vetor.y);
      float a = atan2(posicao.x-vetor.x, vetor.y-posicao.y);
      rotate(a);
      line(0, 0, -10, -10);
      line(0, 0, 10, -10);
      popMatrix();
    }
  }
  
  void toggleMostra() {
    mostra = !mostra;
  }
  /*metodos--------------------------------*/
}