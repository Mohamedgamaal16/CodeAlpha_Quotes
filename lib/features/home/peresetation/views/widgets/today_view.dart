import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/features/home/peresetation/view_model/tody_quotes_cubit/tody_quotes_cubit.dart';
import 'package:quotes/core/widgets/quotes_card.dart';
import 'package:quotes/features/home/peresetation/views/widgets/today_card.dart';

class TodayView extends StatelessWidget {
  const TodayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodyQuotesCubit, TodyQuotesState>(
      builder: (context, state) {
        if (state is TodyQuotesSuccess) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: TodayCard(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "For you Quotes",
                      style: AppStyles.poppinsStyleSemiBold16(context)
                          .copyWith(color: const Color(0xff68738D)),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
               SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuotesCard(
              title: state.quote.results[index].content ,
              subTitle: state.quote.results[index].author,
            ),
          );
        },
        childCount: state.quote.results.length,
      ),
    ),
            ],
          );
        } else if (state is TodyQuotesFaliure) {
          return Center(child: Text(state.message));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
