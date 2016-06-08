abstract class Objeto
{
  float x, y, largura, altura;

  /*gets e sets--------------------------------*/
  void setX(float x) {    
    this.x = x;
  }

  float getX() {
    return x;
  }
  
  float getCentroX() {
    return largura / 2;
  }

  void setY(float y) {
    this.y = y;
  }

  float getY() {
    return y;
  }
  
  float getCentroY() {
    return altura / 2;
  }

  void setAltura(float altura) {
    this.altura = altura;
  }

  float getAltura() {
    return altura;
  }

  void setLargura(float largura) {
    this.largura = largura;
  }

  float getLargura() {
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

  Objeto(float x, float y) {
    this.x = x;
    this.y = y;
    largura = 60;
    altura = 10;
    desenha();
  }

  Objeto(float x, float y, float largura, float altura) {
    this.x = x;
    this.y = y;
    this.largura = largura;
    this.altura = altura;
    desenha();
  }
  /*construtores--------------------------------*/

  /*metodos--------------------------------*/
  abstract void desenha();
  abstract void atualiza();
  /*metodos--------------------------------*/
}