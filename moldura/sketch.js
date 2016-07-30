var tartaruga;

function setup() {
  canvas = createCanvas(600, 400);
  canvas.position(10, 10);
  canvas.class("simulador");
  background(0);

  var largMenu = 170;
  var altMenu = 400;

  menu = createDiv();
  menu.position(width - largMenu + 10, height - altMenu + 10);
  menu.style("background-color", "#ffff00");
  menu.style("height", altMenu + "px");
  menu.style("width", largMenu + "px");
  menu.html("");
  menu.hide();

  abreMenu = createButton();
  abreMenu.position(570, 20);
  abreMenu.style("height", "25px");
  abreMenu.style("width", "25px");
  abreMenu.html("<img src=\"imagens/seta_esquerda.png\" style=\"margin-left: -5px; margin-top: -2px;\">");
  abreMenu.mousePressed(abre_menu);

  fechaMenu = createButton();
  fechaMenu.position(130, 10);
  fechaMenu.style("height", "25px");
  fechaMenu.style("width", "25px");
  fechaMenu.html("<img src=\"imagens/seta_direita.png\" style=\"margin-left: -8px; margin-top: -2px;\">");
  fechaMenu.mousePressed(fecha_menu);
  menu.child(fechaMenu);

  velocidade = createSlider(0, 100, 50);
  velocidade.position((width - velocidade.width) / 2, height - 20);
  tartaruga = createImg("imagens/tartaruga_branco.png");
  tartaruga.position((width - velocidade.width) / 2 - 25, height - 17);
  coelho = createImg("imagens/coelho_branco.png");
  coelho.position((width + velocidade.width) / 2, height - 17);

  caixa = createInput();
  caixa.position(20, 20);
}

function draw() {
  //background(0);
}

function abre_menu() {
  menu.show();
  abreMenu.hide();
  velocidade.position((width - velocidade.width - menu.width) / 2, height - 20);
  tartaruga.position((width - velocidade.width - menu.width) / 2 - 25, height - 17);
  coelho.position((width + velocidade.width - menu.width) / 2, height - 17);
}

function fecha_menu() {
  menu.hide();
  abreMenu.show();
  velocidade.position((width - velocidade.width) / 2, height - 20);
  tartaruga.position((width - velocidade.width) / 2 - 25, height - 17);
  coelho.position((width + velocidade.width) / 2, height - 17);
}