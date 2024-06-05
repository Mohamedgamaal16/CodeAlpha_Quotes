import 'package:flutter/material.dart';
import 'package:quotes/features/home/peresetation/views/widgets/quotes_card.dart';

class QuotesCardList extends StatelessWidget {
  const QuotesCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: QuotesCard(
                quote: "I never did a day's work in my life.  It was all fun",
                authorName: "thomas-edison"),
          );
        });
  }
}
