import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/data/models/quote_model.dart';
import 'package:quotes/features/home/data/repos/home_repo.dart';

part 'others_quote_state.dart';

class OthersQuoteCubit extends Cubit<OthersQuoteState> {
  OthersQuoteCubit(this.homeRepo) : super(OthersQuoteInitial());
  final HomeRepo homeRepo;

  getOthersQuotes({required String quoteCategory}) async {
    emit(OthersQuotesLoading());
    try {
      final quotes =
          await homeRepo.getOthersQuote(quoteCategory: quoteCategory);
      quotes.fold((faliure) => emit(OthersQuotesFaliure(message: faliure)),
          (success) => emit(OthersQuotesSuccess(quote: success)));
    } catch (e) {
      emit(OthersQuotesFaliure(message: e.toString()));
    }
  }
}
