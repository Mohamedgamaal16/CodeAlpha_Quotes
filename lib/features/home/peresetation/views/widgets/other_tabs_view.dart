import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/features/home/peresetation/view_model/others_quote_cubit/others_quote_cubit.dart';
import 'package:quotes/features/home/peresetation/views/widgets/others_card.dart';

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
              OthersQuotesCardList(
                quoteModel: state.quote
               
           ) ],
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
