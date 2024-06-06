import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/features/home/peresetation/view_model/today_randmo_quote_cubit/today_randmo_quote_cubit.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double minHeight = MediaQuery.of(context).size.height * 0.5;

    return BlocBuilder<TodayRandmoQuoteCubit, TodayRandmoQuoteState>(
      builder: (context, state) {
        if (state is TodyRandomQuoteSuccess) {
          return Stack(
            children: [
              // Gradient background
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: minHeight),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/background1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 55),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            state.quote.content,
                            style: AppStyles.poppinsStyleregular30(context),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "- ${state.quote.author}",
                          style: AppStyles.poppinsStyleMedium16(context)
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
    
              // Quote image
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/images/quote.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else   {
          return Text("Try Again"); // Return an empty container when the state is not TodyRandomQuoteSuccess
        }
      },
    );
  }
}
