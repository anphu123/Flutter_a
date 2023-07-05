import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/02/Recipe.dart';
import 'Recipe.dart';
import 'Recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.blueGrey,
//           child: ListView.builder(
//             // 5
//             itemCount: Recipe.samples.length,
//             // 6
//             itemBuilder: (BuildContext context, int index) {
//               // 7
//               // TODO: Update to return Recipe card
//               return Container(
//                 width: 200,
//                 height: 200,
//                 padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       offset: Offset(2, 2),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: Image.asset(
//                   Recipe.samples[index].hinh,
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           color: Colors.brown,
//           child: ListView.builder(
//             itemCount: Recipe.samples.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Card(
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         Recipe.samples[index].hinh,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: 200,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           color: Colors.black.withOpacity(0.6),
//                           child: Text(
//                             Recipe.samples[index].ten,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return buildRecipeCard(Recipe.samples[index]);
            }),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  // 1
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    // 2
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        // 3
        children: <Widget>[
          // 4
          Image(image: AssetImage(recipe.hinh)),
          // 5
          Text(
            recipe.ten,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    ),
  );
}
