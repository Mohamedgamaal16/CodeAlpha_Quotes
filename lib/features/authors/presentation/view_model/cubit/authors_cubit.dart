import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/authors/data/model/author_model.dart';
import 'package:quotes/features/authors/data/repos/author_repo.dart';

part 'authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit(this.authorRepo) : super(AuthorsInitial());
  final AuthorRepo authorRepo;

  fetchAuthors() async {
    try {
      emit(AuthorsLoading());
      final response = await authorRepo.fetchAuthors();
      response.fold(
        (error) => emit(AuthorsFaliure(errMessage: error)),
        (succcess) => emit(AuthorsSuccess(authorModel: succcess)),
      );
    } catch (e) {
      AuthorsFaliure(errMessage: e.toString());
    }
  }
}
