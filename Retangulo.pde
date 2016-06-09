double areaAtual = 0;
double bas = 0;
double alt = 0;
double cont = 0;
class Retangulo extends Objeto
{
  /*construtores--------------------------------*/
  Retangulo() 
  {
    super();
  }

  Retangulo(double x, double y, double largura, double altura) 
  {
    super(x, y, largura, altura);
  }
  /*construtores--------------------------------*/
  void desenha() {
    fill(0);
    rect((float)x, (float)y, (float)largura, (float)altura);
  }

  void atualizaL() {
    if (cont < diferencaA)
    {
      cont += 0.1;

      this.largura += cont;
      this.altura += cont;
    } else
    {
      desenhar.setEnabled(true);
      clickou = false;   
      textSize(14);
      text("Area Final: " + nf((float)(dS)), 10, 410); 
      fill(0, 102, 153);
    }
  }
  void dilatarS(double coef, double temp, double baseInicial, double comprimentoInicial)
  {
    bas = baseInicial;
    alt = comprimentoInicial;
    dS = (comprimentoInicial*baseInicial)*(1 + coef * temp);  //area final
    diferencaA =  dS - (baseInicial * comprimentoInicial); // variação area
    cont = 0.0;
  }
}