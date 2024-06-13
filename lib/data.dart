import 'package:flutter_quizz/Models/griditem_model.dart';

String fakeAPIRequest() {
  return jsonString!;
}

String? jsonString = '''
  {
    "data": [
      {"name": "Alice Johnson", "email": "alice.johnson@example.com", "imagePath":"assets/images/1.jpg"},
      {"name": "Bob Smith", "email": "bob.smith@example.com", "imagePath":"assets/images/2.jpeg"},
      {"name": "Carol White", "email": "carol.white@example.com", "imagePath":"assets/images/3.jpeg"},
      {"name": "David Brown", "email": "david.brown@example.com", "imagePath":"assets/images/1.jpg"},
      {"name": "Emma Davis", "email": "emma.davis@example.com", "imagePath":"assets/images/2.jpeg"},
      {"name": "Frank Moore", "email": "frank.moore@example.com", "imagePath":"assets/images/3.jpeg"},
      {"name": "Grace Lee", "email": "grace.lee@example.com", "imagePath":"assets/images/1.jpg"},
      {"name": "Henry Wilson", "email": "henry.wilson@example.com", "imagePath":"assets/images/2.jpeg"},
      {"name": "Isla Taylor", "email": "isla.taylor@example.com", "imagePath":"assets/images/3.jpeg"}
    ],
    "response": "Success"
  }
  ''';

const List<GridItem> gridItemData = [
  GridItem(imagePath: 'assets/images/1.jpg', name: 'User 1'),
  GridItem(imagePath: 'assets/images/2.jpeg', name: 'User 2'),
  GridItem(imagePath: 'assets/images/3.jpeg', name: 'User 3'),
  GridItem(imagePath: 'assets/images/1.jpg', name: 'User 4'),
  GridItem(imagePath: 'assets/images/2.jpeg', name: 'User 5'),
  GridItem(imagePath: 'assets/images/3.jpeg', name: 'User 6'),
  GridItem(imagePath: 'assets/images/1.jpg', name: 'User 7'),
  GridItem(imagePath: 'assets/images/2.jpeg', name: 'User 8'),
  GridItem(imagePath: 'assets/images/3.jpeg', name: 'User 9'),
  GridItem(imagePath: 'assets/images/1.jpg', name: 'User 10'),
];
