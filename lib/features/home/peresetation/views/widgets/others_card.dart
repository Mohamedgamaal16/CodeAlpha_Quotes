import 'package:flutter/material.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/data/models/quote_model.dart';
import 'package:quotes/features/home/peresetation/views/widgets/quotes_card.dart';

class OthersQuotesCardList extends StatelessWidget {
  const OthersQuotesCardList({super.key, required this.quoteModel});
final OthersQuoteModel quoteModel;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuotesCard(
              quote: quoteModel.results[index].content,
              authorName: quoteModel.results[index].author,
            ),
          );
        },
        childCount: quoteModel.results.length,
      ),
    );
  }
}
