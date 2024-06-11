import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/utils/app_router.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/core/widgets/quotes_card.dart';
import 'package:quotes/features/authors/presentation/view/single_author_view.dart';
import 'package:quotes/features/authors/presentation/view_model/cubit/authors_cubit.dart';

class AuthorViewBody extends StatelessWidget {
  const AuthorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorsCubit, AuthorsState>(builder: (context, state) {
      if (state is AuthorsSuccess) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SingleAuthorDisplay(
                                  title: state.authorModel.results[index].name,
                                  subtitle: state.authorModel.results[index].description,
                                  description: state.authorModel.results[index].bio,
                                  link: state.authorModel.results[index].link,
                                )));
                      },
                      child: QuotesCard(
                        title: state.authorModel.results[index].name,
                        subTitle: state.authorModel.results[index].description,
                      ),
                    ),
                  );
                },
                childCount: state.authorModel.results.length,
              ),
            )
          ],
        );
      } else if (state is AuthorsFaliure) {
        return Center(child: Text(state.errMessage));
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
