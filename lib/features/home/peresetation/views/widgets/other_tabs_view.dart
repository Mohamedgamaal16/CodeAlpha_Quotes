import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/features/home/peresetation/view_model/others_quote_cubit/others_quote_cubit.dart';
import 'package:quotes/core/widgets/quotes_card.dart';

class OtherTabsView extends StatelessWidget {
  const OtherTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersQuoteCubit, OthersQuoteState>(
      builder: (context, state) {
        if (state is OthersQuotesSuccess) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QuotesCard(
                        title: state.quote.results[index].content,
                        subTitle: state.quote.results[index].author,
                      ),
                    );
                  },
                  childCount: state.quote.results.length,
                ),
              ),
            ],
          );
        } else if (state is OthersQuotesFaliure) {
          return Center(child: Text(state.message));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
