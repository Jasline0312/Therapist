import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'custom_app_bar.dart';

class PositiveQuotes extends StatefulWidget {
  const PositiveQuotes({Key? key}) : super(key: key);

  @override
  _PositiveQuotesState createState() => _PositiveQuotesState();
}

class _PositiveQuotesState extends State<PositiveQuotes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
        body: SizedBox.expand(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("lib/assets/background_image.png"),
    fit: BoxFit.cover,
    ),
    ),
    child: Column(
    children: [
    CustomAppBar(title: 'Positive Quotes'),
      Expanded(child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
    ],
    ),
        ),
    ),
    ),
    );
  }
}

class Post {
  final String id;
  final String imageUrl;

  Post(
      this.id,
      this.imageUrl,
      );
}

final List<Post> posts = [
  Post(
    'id0',
    'lib/assets/PositiveQuotes1.png',
  ),
  Post(
    'id1',
    'lib/assets/PositiveQuotes2.png',
  ),
  Post(
    'id2',
    'lib/assets/PositiveQuotes4.png',
  ),
  Post(
    'id3',
    'lib/assets/PositiveQuotes3.png',
  ),
  Post(
    'id4',
    'lib/assets/PositiveQuotes5.png',
  ),
  Post(
    'id5',
    'lib/assets/PositiveQuotes6.png',
  ),
  Post(
    'id6',
    'lib/assets/PositiveQuotes7.png',
  ),
  Post(
    'id7',
    'lib/assets/PositiveQuotes9.png',
  ),
  Post(
    'id8',
    'lib/assets/PositiveQuotes8.png',
  ),
  Post(
    'id9',
    'lib/assets/PositiveQuotes10.png',
  ),
];


