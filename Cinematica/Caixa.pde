class Caixa extends Objeto
{
  /*construtores--------------------------------*/
  Caixa() {
    super();
  }

  Caixa(int x, int y, int largura, int altura) {
    super(x, y, altura, largura);
  }
  /*construtores--------------------------------*/

  void desenha()
  {
    rect((float)x, (float)y, (float)altura, (float)largura);
  }
}