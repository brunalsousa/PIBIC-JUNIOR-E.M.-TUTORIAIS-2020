Botao b;
Entrada e;

class Principal extends IGU {
  // A função void acao é responsável pelo tratamento de ações dos componentes presentes no programa.
  void acao(Componente c) {
    // Verifica se a ação gerada ocorreu em uma instância de Botao
    if (c instanceof Botao) {
      // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("b"), reage à ação
      if (c == b) {
        println("Botao pressionado. Texto digitado na extrada: " + e.texto());
      }      
    // Verifica se a ação gerada ocorreu em uma instância de Entrada
    } else if (c instanceof Entrada) {
      // Verifica se a instância  que recebeu a ação ("c") é a instância do Botao ("b"), reage à ação
      if (c == e) {
        println("Texto digitado na extrada: " + e.texto());
      }
    }
  }
}

IGU principal;

void setup() {
  size(1024, 768);

  // A classe Principal, descedente de IGU, é o componente principal que ocupa a área toda da aplicação.
  principal = new Principal();

  Painel p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  
  new Rotulo("A cada ação, observe o console do Processing.", p, 5, 5, 280, 30);

  b = new Botao("Pressione aqui.", p, 5, 35, 100, 30);

  Rotulo r = new Rotulo("Entrada de Texto:", p, 5, 75, 120, 20);

  e = new Entrada("Digite um texto aqui e aperte o <Enter>", p, r.x + r.larg, 75, 250, 20);
}
 
void draw() {
  principal.redesenha();
}
