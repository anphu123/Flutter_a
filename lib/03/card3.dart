import 'package:flutter/material.dart';
import 'author_card.dart';


class Card3 extends StatelessWidget {
  const Card3({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      // 1
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        // 2
        child: const Column(
          children: [
            // TODO: Add author information
            AuthorCard(
              authorName: 'Mike Katz',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
            ),

            // TODO: Add Positioned text
          ],
        ),
      ),
    );
  }
}
