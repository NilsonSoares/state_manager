import 'package:flutter/material.dart';
import 'package:state_manager/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // cria um controller do tipo inteiro para
  // controlar o valor do contador e iniciliza com zero
  final controller = Controller<int>(state: 0);

  void _increment(){
    // passa o novo estado para o método update, que internamente chama a
    // função _listenrs dentro do controller
    controller.update(controller.state + 1);
  }

  @override
  void initState() {
    super.initState();
    // vincula a função setState ao método _listeners do controler passando
    // o setState como parâmetro para o método listen
    controller.listen((_)=>setState((){}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Contador: ${controller.state}")// mostra o estado atual do contador na tela
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,// chama a função increment que chama update passando o novo estado
        child: Icon(Icons.add),
      ),      
    );
  }
}