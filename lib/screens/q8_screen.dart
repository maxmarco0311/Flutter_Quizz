import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Question8Screen extends StatelessWidget {
  const Question8Screen({super.key});
  static const routeName = '/question8';
  @override
  Widget build(BuildContext context) {
    const String text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est.";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 8'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: const Row(
            children: [
              Icon(Icons.circle),
              // 使用Expanded包住Text，使其在Row中有明確的寬度（剩餘可用的寬度）
              Expanded(
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
