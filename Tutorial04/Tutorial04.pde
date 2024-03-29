// Criação dos quatro botões responsáveis pelas operações matemáticas (soma, subtração, multiplicação e divisão). //<>//
Botao btSoma, btSubtrai, btMultiplica, btDivisao;
// Criação das duas duas entradas, onde os números serão digitados.
Entrada entValor1, entValor2;
Painel p;
Rotulo rotResultado;

class Principal extends IGU {
  
  void acao(Componente c) {
    //Atribuição dos valores inseridos nas entradas de texto às strings valor1 e valor2.
    String valor1 = entValor1.texto();
    String valor2 = entValor2.texto();
    //Conversão das strings valor1 e valor2 num1 e num2, números reais (float).
    float num1 = float (valor1);
    float num2 = float (valor2);

    float resultado = 0;
    
    // Verifica se a ação gerada ocorreu em uma instância de Botao.
    if (c instanceof Botao) {
      // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("btSoma"), correspondendo à operação soma.
      if (c == btSoma) {
        // A variável resultado passa a armazenar o valor da soma de num1 e num2.
        resultado = num1 + num2;
        // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("btSubtrai"), correspondendo à operação subtração.
      } else if (c == btSubtrai) {
        // A variável resultado passa a armazenar o valor da subtração de num1 e num2.
        resultado = num1 - num2;
        // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("btMultiplica"), correspondendo à operação multiplicação.
      } else if (c == btMultiplica) {
        // A variável resultado passa a armazenar o valor da multiplicação de num1 e num2.
        resultado = num1 * num2;
        // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("btDivisao"), correspondendo à operação divisão.
      } else if (c == btDivisao) {
        // A variável resultado passa a armazenar o valor da divisão de num1 e num2.
        resultado = num1 / num2;
      } 
      // A função rotResultado.texto("=" + str(resultado)), além de converter o número inteiro resultado em string, exibe este valor no painel.
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
  
  // Atribuindo a btSoma, btSubtrai, btMultiplica e btDivisao os botões com os sinais matemáticos.
  btSoma = new Botao("+", p, 335, 35, 30, 30);
  btSubtrai = new Botao("-", p, 335, 80, 30, 30);
  btMultiplica = new Botao("*", p, 335, 125, 30, 30);
  btDivisao = new Botao("/", p, 335, 170, 30, 30);
  
  // Atribuindo a entValor1 e entValor2 os valores digitados.
  entValor1 = new Entrada("Primeiro valor", p, 170, 110, 100, 20);
  entValor2 = new Entrada("Segundo valor", p, 425, 110, 100, 20);

  rotResultado = new Rotulo("=", p, 600, 105, 100, 30);
}

void draw() {
  principal.redesenha();
}
