IGU principal;

void setup() {
  size(600, 600);

  // A classe IGU é o componente principal que ocupa a área toda da aplicação.
  principal = new IGU(1024,768);

  // O Painel é um componente, onde componentes (Botões, Rótulos, Entradas e outros Paineis) podem ser inseridos.
  Painel p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  
  // A classe Rótulo pode ser usada para mostrar textos fixos durante a execução de um programa.
  new Rotulo("Exemplo de Texto Fixo", p, 5, 5, 220, 30);

  // A classe Botão cria um botão que pode ser acionado pelo usuário.
  new Botao("Botão", p, 5, 35, 100, 30);

  Rotulo r = new Rotulo("Entrada de Texto:", p, 5, 75, 120, 20);

  // A classe Entrada permite que o usuário digite uma linha texto.
  new Entrada("Campo de entrada de texto", p, r.x + r.larg, 75, 165, 20);
}
 
void draw() {
  // O método redesenha() redesenha todos os componentes visíveis da IGU.
  principal.redesenha();
}
