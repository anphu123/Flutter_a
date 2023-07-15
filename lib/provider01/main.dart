import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    //_ tương đương context
    create: (_) => CounterProvider(),
    child: MaterialApp(
      home: CounterApp(),
    ),
  ));
}

class CounterProvider extends ChangeNotifier {
  //biến có dấu _là biến riêng tư
  int _counter = 1000;
  int _a=10;

  //vì là biến riêng tư nên thêm hàm getdata
  int get counter => _counter;
  int get a => _a;

  //thêm giá trị cho biến _counter
  void add() {
    _counter++;
    //thông báo sự thay đổi
    notifyListeners();
  }
  void remove() {
    _a--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "provider\n\n"+
          context.watch<CounterProvider>().counter.toString()+"\n"
          +context.watch<CounterProvider>().a.toString(),
          style: TextStyle(fontSize: 50),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
          context.read<CounterProvider>().remove();
        },
      ),
    );
  }
}
