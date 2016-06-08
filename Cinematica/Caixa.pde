class Caixa extends Objeto
{
  private boolean sobre;
  Vetor velocidade;
  Vetor aceleracao;
  PVector magnitudeVelocidade = new PVector();
  PVector magnitudeAceleracao = new PVector();

  /*construtores--------------------------------*/
  Caixa() {
    velocidade = new Vetor(x + getCentroX(), y + getCentroY(), x + getCentroX(), y + getCentroY(), 'V', 50);
    aceleracao = new Vetor(x + getCentroX(), y + getCentroY(), x + getCentroX(), y + getCentroY(), 'A', 100);
  }

  Caixa(int x, int y, int largura, int altura) {
    super(x, y, largura, altura);
    velocidade = new Vetor(x + getCentroX(), y + getCentroY(), x + getCentroX(), y + getCentroY(), 'V', 50);
    aceleracao = new Vetor(x + getCentroX(), y + getCentroY(), x + getCentroX(), y + getCentroY(), 'A', 100);
  }
  /*construtores--------------------------------*/

  /*metodos--------------------------------*/
  void desenha() {
    strokeWeight(1);
    rect(x, y, largura, altura);
  }
  
  void atualiza() {
    magnitudeVelocidade = velocidade.getMagnitude();
    magnitudeAceleracao = aceleracao.getMagnitude();
    
    velocidade.posicao.set(x + getCentroX(), y + getCentroY());
    velocidade.setVetorX(velocidade.vetor.x + magnitudeVelocidade.x + magnitudeAceleracao.x * 15);
    velocidade.setVetorY(velocidade.vetor.y + magnitudeVelocidade.y + magnitudeAceleracao.y * 15);
    
    aceleracao.posicao.set(x + getCentroX(), y + getCentroY());
    aceleracao.setVetorX(aceleracao.vetor.x + magnitudeVelocidade.x);
    aceleracao.setVetorY(aceleracao.vetor.y + magnitudeVelocidade.y + 1);
    
    magnitudeAceleracao.y += 0.001;
    
    magnitudeVelocidade.add(magnitudeAceleracao);
    
    setX(x += magnitudeVelocidade.x);
    setY(y += magnitudeVelocidade.y);
  }

  void setVelocidade(float x, float y) {
    velocidade.setPosicaoX(this.x + getCentroX());
    velocidade.setPosicaoY(this.y + getCentroY());
    velocidade.setVetorX(x);
    velocidade.setVetorY(y);
  }
  
  void setAceleracao(float x, float y) {
    aceleracao.setPosicaoX(this.x + getCentroX());
    aceleracao.setPosicaoY(this.y + getCentroY());
    aceleracao.setVetorX(x);
    aceleracao.setVetorY(y);
  }
  
  void sobre() {
    if((mouseX >= this.x && mouseX <= this.x + largura) && (mouseY >= this.y && mouseY <= this.y + altura))
      sobre = true;
    else
      sobre = false;
  }
  
  boolean getSobre() {
    return sobre;
  }
  /*metodos--------------------------------*/
}