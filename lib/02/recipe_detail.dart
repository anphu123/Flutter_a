import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.ten),
        backgroundColor: Colors.lightBlueAccent,
      ),

      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[

            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.hinh),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6

            Text(
              widget.recipe.ten,
              style: const TextStyle(fontSize: 18),
            ),
            // 7
            Expanded(
              // 8
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // 9
                  return Text('${ingredient.quantity * _sliderVal} '
                      '${ingredient.measure} '
                      '${ingredient.name}');
                },
              ),
            ),
            //hien thi thanh trượt
            Slider(
              //Slider là một widget tương tác phổ biến trong Flutter, cho phép người dùng lựa chọn giá trị từ một dải giá trị xác định.
              min: 1,
              //tối thiểu 1 phần
              max: 15,
              // tối đa 15 phần
              divisions: 5,
              // chia thanh trượt thành 5 phần bằng nhau
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              //sử dụng ,toDouble vì thuộc tính value trong Slider yêu cầu giá trị double
              onChanged: (newValue) {
                //là một hàm callback được gọi khi giá trị của thanh trượt thay đổi
                setState(() {
                  //phương thức setState() được gọi để cập nhật giao diện người dùng
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              // xác định màu sắc của phần trượt và nhãn khi thanh trượt được chọn.
              inactiveColor: Colors.black,
              //xác định màu sắc của phần trượt và nhãn khi thanh trượt không được chọn.
            ),
          ],
        ),
      ),
    );
  }
}
