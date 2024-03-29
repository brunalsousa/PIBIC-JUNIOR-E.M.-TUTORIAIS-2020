Botao b;
Entrada e;
Painel p;

class Principal extends IGU {
  void acao(Componente c) {
    if (c instanceof Botao) {
      if (c == b) {
        // A função p.fundo(color(valor,valor,valor)); altera a cor do painel caso o componente Botao seja pressionado.
        p.fundo(color(0,191,255));
      }      
    } else if (c instanceof Entrada) {
      if (c == e) {
        // A função p.fundo(color(valor,valor,valor)); altera a cor do painel caso o componente Entrada seja preenchido e a tecla <enter> pressionada.
        p.fundo(color(238,130,238));
      }
    }
  }
}

IGU principal;

void setup() {
  size(1024, 768);

  // A classe Principal, descedente de IGU, é o componente principal que ocupa a área toda da aplicação.
  principal = new Principal();

  p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  
  new Rotulo("A cada ação, observe o console do Processing.", p, 5, 5, 280, 30);

  b = new Botao("Pressione aqui.", p, 5, 35, 100, 30);

  Rotulo r = new Rotulo("Entrada de Texto:", p, 5, 75, 120, 20);

  e = new Entrada("Digite um texto aqui e aperte o <Enter>", p, r.x + r.larg, 75, 250, 20);
}
 
void draw() {
  principal.redesenha();
}
