class Ball extends Objeto{
  float largura;
  float altura;
  color c;
  int transp;


  Ball(float l, float a) {
    super(0,0,l,a);
  }

  void setcor(color cor) {
    c = cor;
  }

  color getcor() {
    return c;
  }
  void desenha() {
    fill(getcor());
    translate((float)getX(), (float)getY()); //exige parametros float
    ellipse(0, 0, (float)getLargura(), (float)getAltura());
  }
  
  void atualiza(){
    desenha();
  }
}