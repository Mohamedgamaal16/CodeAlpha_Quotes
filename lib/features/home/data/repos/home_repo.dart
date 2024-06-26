import 'package:dartz/dartz.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/data/models/quote_model.dart';
import 'package:quotes/features/home/data/models/random_quote_model.dart';

abstract class HomeRepo {
  Future<Either<String, QuoteModel>> getQuotes();
  Future<Either<String, RandomQuoteModel>> getRandomQuote();
    Future<Either<String, OthersQuoteModel>> getOthersQuote({required String quoteCategory});
        Future<Either<String, OthersQuoteModel>> quoteSearch({required String searchItem});


}
