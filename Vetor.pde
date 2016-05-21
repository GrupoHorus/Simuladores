class Vetor extends PVector {
  
  /*construtores--------------------------------*/
  Vetor() {
    super();
  }
  
  Vetor(float x, float y) {
    super(x, y);
  }
  /*construtores--------------------------------*/
  
  /*gets e sets--------------------------------*/
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  /*gets e sets--------------------------------*/
  
  /*metodos--------------------------------*/
  void desenha(PVector posicao) {
    strokeWeight(3);
    line(posicao.x, posicao.y, this.x, this.y);
  }
  /*metodos--------------------------------*/
}