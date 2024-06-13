import 'package:flutter/material.dart';

class Question9Screen extends StatelessWidget {
  const Question9Screen({super.key});
  static const routeName = '/question9';
  @override
  Widget build(BuildContext context) {
    List<String> countryList = [
      'United States',
      'China',
      'India',
      'Brazil',
      'United Kingdom',
      'France',
      'Germany',
      'Japan',
      'Canada',
      'Australia'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 9'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        // 使用Wrap而非Row，才會自動將超出螢幕範圍的widget換行
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: countryList.map((country) {
            return Chip(
              label: Text(country),
              backgroundColor: Colors.grey,
              labelStyle: const TextStyle(color: Colors.white),
            );
          }).toList(),
        ),
      ),
    );
  }
}
