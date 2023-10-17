import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is HomeChef FoodLink?',
      answer: 'It is our app under development',
    ),
    FAQItem(
      question: 'Who are developers?',
      answer: 'Abbas Ahmed and Akhter Ali.',
    ),
    // Add more FAQ items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView(
        children: faqItems.map((item) {
          return FAQItemWidget(item: item);
        }).toList(),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQItemWidget extends StatelessWidget {
  final FAQItem item;

  FAQItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        item.question,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            item.answer,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}