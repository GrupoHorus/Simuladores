class Vetores extends PVector {

  private float x;
  private float y;
  private float magnitude;

  Vetores() {
    super();
    setX(0);
    setY(0);
  }

  Vetores(float x, float y) {
    super(x, y);
  }
 
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  float getAngulo(PVector v1, PVector v2) {   //recebe dois vetores e calcula angulo
    return angleBetween(v1, v2);
  }
  
  PVector getAngulo(float angulo){  //recebe angulo e cria vetor
    return fromAngle(angulo);
  }

  float getIntensidade(PVector vetor){
    return vetor.mag(); //magnitude do vetor = intensidade
  }
  
  void setIntensidade(float intensidade){
    //this.setMag(intensidade); 
    magnitude = intensidade;
  }
  
  float forcaResultante(float angulo, PVector a, PVector b){
    float magA = a.mag();
    float magB = b.mag();
    return sqrt(magA*magA + magB*magB - 2*magA*magB*cos(angulo));
  }
  
  float anguloRotacao(PVector v){ //retorna angulo de rotacao
    return v.heading();
  }
  
  PVector rodaVetor(float angulo){ //retorna vetor com as diretrizes determinadas pelo angulo
    return rotate(angulo);
  }
  
  
  
}