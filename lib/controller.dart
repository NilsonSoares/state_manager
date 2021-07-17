class Controller<T> {
  // define um tipo genérico para a variáve de controle de estado
  T state;

  Function(T)? _listeners;

  // construtor
  Controller({
    required this.state,
  });

  // função que atribui a função passada como parâmetro a função privada _listeners
  void listen(Function(T) listener) {
    _listeners = listener;
  }

  //função que recebe o novo estado, atualiza o estado atual e chama a 
  //função _listeners passando o novo estado
  void update(T newState) {
    this.state = newState;
    if(_listeners != null) {
      _listeners!(this.state);
    }
  }
}
