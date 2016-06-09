import g4p_controls.*;

GTextField textfield_VariacaoTemperatura; 
GLabel label1; 
GDropList dropList_Material; 
GButton desenhar;
GTextField textfield_ComprimentoInicial; 
GLabel label2;
GLabel label3;
GOption radioL;
GOption radioS;
GOption radioV;
GToggleGroup group;
GLabel label4;
GTextField textfield_BaseInicial; 
GLabel label5;
GTextField textfield_ProfundidadeInicial; 

Linha l;
Retangulo r;

double coef = 0;
int variac = 0;
int cInicial = 0;
int bInicial = 0;
int pInicial = 0;
boolean clickou = false;
//dilatação volumetrica
double volume;

public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  //lista
  dropList_Material = new GDropList(this, 20, 350, 90, 80, 3);
  dropList_Material.setItems(loadStrings("list_917885"), 0);
  dropList_Material.addEventHandler(this, "dropList1_click1");
  //campo text v
  textfield_VariacaoTemperatura = new GTextField(this, 20, 160, 160, 20, G4P.SCROLLBARS_NONE);
  textfield_VariacaoTemperatura.setText("");
  textfield_VariacaoTemperatura.setOpaque(true);
  textfield_VariacaoTemperatura.addEventHandler(this, "textfield1_change1");
  //label1
  label1 = new GLabel(this, 20, 140, 200, 20);
  label1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label1.setText("Variação Temperatura:");
  label1.setOpaque(false);
  //botao
  desenhar = new GButton(this, 55, 470, 100, 20);
  desenhar.setText("Desenhar");
  desenhar.addEventHandler(this, "click");
  //label2
  label2 = new GLabel(this, 20, 190, 200, 20);
  label2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label2.setText("Comprimento Inicial:");
  label2.setOpaque(false);
  //campo text c
  textfield_ComprimentoInicial = new GTextField(this, 20, 210, 160, 20, G4P.SCROLLBARS_NONE);
  textfield_ComprimentoInicial.setText("");
  textfield_ComprimentoInicial.setOpaque(true);
  textfield_ComprimentoInicial.addEventHandler(this, "textfield_ComprimentoInicial");
  //radio button linear
  radioL = new GOption(this, 40, 50, 200, 30);
  radioL.setText("Linear");
  //radioL.setSelected(true);
  radioL.addEventHandler(this, "button1_click1");
  //radio button superficial
  radioS = new GOption(this, 40, 80, 200, 30);
  radioS.setText("Superficial");
  radioS.addEventHandler(this, "button1_click1");
  //radio button volumétrica
  radioV = new GOption(this, 40, 110, 200, 30);
  radioV.setText("Volumétrica");
  radioV.addEventHandler(this, "button1_click1");
  //label3
  label3 = new GLabel(this, 20, 30, 200, 20);
  label3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label3.setText("Dilatação:");
  label3.setOpaque(false);
  //group button
  group = new GToggleGroup();
  group.addControl(radioL);
  group.addControl(radioS);
  group.addControl(radioV);
  //label4
  label4 = new GLabel(this, 20, 240, 200, 20);
  label4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label4.setText("Base Inicial:");
  label4.setOpaque(false);
  //campo text base
  textfield_BaseInicial = new GTextField(this, 20, 260, 160, 20, G4P.SCROLLBARS_NONE);
  textfield_BaseInicial.setText("");
  textfield_BaseInicial.setOpaque(true);
  textfield_BaseInicial.addEventHandler(this, "textfield_BaseInicial");
  //label5
  label5 = new GLabel(this, 20, 290, 200, 20);
  label5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label5.setText("Profundidade Inicial:");
  label5.setOpaque(false);
  //campo text base
  textfield_ProfundidadeInicial = new GTextField(this, 20, 310, 160, 20, G4P.SCROLLBARS_NONE);
  textfield_ProfundidadeInicial.setText("");
  textfield_ProfundidadeInicial.setOpaque(true);
  textfield_ProfundidadeInicial.addEventHandler(this, "textfield_ProfundidadeInicial");
}


// evento lista - coeficiente
public double coeficiente() {
  if (dropList_Material.getSelectedText().equals("Chumbo"))return Constantes.apb;
  else if (dropList_Material.getSelectedText().equals("Alumínio"))return Constantes.aal;
  else if (dropList_Material.getSelectedText().equals("Prata"))return Constantes.aag;
  else if (dropList_Material.getSelectedText().equals("Cobre"))return Constantes.acu;
  else if (dropList_Material.getSelectedText().equals("Ferro"))return Constantes.afe;
  else if (dropList_Material.getSelectedText().equals("Ouro"))return Constantes.aau;
  else if (dropList_Material.getSelectedText().equals("Vidro"))return Constantes.av;
  else return 0.0;
}

// evento textfield - variacao  
public int variac() {
  int variacao = 0;
  variacao = int(textfield_VariacaoTemperatura.getText());
  return variacao;
}

// evento textfield - comprimento incic  
public int comprInicial() {
  int cInicial = 0;
  cInicial = int(textfield_ComprimentoInicial.getText());
  return cInicial;
}
// evento textfield - base 
public int baseInicial() {
  int bInicial = 0;
  bInicial = int(textfield_BaseInicial.getText());
  return bInicial;
}

// evento textfield - profundidade
public int profundidadeInicial() {
  int pInicial = 0;
  pInicial = int(textfield_ProfundidadeInicial.getText());
  return pInicial;
}

// evento button - desenhar
void desenha(GButton button, GEvent event) {
  if (button == desenhar && event == GEvent.CLICKED) {
    coef = coeficiente();
    variac = variac();
    clickou = true;
  }
}
//EVENTOS DE CAIXAS DE ENTRADA
//------------------------------------------------------------------------------------------------------------------------------------
void setup()
{
  background(#CCCCCC);
  size(500, 500);
  colorMode(HSB, 256, 256, 256);
  smooth();

  strokeWeight(5);

  createGUI();
}

void draw()
{
  if (radioL.isSelected()) {
    textfield_BaseInicial.setEnabled(false);
    textfield_ProfundidadeInicial.setEnabled(false);
    textfield_BaseInicial.setText("");
    textfield_ProfundidadeInicial.setText("");
  } else if (radioS.isSelected()) {
    textfield_BaseInicial.setEnabled(true);
    textfield_ProfundidadeInicial.setEnabled(false);
    textfield_ProfundidadeInicial.setText("");
  } else if (radioV.isSelected()) {
    textfield_BaseInicial.setEnabled(true);
    textfield_ProfundidadeInicial.setEnabled(true);
  }

  if (clickou && radioL.isSelected()) {
    if (!textfield_VariacaoTemperatura.getText().equals("") && !textfield_ComprimentoInicial.getText().equals("")) {
      textfield_BaseInicial.setEnabled(false);
      textfield_ProfundidadeInicial.setEnabled(false);
      background(#CCCCCC);
      l.desenha();
      l.atualizaL();
    } else if (textfield_VariacaoTemperatura.getText().equals("") || textfield_ComprimentoInicial.getText().equals("")) {
      fill(255, 0, 0);
      textSize(14);
      text("Campo Vazio!!", 10, 434);
      clickou = false;
      desenhar.setEnabled(true);
    }
  } else if (clickou && radioS.isSelected()) {
    if (!textfield_VariacaoTemperatura.getText().equals("") && !textfield_ComprimentoInicial.getText().equals("") 
      && !textfield_BaseInicial.getText().equals("") ) {
      textfield_BaseInicial.setEnabled(true);
      textfield_ProfundidadeInicial.setEnabled(false);
      background(#CCCCCC);
      r.desenha();
      r.atualizaL();
    } else if (textfield_VariacaoTemperatura.getText().equals("") || textfield_ComprimentoInicial.getText().equals("") 
      || textfield_BaseInicial.getText().equals("") ) {
      fill(255, 0, 0);
      textSize(14);
      text("Campo Vazio!!", 10, 434);
      clickou = false;
      desenhar.setEnabled(true);
    }
  } else if (clickou && radioV.isSelected()) {
    if (!textfield_VariacaoTemperatura.getText().equals("") && !textfield_ComprimentoInicial.getText().equals("") 
      && !textfield_BaseInicial.getText().equals("") &&  !textfield_ProfundidadeInicial.getText().equals("")) {
      textfield_BaseInicial.setEnabled(true);
      textfield_ProfundidadeInicial.setEnabled(true);
      background(#CCCCCC);
      atualizaV(baseInicial(), comprInicial(), profundidadeInicial(), variac());
    } else  if (textfield_VariacaoTemperatura.getText().equals("") || textfield_ComprimentoInicial.getText().equals("") 
      || textfield_BaseInicial.getText().equals("") ||  textfield_ProfundidadeInicial.getText().equals("")) {
      fill(255, 0, 0);
      textSize(14);
      text("Campo Vazio!!", 10, 434);
      clickou = false;
      desenhar.setEnabled(true);
    }
  }
}

public void click(GButton button, GEvent event) {
  if (button == desenhar && event == GEvent.CLICKED) {
    if (radioL.isSelected()) {
      l = new Linha(200, 10, 200, comprInicial());
      coef = coeficiente();
      variac = variac();
      cInicial = comprInicial();
      l.dilatarL(coef, variac, cInicial);
      background(#CCCCCC);
      clickou = true;
      desenhar.setEnabled(false);
    } else if (radioS.isSelected()) {
      r = new Retangulo(200, 10, baseInicial(), comprInicial());
      coef = coeficiente();
      variac = variac();
      cInicial = comprInicial();
      bInicial = baseInicial();
      r.dilatarS(coef, variac, bInicial, cInicial);
      background(#CCCCCC);
      clickou = true;
      desenhar.setEnabled(false);
    } else if (radioV.isSelected()) {
      coef = coeficiente();
      variac = variac();
      cInicial = comprInicial();
      background(#CCCCCC);
      clickou = true;
      desenhar.setEnabled(false);
    }
  }
}

void atualizaV(double baseInicial, double comprimentoInicial, double profundidadeInicial, double variac)
{
  fill(0);
  rect(200, 10, (float)baseInicial, (float)comprimentoInicial);
  clickou = false;
  desenhar.setEnabled(true);
  volume = (comprimentoInicial*baseInicial*profundidadeInicial) * (1 + coef * variac);
  textSize(14);
  text("Volume Final: " + nf((float)(volume)), 10, 410); 
  fill(0, 102, 153);
}