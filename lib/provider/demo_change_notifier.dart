import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvide
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  add1() {
    _count--;
    notifyListeners();
  }
}

class DemoChangeNotifierProvider extends StatelessWidget {
  const DemoChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      //cung cấp đối tượng Counter cho các widget con
      create: (context) => Counter(),
      //todo khi mà dùng builder thì loi,Từ phiên bản 4.0.0 trở đi, Provider không còn sử dụng builder mà thay vào đó sử dụng create.
      // để tạo một đối tượng Counter mới và chia sẻ nó với các widget con bên trong cây widget
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(
        context); //ấy đối tượng Counter đã được cung cấp từ Provider
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counter.count.toString(),
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  counter.add();
                },
                child: Text(
                  "Increment + ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  counter.add1();
                },
                child: Text(
                  "Increment - ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}

//todo Với sử dụng Provider, bạn có thể chia sẻ dữ liệu giữa các widget con một cách dễ dàng. Trong ví dụ này, đối tượng Counter
// được chia sẻ từ DemoChangeNotifierProvider xuống TestWidget. Khi phương thức add() trên đối tượng Counter được gọi và giá trị của thuộc tính _count thay đổi,
// widget Text sẽ tự động cập nhật để hiển thị giá trị mới, nhờ sự lắng nghe của Provider.
// Tương tự, khi bạn nhấn nút "Increment", widget ElevatedButton sẽ cập nhật để hiển thị giá trị mới và thông báo về sự thay đổi cho các widget con khác nếu có.
//todo Kết luận: Với provider, data sẽ có thể được thay đổi hoặc truyền từ widget
// này sang widget khác và khi thay đổi data trong model khai báo ChangeNotifier sẽ được cập nhật ở các Widget mà đăng kí model.
//Khi sử dụng Providerchỉ cần nhớ các bước quan trọng sau :
// 1. Khai báo thư viện provider trong pubspec.yaml
// 2. Triển khai các model với ChangeNotifier và insert : notifyListeners(); vào các hàm thực thi
// 3. Khai báo trong các widget cha ví dụ trong hàm main.dart với MyApp
//4. Khai báo tại các Widget mà bạn cần lấy dữ liệu của model hay muốn thêm sửa xoá nó
