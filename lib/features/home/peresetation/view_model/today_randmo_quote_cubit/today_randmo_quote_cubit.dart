import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/home/data/models/random_quote_model.dart';
import 'package:quotes/features/home/data/repos/home_repo.dart';

part 'today_randmo_quote_state.dart';

class TodayRandmoQuoteCubit extends Cubit<TodayRandmoQuoteState> {
  TodayRandmoQuoteCubit(this.homeRepo) : super(TodayRandmoQuoteInitial());
  final HomeRepo homeRepo;

  getRandomQuote() async {
    emit(TodyRandomQuoteLoading());
    try {
      final quotes = await homeRepo.getRandomQuote();
      quotes.fold((faliure) => emit(TodyRandomQuoteFaliure(message: faliure)),
          (success) => emit(TodyRandomQuoteSuccess(quote: success)));
    } catch (e) {
      emit(TodyRandomQuoteFaliure(message: e.toString()));
    }
  }
}
