import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/home/data/repos/home_repo_impl.dart';
import 'package:quotes/features/home/peresetation/view_model/others_quote_cubit/others_quote_cubit.dart';
import 'package:quotes/features/home/peresetation/view_model/today_randmo_quote_cubit/today_randmo_quote_cubit.dart';
import 'package:quotes/features/home/peresetation/view_model/tody_quotes_cubit/tody_quotes_cubit.dart';
import 'package:quotes/features/home/peresetation/views/widgets/custom_app_bar.dart';
import 'package:quotes/features/home/peresetation/views/widgets/other_tabs_view.dart';
import 'package:quotes/features/home/peresetation/views/widgets/today_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const CustomAppBar(title: "Quotes"),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15, top: 20),
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => TodyQuotesCubit(HomeRepoImpl(
                          api: DioConsumer(
                              dio: Dio(), baseUrl: EndPoint.quotebaseUrl,quoteSever: true)))
                        ..getTodyQuotes(),
                    ),
                    BlocProvider(
                      create: (context) => TodayRandmoQuoteCubit(HomeRepoImpl(
                          api: DioConsumer(
                              dio: Dio(), baseUrl: EndPoint.quotebaseUrl,quoteSever: true)))
                        ..getRandomQuote(),
                    ),
                  ],
                  child: const TodayView(),
                ),
              ),
              BlocProvider(
                create: (context) => OthersQuoteCubit(HomeRepoImpl(
                    api: DioConsumer(quoteSever: true,
                        dio: Dio(), baseUrl: EndPoint.quotebaseUrl,)))
                  ..getOthersQuotes(quoteCategory: "most"),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 15, top: 20),
                  child: OtherTabsView(),
                ),
              ),
              BlocProvider(
                create: (context) => OthersQuoteCubit(HomeRepoImpl(
                    api: DioConsumer(quoteSever: true,
                        dio: Dio(), baseUrl: EndPoint.quotebaseUrl,)))
                  ..getOthersQuotes(quoteCategory: "happy"),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 15, top: 20),
                  child: OtherTabsView(),
                ),
              ),
              BlocProvider(
                create: (context) => OthersQuoteCubit(HomeRepoImpl(
                    api: DioConsumer(
                        dio: Dio(), baseUrl: EndPoint.quotebaseUrl, quoteSever: true)))
                  ..getOthersQuotes(quoteCategory: "bad"),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 15, top: 20),
                  child: OtherTabsView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
