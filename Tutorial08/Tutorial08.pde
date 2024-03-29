Botao btSoma, btSubtrai, btMultiplica, btDivisao; //<>//
Entrada entValor1, entValor2;
Painel p, painelCalculadora;
Rotulo rotResultado;

class Principal extends IGU {
  
  void acao(Componente c) {
    String valor1 = entValor1.texto();
    String valor2 = entValor2.texto();
    float num1 = float (valor1);
    float num2 = float (valor2);

    float resultado = 0;
 
    if (c instanceof Botao) {
      if (c == btSoma) {
        resultado = num1 + num2;
      } else if (c == btSubtrai) {
        resultado = num1 - num2;
      } else if (c == btMultiplica) {
        resultado = num1 * num2;
      } else if (c == btDivisao) {
        resultado = num1 / num2;
      } 
      rotResultado.texto("=" + str (resultado));
    }
  }
}

IGU principal;

void setup() {
  size(1024, 768);

  // A classe Principal, descedente de IGU, é o componente principal que ocupa a área toda da aplicação.
  principal = new Principal();

  p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);

  p.fundo(color(238, 130, 238));
  
  painelCalculadora = new PainelCalculadora(p, 150, 120);
  painelCalculadora.fundo(color (240,128,128));
}

// A classe PainelCalculadora, descedente de Painel, é o componente que apresenta um novo painel na aplicação, onde a calculadora será exibida.
class PainelCalculadora extends Painel {
  PainelCalculadora(Painel pai, int x, int y) {
    //"super" é o método construtor da classe PainelCalculadora.
    super(pai, x, y, 600, 200);
    btSoma = new Botao("+", this, 215, 17, 30, 30);
    btSubtrai = new Botao("-", this, 215, 62, 30, 30);
    btMultiplica = new Botao("*", this, 215, 107, 30, 30);
    btDivisao = new Botao("/", this, 215, 152, 30, 30);
  
    entValor1 = new Entrada("Primeiro valor", this, 50, 93, 100, 20);
    entValor2 = new Entrada("Segundo valor", this, 305, 93, 100, 20);

    rotResultado = new Rotulo("=", this, 480, 88, 100, 30);
  }
}

void draw() {
  principal.redesenha();
}
