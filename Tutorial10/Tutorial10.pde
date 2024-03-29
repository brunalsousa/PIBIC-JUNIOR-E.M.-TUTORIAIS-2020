IGU principal; //<>//
Painel p, painelCalculadora;


void setup() {
  size(1024, 768);

  principal = new IGU();

  p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  p.fundo(color(238, 130, 238));

  painelCalculadora = new PainelCalculadora(p, 150, 120);
  painelCalculadora.fundo(color (240, 128, 128));
}

class PainelCalculadora extends Painel {
  BotaoEstado btSoma, btSubtrai, btMultiplica, btDivisao;
  Entrada entValor1, entValor2;
  Rotulo rotResultado;

  PainelCalculadora(Painel pai, int x, int y) {
    super(pai, x, y, 600, 200);
    //O Painel PainelEstados pe é o espaço onde os quatro botões da calculadora serão exibidos.
    //Caso um dos botões seja pressionado, um símbolo "x" aparecerá no botão selecionado, indicando a operação escolhida.
    //O Painel PainelEstados agrupa os BotaoEstado fazendo que apenas um permaneça selecionado.
    //Se botẽos BotaoEstado forem adicionados a uma instância de Painel (Não PainelEstados) vários BotaoEstado podem permanecer pressionados
    PainelEstados pe = new PainelEstados(this, 220, 65, 35, 80);
    btSoma = new BotaoEstado("+", pe, 0, 0, 150, 20);
    btSubtrai = new BotaoEstado("-", pe, 0, btSoma.y + btSoma.altu, 150, 20);
    btMultiplica = new BotaoEstado("*", pe, 0, btSubtrai.y + btSubtrai.altu, 150, 20);
    btDivisao = new BotaoEstado("/", pe, 0, btMultiplica.y + btMultiplica.altu, 150, 20);

    entValor1 = new Entrada("Primeiro valor", this, 50, 93, 100, 20);
    entValor2 = new Entrada("Segundo valor", this, 305, 93, 100, 20);

    rotResultado = new Rotulo("=", this, 480, 88, 100, 30);
  }

  //O tratamento de exceções pode estar dentro da classe do componente, como aqui que está no classe PainelCalculadora
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

void draw() {
  principal.redesenha();
}
