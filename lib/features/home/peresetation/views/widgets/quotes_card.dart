import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class QuotesCard extends StatelessWidget {
  const QuotesCard({
    super.key,
    required this.quote,
    required this.authorName,
  });

  final String quote, authorName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Container
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Quote text
                Text(
                  quote,
                  style: AppStyles.poppinsStyleregular20(context),
                ),
                const SizedBox(height: 10),
                // Author name
                Text(
                  '- $authorName',
                  style: AppStyles.poppinsStyleMedium12(context).copyWith(color: AppColors.kPrimaryColor),
                ),
              ],
            ),
          ),
        ),

        // Quote Image
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage("assets/images/quote.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
