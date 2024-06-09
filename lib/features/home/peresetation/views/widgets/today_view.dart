import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/peresetation/view_model/tody_quotes_cubit/tody_quotes_cubit.dart';
import 'package:quotes/features/home/peresetation/views/widgets/quotes_card_list.dart';
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
              QuotesCardList(
                quoteModel: state.quote,
               
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
