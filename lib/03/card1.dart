import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO: Card1 Decorate Container
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 380,
          height: 550,
        ),
        decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mag1.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [//do bong
              BoxShadow(
                color: Colors.grey.withOpacity(1),//opacity toi da la 1
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(10, 10), // Điều chỉnh vị trí đổ bóng
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // TODO: Add a stack of text
        child: Stack(
          children: [
            // 8
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            // 9
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headline2,
              ),
            ),
            // 10
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
            ),
            // 11
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
