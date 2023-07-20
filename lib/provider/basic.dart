import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  dynamic _name1;

  String get name => _name1;

  set name(newName) => _name1 = newName;
}

class BasicProvider extends StatelessWidget {
  const BasicProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var user = User();
    user.name = 'an phu test\n';

    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          DemoConsumerWidget(),
          DemoWithoutConsumerWidget(),
        ],
      ),
    );
  }
}

// sử dụng Consumer để lắng nghe và sử dụng dữ liệu từ Provide
class DemoConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      //todo:sử dụng builder để truy cập đối tượng User từ Provider<User>
      //Mỗi khi giá trị của đối tượng User thay đổi, builder sẽ được gọi và widget sẽ được cập nhật với dữ liệu mới.
      //Builder nhận vào ba tham số: context, user và child. Trong đó, user đại diện cho đối tượng User được lấy từ Provider,
      // và child đại diện cho widget con mà DemoConsumerWidget bao bọc.
      builder: (context, user, child) => Text(user.name),
    );
  }
}

//sử dụng Provider.of để truy cập đối tượng User từ Provider<User>
class DemoWithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todo: sử dụng Provider.of để lấy đối tượng User
    //Khi giá trị của đối tượng User thay đổi,
    //không được cập nhật tự động. Điều này có nghĩa là nếu giá trị của thuộc tính name thay đổi,
    // sẽ không nhận được cập nhật mới trừ khi build() của nó được gọi lại từ một sự kiện khác
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
}
