abstract class Objeto
{
  double x, y, largura, altura;

  /*gets e sets--------------------------------*/
  void setX(double x) {    
    this.x = x;
  }

  double getX() {
    return x;
  }

  void setY(double y) {
    this.y = y;
  }

  double getY() {
    return y;
  }

  void setAltura(double altura) {
    this.altura = altura;
  }

  double getAltura() {
    return altura;
  }

  void setLargura(double largura) {
    this.largura = largura;
  }

  double getLargura() {
    return largura;
  }
  /*gets e sets--------------------------------*/

  /*construtores--------------------------------*/
  Objeto() {
    x = 0;
    y = 0;
    largura = 60;
    altura = 10;
    desenha();
  }

  Objeto(double x, double y) {
    this.x = x;
    this.y = y;
    largura = 60;
    altura = 10;
    desenha();
  }

  Objeto(double x, double y, double largura, double altura) {
    this.x = x;
    this.y = y;
    this.largura = largura;
    this.altura = altura;
    desenha();
  }
  /*construtores--------------------------------*/

  abstract void desenha();
}