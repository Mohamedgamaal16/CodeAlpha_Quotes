import 'package:dartz/dartz.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/features/home/data/models/others_data_model.dart';
import 'package:quotes/features/home/data/models/quote_model.dart';
import 'package:quotes/features/home/data/models/random_quote_model.dart';
import 'package:quotes/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  Future<Either<String, QuoteModel>> getQuotes() async {
    try {
      final reponse = await api.get(EndPoint.quotes);
      final data = QuoteModel.fromJson(reponse);
      return right(data);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, RandomQuoteModel>> getRandomQuote() async {
    try {
      final reponse = await api.get(EndPoint.random);
      final data = RandomQuoteModel.fromJson(reponse);
      return right(data);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, OthersQuoteModel>> getOthersQuote(
      {required String quoteCategory}) async {
    try {
      final reponse = await api
          .get(EndPoint.search, queryParamters: {"query": quoteCategory});
      final data = OthersQuoteModel.fromJson(reponse);
      return right(data);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
