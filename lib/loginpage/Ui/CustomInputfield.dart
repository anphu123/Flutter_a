import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  Icon fieldIcon;
  String hintText;

  CustomInputField(this.fieldIcon,this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Material(
        elevation: 5,
        color: Colors.deepOrange,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: fieldIcon
            ), //tạo icon
            SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  // TODO  tạo edittext
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 15,
                      )),
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
