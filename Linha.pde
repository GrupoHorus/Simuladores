double d;
double dS;
double diferencaD;
double diferencaA;
double areaInicial;
double a = 0; // contador
double b = 0; // contador
String lFinal;
String aFinal;

class Linha extends Objeto
{
  /*construtores--------------------------------*/
  Linha() 
  {
    super();
  }

  Linha(double x, double y, double largura, double altura) 
  {
    super(x, y, altura, largura);
  }
  /*construtores--------------------------------*/

  void atualizaL()
  {
    if (a < diferencaD)
    {
      a += 0.0001;
      this.largura += a;
    } else{
      desenhar.setEnabled(true);
    clickou = false;
    this.largura = comprInicial();
    lFinal = nf((float)(this.largura+diferencaD), 4, 3);
    textSize(14);
    text("Largura Final: " + lFinal, 10, 410); 
    fill(0, 102, 153);
  }
}
void dilatarL(double coef, double temp, double comprimentoInicial)
{
  this.largura = comprimentoInicial;
  d = comprimentoInicial*(1 + coef * temp);  //largura final
  diferencaD =  d - comprimentoInicial; // variação larg
  a = 0.0;
}     


void desenha()
{
  line((float)x, (float)y, (float)altura, (float)largura);
}
}