Botao btMove; //<>//
Painel p, painel;

class Principal extends IGU {

  void acao(Componente c) {
    if (c instanceof Botao) {
      
      // Se o botão btMove for acionado pelo usuário
      if (c == btMove) { 
        int novoX = (int)random(10, 400);
        int novoY = (int)random(10, 400);
        
        // Posiciona o "painel" em uma nova posição aleatória
        painel.move(novoX, novoY);
      }
    }
  }
}

IGU principal;

void setup() {
  size(1024, 768);

  principal = new Principal();

  p = new Painel(principal, 5, 5, (int)Raiz.largura - 10, (int)Raiz.altura - 10);
  p.fundo(color(238, 130, 238));

  //O Painel painel é o espaço para receber outros componentes, inclusive outros paineis.
  painel = new Painel(p, 100, 120, 600, 200);
  painel.fundo(color(240, 128, 128));

  // Adiciona um botão ao painel "painel".
  // Ao ser acionado pelo usuário, a rotina acao() será executada e moverá o "painel".
  btMove = new Botao("Aperte aqui para mover o painel", painel, 10, 10, 220, 30);
}

void draw() {
  principal.redesenha();
}
