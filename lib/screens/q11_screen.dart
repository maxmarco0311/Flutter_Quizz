import 'package:flutter/material.dart';
import 'package:flutter_quizz/Models/griditem_model.dart';
import 'package:flutter_quizz/data.dart';

class Question11Screen extends StatelessWidget {
  const Question11Screen({super.key});
  static const routeName = '/question11';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 11'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.3,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  GridItem item = gridItemData[index];
                  return GridTile(
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(item.name),
                      ],
                    ),
                  );
                },
                childCount: gridItemData.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
