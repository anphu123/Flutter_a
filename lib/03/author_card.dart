import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatelessWidget {
  // 1
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  // 2
  @override
  Widget build(BuildContext context) {
    // TODO: Replace return Container(...);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        // TODO: Add alignment
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // 1
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 30,
              ),
              // 2
              const SizedBox(width: 8),
              // 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          // TODO: Add IconButton
          IconButton(
            // 4
              icon: const Icon(Icons.favorite_border),
              iconSize: 30,
              color: Colors.grey[400],
              // 5
              onPressed: () {
                const snackBar = SnackBar(content: Text('Favorite Pressed, da them vao danh sach yeu thich'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),

        ],
      ),
    );

  }
}
