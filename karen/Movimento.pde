class Movimento extends Vetores {
  
  boolean descendo = false;
  
  //vetores //<>//
  double gravidade = Constantes.g; //<>//
  double velocidade;
  double proporcao;
  

  Ball bola = new Ball(20, 20); //largura, altura

  Movimento(double vel) {
    bola.setcor(color(255));
    setVelocidade(vel);
    bola.setX(200);
    
  }
  
  void setVelocidade(double vel){
    if(vel>=0)
      velocidade = vel;
      else
      velocidade = 0;
      
  }

  void equacao() {
    println(velocidade);
    if (velocidade<=0)
      descendo = true;
      
    if (!descendo) {
      velocidade--;
    } else
    {
      velocidade++;
      if(bola.getY()>=height-bola.getAltura()/2)
      noLoop();
    }
    bola.setY(velocidade*velocidade/(2*gravidade) +50);
    bola.atualiza();
  }
  void limpa() {
    background(0);
  }
}