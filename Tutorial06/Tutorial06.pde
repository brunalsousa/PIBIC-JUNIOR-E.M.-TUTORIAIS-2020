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

  principal = new Principal();

  p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  p.fundo(color(238, 130, 238));
  
  //O Painel painelCalculadora é o espaço para os componentes da calculadora.
  painelCalculadora = new Painel(p, 100, 120, 600, 200);
  painelCalculadora.fundo(color (240,128,128));
  
  //painelCalculadora (segundo parâmetro de cada componente) é pai dos componentes (botões, entradas e rótulo) da calculadora.
  //assim, se painelCalculadora for reposicionado todos os seus filhos são "carregados" com ele
  btSoma = new Botao("+", painelCalculadora, 200, 17, 30, 30);
  btSubtrai = new Botao("-", painelCalculadora, 200, 62, 30, 30);
  btMultiplica = new Botao("*", painelCalculadora, 200, 107, 30, 30);
  btDivisao = new Botao("/", painelCalculadora, 200, 152, 30, 30);
  
  entValor1 = new Entrada("Primeiro valor", painelCalculadora, 50, 110, 100, 20);
  entValor2 = new Entrada("Segundo valor", painelCalculadora, 280, 110, 100, 20);

  rotResultado = new Rotulo("=", painelCalculadora, 470, 105, 100, 30);
}

void draw() {
  principal.redesenha();
}
