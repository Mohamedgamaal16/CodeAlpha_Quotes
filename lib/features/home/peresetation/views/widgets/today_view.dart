import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/home/peresetation/views/widgets/quotes_card_list.dart';
import 'package:quotes/features/home/peresetation/views/widgets/today_card.dart';


class TodayView extends StatelessWidget {
  const TodayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: TodayCard(
            quote:
                "Results! Why, man, I have gotten a lot of results. I know several thousand things that won't work.",
            authorName: "thomas-edison",
          ),
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
        const SliverFillRemaining(child: AspectRatio(aspectRatio: 1, child: QuotesCardList())),
      ],
    );
  }
}
