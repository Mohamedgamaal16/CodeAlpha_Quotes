import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  quoteSearch({required String searchItem}) async {
    try {
      final response = await homeRepo.quoteSearch(searchItem: searchItem);
      response.fold((faliure) => emit(SearchFaliure(errMessage: faliure)),
          (success) => emit(SearchSuccess(othersQuoteModel: success)));
    } catch (e) {
      emit(SearchFaliure(errMessage: e.toString()));
    }
  }
}
