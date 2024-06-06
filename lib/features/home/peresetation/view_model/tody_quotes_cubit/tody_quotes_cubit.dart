import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/home/data/models/quote_model.dart';
import 'package:quotes/features/home/data/models/random_quote_model.dart';
import 'package:quotes/features/home/data/repos/home_repo.dart';

part 'tody_quotes_state.dart';

class TodyQuotesCubit extends Cubit<TodyQuotesState> {
  TodyQuotesCubit(this.homeRepo) : super(TodyQuotesInitial());
  final HomeRepo homeRepo;

  getTodyQuotes() async {
    emit(TodyQuotesLoading());
    try {
      final quotes = await homeRepo.getQuotes();
      quotes.fold((faliure) => emit(TodyQuotesFaliure(message: faliure)),
          (success) => emit(TodyQuotesSuccess(quote: success)));
    } catch (e) {
      emit(TodyQuotesFaliure(message: e.toString()));
    }
  }
  
}
