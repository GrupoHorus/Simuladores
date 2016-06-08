ArrayList<Caixa> caixas = new ArrayList<Caixa>();
Caixa caixa;
boolean sobre = false;
boolean rodando = false;

void setup()
{
  size(600, 400);
  colorMode(HSB, 256, 256, 256);
  smooth();
}

void draw()
{
  background(0);
  for(Caixa c : caixas)
  {
    c.desenha();
    c.velocidade.desenha();
    c.aceleracao.desenha();
    if(rodando)
    {
      c.atualiza();
    }
  }
}

void mousePressed()
{
  for(Caixa c : caixas)
  {
    c.sobre();
    if(c.getSobre())
    {
      sobre = true;
      break;
    }
    else
    {
      sobre = false;
    }
  }
  if(!sobre)
  {
    if(mouseButton == LEFT)
    {
      caixa = new Caixa(mouseX, mouseY, 50, 50);
      caixas.add(caixa);
    }
  }
}

void mouseDragged()
{
    for(Caixa c : caixas)
    {
      if(c.getSobre())
      {
        if(mouseButton == LEFT)
        {
          c.setVelocidade(mouseX, mouseY);
        }
        else
        {
          c.setAceleracao(mouseX, mouseY);
        }
      }
    }
}

void mouseReleased() {
  for(Caixa c : caixas)
  {
    if(c.getSobre())
    {
      if(mouseButton == LEFT)
        c.velocidade.setMagnitude(50);
      else
      c.aceleracao.setMagnitude(1500);
    }
  }
}

void keyPressed()
{
  if(key == ' ')
  {
    rodando = !rodando;
  }
}

void mouseClicked()
{
  for(Caixa c : caixas)
  {
    if(mouseButton == RIGHT)
      {
        c.velocidade.toggleMostra();
        c.aceleracao.toggleMostra();
      }
  }
}