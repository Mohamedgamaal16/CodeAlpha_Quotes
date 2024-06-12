import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/core/widgets/quotes_card.dart';
import 'package:quotes/features/home/peresetation/view_model/search_cubit/search_cubit.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchCubit searchCubit;

  CustomSearchDelegate(
    this.searchCubit, {
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
  });

  final searchTerms = [
    // General Themes
    "Inspirational",
    "Motivational",
    "Success",
    "Wisdom",
    "Knowledge",
    "Learning",
    "Happiness",
    "Love",
    "Friendship",
    "Life",
    "Time",
    "Change",
    "Opportunity",
    "Perseverance",
    "Failure",
    "Peace",
    "Kindness",
    "Gratitude",
    "Legacy",
    "Future",

    // By Author
    "Famous people",
    "Historical figures",
    "Philosophers",
    "Scientists",
    "Writers",
    "Poets",
    "Leaders",
    "Entrepreneurs",
    "Artists",
    "Athletes",
    "Albert Einstein",
    "William Shakespeare",
    "Maya Angelou",
    "Nelson Mandela",
    "Mahatma Gandhi",
    "Winston Churchill",
    "Aristotle",
    "Plato",
    "Lao Tzu",
    "Confucius",

    // By Topic
    "Nature",
    "Work",
    "Money",
    "Education",
    "Technology",
    "Creativity",
    "Leadership",
    "Innovation",
    "Risk",
    "Adventure",
    "Failure",
    "Forgiveness",
    "Grief",
    "Loss",
    "Resilience",
    "Growth",
    "Self-improvement",
    "Confidence",
    "Fear",
    "Doubt",

    // By Emotion
    "Hopeful",
    "Encouraging",
    "Uplifting",
    "Funny",
    "Witty",
    "Sarcastic",
    "Thought-provoking",
    "Deep",
    "Moving",
    "Heartfelt",
    "Romantic",
    "Passionate",
    "Angry",
    "Frustrated",
    "Sad",
    "Melancholy",
    "Nostalgic",
    "Inspiring",
    "Empowering",
    "Transformational",

    // By Source
    "Movie",
    "Book",
    "Song lyrics",
    "Speeches",
    "TED Talks",
    "Proverbs",
    "Sayings",
    "Mottos",
    "Slogans",
    "Bible",
    "Quran",
    "Bhagavad Gita",
    "Ancient Greece",
    "Renaissance",
    "Historical events",
    "Scientific discoveries",
    "Social movements",
    "Technological advancements",
    "Business leaders",
    "Artists & musicians",
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white), // Search text color
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear, color: Colors.white))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 10),
        child: BlocConsumer<SearchCubit, SearchState>(
          bloc: searchCubit,
          listener: (context, state) {
            // context.read<SearchCubit>().displaySearchData(search: query);
          },
          builder: (context, state) {
            searchCubit.quoteSearch(searchItem: query);

            if (state is SearchSuccess) {
              return ListView.builder(
                  itemCount: state.othersQuoteModel.results.length,
                  itemBuilder: (itemBuilder, index) {
                    return Padding(
                        padding:
                            const EdgeInsets.only(bottom: 24.0, right: 32),
                        child: QuotesCard(
                            title:
                                state.othersQuoteModel.results[index].content,
                            subTitle: state
                                .othersQuoteModel.results[index].author));
                  });
            } else if (state is SearchFaliure) {
              return Text(state.errMessage, style: TextStyle(color: Colors.white));
            } else {
              return const Center(child: CustomLoadingIndicator());
            }
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filter = searchTerms.where((element) {
      return element.toLowerCase().contains(query.toLowerCase());
    }).toList();
    List<int> randomIndices =
        List<int>.generate(20, (index) => Random().nextInt(searchTerms.length));
    return Container(
      color: AppColors.kPrimaryColor,
      child: query == ""
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                int randomIndex = randomIndices[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      query = searchTerms[randomIndex];
                      showResults(context);
                    },
                    child: Text(
                      searchTerms[randomIndex],
                      style: AppStyles.poppinsStyleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              })
          : ListView.builder(
              itemCount: filter.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      query = filter[index];
                      showResults(context);
                    },
                    child: Text(
                      filter[index],
                      style: AppStyles.poppinsStyleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              }),
    );
  }
}
