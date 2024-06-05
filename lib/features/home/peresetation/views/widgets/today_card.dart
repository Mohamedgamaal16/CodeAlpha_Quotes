import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({
    super.key,
    required this.quote,
    required this.authorName,
  });

  final String quote, authorName;

  @override
  Widget build(BuildContext context) {
    final double minHeight = MediaQuery.of(context).size.height * 0.5;

    return Stack(
      children: [
        // Gradient background
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
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
                      quote,
                      style: AppStyles.poppinsStyleregular30(context),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "- $authorName",
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                opacity: 0.3,
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
